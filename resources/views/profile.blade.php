@extends('layouts.app')

@section('content')
	<div class="container">
		@if($errors->any())
		    <div class="alert alert-danger">{{ $errors }}</div>
		@endif
		<form action="{{route('profile.save')}}" method="post">
			@csrf
			<table class="table table-hover">
				<thead class="lead">
					<th>Data Profil Anda</th>
					<th></th>
				</thead>
				<tbody>
					<tr>
						<td>Nama Lengkap</td>
						<td><input type="text" name="name" required class="form-control" value="{{$user->name}}"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="email" name="email" class="form-control" required id="" value="{{$user->email}}"></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" class="form-control" id=""></td>
					</tr>
					<tr>
						<td>Ulangi Password</td>
						<td><input type="password" name="upassword" class="form-control" id=""></td>
					</tr>
					<tr>
						@if($user->is_mentor)
							<td>NIK / NIP</td>
						@else
							<td>NIM</td>
						@endif
						<td><input type="text" name="nim" class="form-control" id="" value="{{$user->nim}}"></td>
					</tr>
					@if(!$user->is_mentor)
						<tr>
							<td>Kelas</td>
							<td>
								<select name="class_id" id="" class="form-control">
									@foreach($classes as $class)
									@if($class->id == $user->class_id)
										<option value="{{$class->id}}" selected>{{$class->class_name}}</option>
									@else
										<option value="{{$class->id}}">{{$class->class_name}}</option>
									@endif
									@endforeach
								</select>
							</td>
						</tr>
					@endif
				</tbody>
			</table>
			<div class="col-md-12">
				<button class="btn btn-primary">Simpan Profil</button>
			</div>
		</form>
	</div>
@endsection