@extends('layouts.app')

@section('content')

<div class="container">
	<form action="{{route('task.save')}}" method="post">
		@csrf
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="">Judul Tugas</label>
					<input type="text" required class="form-control"/>
				</div>
				<div class="form-group">
					<label for="">Jadwal</label>
					<select name="schedule_id" required class="form-control">
						@foreach($schedules as $sc)
							<option value="{{$sc->id}}">{{$sc->name}}</option>
						@endforeach
					</select>
				</div>
				<div class="form-group">
					<label for="">Topik</label>
					<select name="topic_id" id="" class="form-control">
						@for($i = 1; $i <= 16; $i++)
							<option value="{{$i}}">Topik {{$i}}</option>
						@endfor
					</select>
				</div>
				<div class="form-group">
					<label for="">Keterangan Topik</label>
					<textarea class="form-control" name="topic_description"></textarea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="">Isi Tugas/Kuis</label>
					<textarea class="form-control" rows="25" id="ckeditor" name="task"></textarea>
				</div>
			</div>
			
		</div>
		<div class="col-md-12">
			<input type="submit" class="btn btn-primary" value="Simpan">
		</div>
	</form>
</div>
@endsection
@push('script')
	<script>
		CKEDITOR.replace('ckeditor');
		CKEDITOR.replace('topic_name');
	</script>
@endpush()
@include('sidemenu')
