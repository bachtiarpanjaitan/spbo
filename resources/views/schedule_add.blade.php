@extends('layouts.app')

@section('content')
<div class="container">
	<form action="{{route('schedule.save')}}" method="post">
		@csrf
		<div class="col-md-12">
			<div class="col col-md-6">
				<div class="form-group">
					<label for="">Nama Jadwal</label>
					<input type="text" name="name" required class="form-control" placeholder="">
					@error('name')
                        <span class="small text-danger">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
				</div>
				<div class="form-group">
					<label for="">Ruangan</label>
					<select required class="form-control" name="room_id">
						@foreach($rooms as $room)
							<option value="{{$room->id}}">{{$room->name}}</option>
						@endforeach
					</select>
					@error('room_id')
                        <span class="small text-danger">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
				</div>
				<div class="form-group">
					<label for="">Kelas</label>
					<select required class="form-control" name="class_id">
						@foreach($classes as $c)
							<option value="{{$c->id}}">{{$c->class_name}}</option>
						@endforeach
					</select>
					@error('class_id')
                        <span class="small text-danger">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
				</div>
				<div class="form-group">
					<label for="">Matakuliah</label>
					<select required class="form-control" name="subject_id">
						@foreach($subjects as $s)
							<option value="{{$s->id}}">{{$s->name}}</option>
						@endforeach
					</select>
					@error('room_id')
                        <span class="small text-danger">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
				</div>
				<div class="form-group">
					<label for="">Hari</label>
					<select required class="form-control" name="day">
						@foreach($days as $key => $day)
							<option value="{{$key}}">{{$day}}</option>
						@endforeach
					</select>
					@error('day')
                        <span class="small text-danger">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
				</div>
				<div class="form-group">
					<label for="">Jam</label>
					<input required type="time" name="time" class="form-control" placeholder="Jam">
				</div>
				<div class="form-group">
					<label for="">Lama Sesi</label>
					<input type="number" name="session_long" class="form-control" placeholder="60">
				</div>
			</div>
			<div class="col col-md-6">
				<div class="form-group">
					<label for="">Keterangan</label>
					<textarea name="description"class="form-control" name="description"></textarea>
				</div>
			</div>
			<div class="col-md-12">
				<button class="btn btn-primary">Simpan</button>
			</div>
		</div>
		
	</form>
</div>
@endsection
@include('sidemenu')