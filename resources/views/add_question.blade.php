@extends('layouts.app')

@section('content')
	<form action="{{route('quiz.question.save')}}" method="post">
		@csrf
		<div class="container-fluid">
			<input type="hidden" name="quiz_id" value="{{$quiz->id}}">
			<div class="col-md-12"><h4>{{$quiz->title}}</h4></div>
			<div class="row">
			  <div class="col-2">
			    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			      @foreach($questions as $key => $q)
			      	<a class="nav-link btn btn-sm btn-outline-success {{$key == 0?'active':''}}" id="v-pills-{{$key+1}}-tab" data-toggle="pill" href="#v-pills-{{$q->id}}" role="tab" aria-controls="v-pills-{{$q->id}}" aria-selected="true">Soal {{$key+1}}</a>
			      @endforeach
			    </div>
			  </div>
			  <div class="col-10">
			    <div class="tab-content" id="v-pills-tabContent">
			      @foreach($questions as $key => $q)
			     	<div class="tab-pane fade show {{$key == 0?'active':''}}" id="v-pills-{{$q->id}}" role="tabpanel" aria-labelledby="v-pills-{{$q->id}}-tab">
			     		<div class="col-md-12 row">
			     			<div class="col-md-6">
			     			<div class="form-group">
								<label for="">Soal {{$key+1}}</label>
								<textarea name="question[{{$q->id}}]" id="" cols="30" rows="10" class="form-control">{{$q->question}}</textarea>
							</div>
				     		</div>
				     		<div class="col-md-6">
				     			<label class="switch">
								  	<input type="checkbox" id="switch-{{$key}}">
								  	<span class="slider round"></span>
								</label>
				     			<div class="col-12">
				     				<label for="">Pilihan Jawaban</label>
					     			<div class="input-group mb-3">
									  <div class="input-group-prepend">
									    <span class="input-group-text" id="basic-addon1">A.</span>
									  </div>
									  <input type="text" value="{{$q->option_a}}" name="option_a[{{$q->id}}]" class="form-control" placeholder="Masukkan pilihan jawaban A">
									</div>
									<div class="input-group mb-3">
									  <div class="input-group-prepend">
									    <span class="input-group-text" id="basic-addon1">B.</span>
									  </div>
									  <input type="text" value="{{$q->option_b}}" name="option_b[{{$q->id}}]" class="form-control" placeholder="Masukkan pilihan jawaban B">
									</div>
									<div id="option-{{$key}}" style="display: {{!empty($q->option_c)?'display':'none'}}">
										<div class="input-group mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text" id="basic-addon1">C.</span>
										  </div>
										  <input type="text" value="{{$q->option_c}}" name="option_c[{{$q->id}}]" class="form-control" placeholder="Masukkan pilihan jawaban C">
										</div>
										<div class="input-group mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text" id="basic-addon1">D.</span>
										  </div>
										  <input type="text" value="{{$q->option_d}}" name="option_d[{{$q->id}}]" class="form-control" placeholder="Masukkan pilihan jawaban D">
										</div>
									</div>

									<label for="">Jawaban</label> <br>
					     			<div class="row">
					     				<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="answer_quiz[{{$q->id}}]" {{strtoupper($q->answer) == 'A'?'checked':''}} value="A">
											  <label class="form-check-label" for="answer_quiz[{{$q->id}}]">A</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="answer_quiz[{{$q->id}}]" {{strtoupper($q->answer) == 'B'?'checked':''}} value="B">
											  <label class="form-check-label" for="answer_quiz[{{$q->id}}]">B</label>
											</div>
											<div id="not-option-{{$key}}" style="display: {{ !empty($q->option_c)?'display':'none'}}">
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="answer_quiz[{{$q->id}}]" {{strtoupper($q->answer) == 'C'?'checked':''}} value="C">
												  <label class="form-check-label" for="answer_quiz[{{$q->id}}]">C</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="answer_quiz[{{$q->id}}]" {{strtoupper($q->answer) == 'D'?'checked':''}} value="D">
												  <label class="form-check-label" for="answer_quiz[{{$q->id}}]">D</label>
												</div>
											</div>
					     			</div>
				     			</div>
				     		</div>
				     	</div>
			     	</div>
			      @endforeach
			    </div>
			    <div class="col-md-12">
					<button type="submit" class="btn btn-primary">Simpan Semua Soal</button>
				</div>
			  </div>
			</div>
			
		</div>
	</form>
@endsection
@push('script')
	<script>
		@foreach($questions as $key => $k)
			$('#switch-{{$key}}').change(function(){
				if($(this).prop("checked"))
				{
					$('#not-option-{{$key}}').show();
					$('#option-{{$key}}').show();
				}else {
					$('#option-{{$key}}').hide();
					$('#not-option-{{$key}}').hide();
				}
			})
		@endforeach
	</script>
@endpush