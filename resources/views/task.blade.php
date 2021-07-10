@extends('layouts.app')

@section('content')
	<div class="container-fluid">
	    <div class="table-responsive">
			@if($participant->is_mentor)
				<a href="{{route('task.add')}}"><button class="btn btn-primary">Tambah Tugas</button></a>
			@endif
	    	<table id="task" class="table">
	    		<legend>Daftar Tugas</legend>
	  			<thead class="thead-dark">
	  				<th style="width:250px">Mata Pelajaran</th>
	  				<th>Detail Tugas</th>
	  			</thead>
	  			<tbody>
	  				@foreach($tasks as $key => $task)
						<tr>
							<td>
								<div class="card">
				                    <div class="card-header"><span class="lead">{{$task->name}}</span> 
				                    	<span class="small badge badge-success">Kelas : {{!empty($task->class_id)?$task->class_name:$task->participant_class_name}}</span>
				                    	{{-- <span class="small badge badge-warning">Jadwal : {{$task->schedule_name}}</span>
				                    	<span class="small badge badge-danger">Ruangan : {{$task->room_name}}</span> --}}
				                    </div>
				                    <div class="card-footer">
				                        <span class=""><span class="badge badge-primary">{{$task->user_name}}</span></span>
				                    </div>
				                </div>
							</td>
							<td>
							 	<textarea readonly class="" rows="5" name="editor-{{$key}}" id="task">{!!$task->task!!}</textarea>
								@push('script')
									<script>
										CKEDITOR.replace('editor-{{$key}}',{
											toolbarGroups: [
												{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] }
											],
											height:120
										});
									</script>
								@endpush()
							</td>
						</tr>
	  				@endforeach
	  			</tbody>
	  		</table>
	  	</div>
	</div>
@endsection
@push('script')
	<script>
		$(document).ready(function() {
	        $('#task').DataTable();
	    });
	</script>
@endpush()

@include('sidemenu')