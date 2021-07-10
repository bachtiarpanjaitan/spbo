@extends('layouts.app')

@section('content')
	<div class="container-fluid">
		<form action="{{route('quiz.answer')}}" method="POST">
			@csrf
			<div class="col-md-12 row">
				<div class="col-md-12">
					<p class="text-danger"><span class="fa fa-info-circle"></span> Klik pada nomor soal untuk membuka soal.</p>
				</div>
				<div class="col-md-10">
					<div class="card">
					  <div class="card-header">
					    Pertanyaan
					  </div>
					  <div class="card-body">
					    @foreach($quiz->quiz_questions as $key => $q)

							<blockquote id="q-{{$q->id}}" class="questions" style="display: none">
								<h5 class="card-title">SOAL #{{$key+1}}</h5>
								<p>{{$q->question}}</p>
								@if(empty($q->question)) @continue;
								@endif
								@if(!empty($q->option_a))
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="answer_quiz[{{$q->id}}]" value="A">
									  <label class="form-check-label" for="answer_quiz[{{$q->id}}]">A. {{$q->option_a}}</label>
									</div>
								@endif
								@if(!empty($q->option_b))
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="answer_quiz[{{$q->id}}]" value="B">
									  <label class="form-check-label" for="answer_quiz[{{$q->id}}]">B. {{$q->option_b}}</label>
									</div>
								@endif
								@if(!empty($q->option_c))
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="answer_quiz[{{$q->id}}]" value="C">
									  <label class="form-check-label" for="answer_quiz[{{$q->id}}]">C. {{$q->option_c}}</label>
									</div>
								@endif
								@if(!empty($q->option_d))
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="answer_quiz[{{$q->id}}]" value="D">
									  <label class="form-check-label" for="answer_quiz[{{$q->id}}]">D. {{$q->option_d}}</label>
									</div>
								@endif
							</blockquote>
						@endforeach
					  </div>
					</div>
				</div>
				<div class="col-md-2 row" role="tablist">
					@foreach($quiz->quiz_questions as $key => $q)
						<div class="col-2 mt-2 mr-2">
							<button type="button" class="btn btn-sm btn-{{!empty($q->question)?'success':'warning'}} navigator" data-id="{{$q->id}}" id="{{$q->id}}"> <span class="">{{$key+1}}</span></button>
						</div>
					@endforeach
					<div class="col-md-12 mt-3">
						@if(empty($hasAnswer))
							<button type="submit" class="btn btn-primary">SIMPAN JAWABAN</button>
						@endif
					</div>
				</div>
			</div>
		</form>
	</div>
	@if(!empty($asMentor))
		<div class="container-fluid">
			<div class="col-md-12 mt-3">
				<div class="card">
				  <div class="card-header">
				    Jawaban
				  </div>
		  			<div class="card-body">
		  				<div class="table-responsive">
				    	<table id="presents" class="table table-striped table-hover">
				  			<thead class="thead-dark">
				  				<th>Nama</th>
				  				<th>Jawaban Benar</th>
				  				<th>Dari</th>
				  				<th>Nilai</th>
				  			</thead>
				  			<tbody>
				  				@foreach($user_answer as $key => $answer)
				  					<tr>
				  						<td>{{$key}}</td>
				  						<td>{{$answer}}</td>
				  						<td>{{count($quiz->quiz_questions)}}</td>
				  						<td>{{((count($quiz->quiz_questions)/100) * $answer) * 10}}</td>
				  					</tr>
				  				@endforeach
				  			</tbody>
				  		</table>
				    </div>
					</div>
				</div>
			</div>
		</div>
	@endif
@endsection

@push('script')
	<script>
		$(document).ready(function(){

			$('.navigator').click(function(){
				let hash = $(this).data('id');
				$('.questions').css('display','none');

				$('#q-'+hash).css('display','');
			});			
		});	
	</script>
@endpush