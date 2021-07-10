<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Quiz;
use App\Models\Participant;
use Auth;
use App\Models\Subject;
use App\Models\Topic;
use App\Models\QuizQuestion as QQ;
use App\Models\QuizAnswer as QA;

class QuizController extends BaseController
{
	public function __construct()
    {
        $this->middleware('auth');
    }

    public function list()
    {
    	$participant = Participant::where('user_id',Auth::user()->id)->first();
    	$quiz = Quiz::where('created_by',Auth::user()->id)->get();
        // dd($quiz);
    	return view('quiz_list',compact('quiz','participant'));
    }

    public function add()
    {
    	$subjects = Subject::all();
        // dd($subjects);
    	return view('add_quiz',compact('subjects'));
    }

    public function save(Request $request)
    {
    	$data = $request->all();
        // dd($data);
    	$quiz = new Quiz();
    	$quiz->title = $data['title'];
        $quiz->subject_id = $data['subject_id'];
    	$topic = Topic::where('subject_id',$data['subject_id'])->where('name',$data['topic'])->first();
        
        if(!empty($topic))
        {
            $quiz->topic_id = $topic->id;
        }
    	$quiz->created_by = Auth::user()->id;
    	$quiz->maximum_quiz = $data['maximum_quiz'];
    	$quiz->description = $data['description'];
    	// dd($quiz);
    	if($quiz->save())
    	{
    		return redirect()->route('quiz.question.add',$quiz->id);
    	}else return redirect()->back();


    }

    public function question_add(Request $request)
    {
    	$id = $request->id;

        $quiz = Quiz::findOrFail($id);
        $questions = QQ::where('quiz_id',$quiz->id)->get();

        if(!empty($quiz))
        {
            $qs = [];
            
            if(count($questions) <= 0)
            {
                for ($i=1; $i <= $quiz->maximum_quiz ; $i++) { 
                    $q = [
                        'question_type' => 1,
                        'quiz_id' => $quiz->id,
                        'question' => '',
                        'option_a' => '',
                        'option_b' => '',
                        'option_c' => '',
                        'option_d' => '',
                        'answer' => '',
                        'point' => 1
                    ];

                    array_push($qs, $q);
                }

               if(!empty($qs))  QQ::insert($qs);
            }
           return view('add_question',compact('questions','quiz'));
        }else return redirect()->back();
    }

    public function question_save(Request $request)
    {
        $data = $request->all();
        // dd($data);

        $questions = QQ::where('quiz_id',$data['quiz_id'])->get();

        foreach ($questions as $key => $q) {
            $q->question = !empty($data['question'][$q->id])?$data['question'][$q->id]:'';
            $q->option_a = $data['option_a'][$q->id];
            $q->option_b = $data['option_b'][$q->id];
            $q->option_c = $data['option_c'][$q->id];
            $q->option_d = $data['option_d'][$q->id];
            $q->answer = isset($data['answer_quiz'])&& isset($data['answer_quiz'][$q->id])?$data['answer_quiz'][$q->id]:'';
            $q->save();
        }

        return redirect()->route('quiz.list');

    }

    public function delete(Request $request)
    {
        if(!empty($request->id))
        {
            Quiz::findOrFail($request->id)->delete();

            return redirect()->route('quiz.list');
        }
    }

    public function quiz_test(Request $request)
    {
        if(empty($request->id)) return redirect()->back();

        $quiz = Quiz::with('quiz_questions')->where('id',$request->id)->first();
        $asMentor = Participant::where('user_id',Auth::user()->id)->where('is_mentor',1)->first();

        $question_ids = QQ::select('id')->where('quiz_id',$quiz->id)->get()->toArray();
        $ids = [];
        $user_answer = [];

        foreach ($question_ids as $key => $id) {
            array_push($ids, $id['id']);
        }

        $answers = QA::whereIn('question_id',$ids)->with('question','user')->get()->groupBy('user_id');
        
        foreach ($answers as $key => $user) {
            $true_answer = 0;
              foreach ($user as $key => $answer) {
                   if($answer->answer == $answer->question->answer) $true_answer +=1;
              }
              $user_answer[$answer->user->name] = $true_answer;
        }
        $hasAnswer = $quiz->quiz_questions->whereIn('id',$ids)->where('user_id',Auth::user()->id)->first();
        return view('quiz_test',compact('quiz','hasAnswer','asMentor','user_answer'));
    }

    public function save_answer(Request $request)
    {
        $data = $request->all();

        if(count($data['answer_quiz']) > 1)
        {
            $answers = [];
            foreach ($data['answer_quiz'] as $key => $answer) {
                $answer = [
                    'question_id' => $key,
                    'user_id' => Auth::user()->id,
                    'answer' => $answer
                ];

                array_push($answers, $answer);
            }

            QA::insert($answers);

            return redirect()->back();
        }
    }

}
