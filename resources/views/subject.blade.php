@extends('layouts.app')

@section('content')
	<div class="container-fluid">
		@if($participant->is_mentor)
			<div class="card border-primary mb-3">
			 	<div class="card-header">
				 	Tambah Materi
			 	</div>
			 	<div class="card-body">
					<form action="{{route('theory.save')}}" method="POST">
						@csrf
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="topic_id">Topik</label>
									<select name="topic_id" id="" class="form-control">
										@if($subject->has('topics'))
												<option value="">Pilih</option>
												@foreach($subject->topics as $key => $topic)
													<option value="{{$topic->id}}">{{$topic->name}}</option>
												@endforeach
										@endif
									</select>
									@error('topic_id')
		                                <span class="small text-danger">
		                                    <strong>{{$message}}</strong>
		                                </span>
		                            @enderror
								</div>
								<div class="form-group">
									<label for="name">Nama Materi</label>
									<input type="text" name="name" id="" class="form-control">
									@error('name')
		                                <span class="small text-danger">
		                                    <strong>{{$message}}</strong>
		                                </span>
		                            @enderror
								</div>
								<div class="form-group">
									<label for="name">Keterangan</label>
									<textarea type="text" name="description" rows="13" id="" class="form-control"></textarea>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="name">Isi Materi</label>
									<textarea type="text" name="content" rows="20" id="ckeditor" class="form-control"></textarea>
									@error('content')
		                                <span class="small text-danger">
		                                    <strong>{{$message}}</strong>
		                                </span>
		                            @enderror
								</div>
							</div>
						</div>
						<div class="col-md-12 row">
							<button class="btn btn-primary" type="submit">Simpan</button>
						</div>
					</form>
				</div>
			</div>
		@endif
		<div id="accordion">
			<h4>Daftar Topik {{$subject->name}}</h4>
			@if($subject->has('topics'))
			  	@foreach($subject->topics as $key => $topic)
			  		<div class="card mt-1">
					    <div class="card-header" id="headingOne">
					      <h5 class="mb-0">
					        <div class="text-primary" style="cursor: pointer;" data-toggle="collapse" data-target="#collapse-{{$key}}" aria-expanded="true" aria-controls="collapse-{{$key}}">
					         {{$topic->name}}
					        </div>
					      </h5>
					    </div>

					    <div id="collapse-{{$key}}" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
					      <div class="card-body">
					        @if($topic->theories->count() > 0)
					        	@foreach($topic->theories as $key => $theory)
					        		<span class="fa fa-file-text text-danger"></span> <a href="{{route('theory.detail',$theory->id)}}" class="col-md-12 h6">Materi {{$key+1}}: {{$theory->name}}</a>
					        		<div class="card-body">
					        			{{$theory->description}}
					        		</div>
					        	@endforeach

					        	@php
					        		$quiz = $quizzes->where('topic_id',$topic->id);
					        	@endphp
					        	@if(count($quiz) > 0)
						        	<div class="alert alert-warning">
						        		@foreach($quiz as $key =>  $q)
						        			<span class="fa fa-question text-danger"></span><a href="{{route('quiz.test',$q->id)}}"> KUIS {{$key+1}}: {{$q->title}}</a>
						        		@endforeach
						        	</div>
					        	@endif
					        @else
					        	<span class="text-left text-danger">Belum ada materi</span>
					        @endif
					      </div>
					    </div>
					  </div>
			  	@endforeach
		  	@endif

		</div>
		<div class="mt-3">
			<h4>Daftar Kelas</h4>
			@if($classes->count() > 0)
				@foreach($classes as $key => $class)
				<div class="card mt-1">
					<div class="card-header" id="headingOne">
				      <h5 class="mb-0">
				        <div class="">
				         {{$class->participant_class->class_name}}
				        </div>
				      </h5>
				    </div>
				</div>
				@endforeach
			@endif
		</div>
	</div>
@endsection

@push('script')
	<script>
		$('.collapse').collapse();
		CKEDITOR.replace('ckeditor',{
			height: '400px'
		});
	</script>
@endpush

@include('sidemenu')