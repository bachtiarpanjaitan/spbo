@extends('layouts.app')

@section('content')
	<form action="{{route('quiz.save')}}" method="post">
		@csrf
		<div class="container-fluid">
			<div class="col-md-12 row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="">Judul Kuis</label>
						<input type="text" name="title" required class="form-control"/>
					</div>
					<div class="form-group">
						<label for="">Mata Kuliah</label>
						<select name="subject_id" id="subject_id" required class="form-control">
							<option value="">Pilih</option>
							@foreach($subjects as $s)
								<option value="{{$s->id}}">{{$s->name}}</option>
							@endforeach
						</select>
					</div>
					<div class="form-group">
						<label for="">Topik</label>
						<select name="topic" id="" required class="form-control">
							<option value="">Pilih</option>
							@for($i = 1;$i <= 16 ; $i++)
								<option value="Topic {{$i}}">Topic {{$i}}</option>
							@endfor
						</select>
					</div>
					<div class="form-group">
						<label for="">Jumlah Kuis <small class="text-danger">Sesuaikan Jumlah Kuis</small></label>
						<input type="number" name="maximum_quiz" id="" value="50" class="form-control">
					</div>
					<div class="form-group">
						<label for="">Keterangan</label>
						<textarea name="description" id="" cols="30" rows="10" class="form-control"></textarea>
					</div>
				</div>
				<div class="col-md-6"></div>
			</div>
			<div class="col-md-12">
				<button type="submit" class="btn btn-primary">Lanjut</button>
			</div>
		</div>
	</form>
@endsection