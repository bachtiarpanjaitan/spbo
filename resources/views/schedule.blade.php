@extends('layouts.app')

@section('content')
	<div class="container">
	    <div class="">
	    	<div class="">
		    	<table id="schedule" class="table table-striped table-hover">
		    		<legend>Jadwal Saya</legend> 
					@if($participant->is_mentor)
					<a href="{{route('schedule.add')}}"><button class="btn btn-small btn-primary">Tambah Jadwal</button></a>
					@else
						<a href="{{route('schedule.present')}}"><button class="btn btn-small btn-primary">Daftar Hadir</button></a>
					@endif
		  			<thead class="thead-dark">
		  				<th>Nama</th>
		  				<th>Ruangan</th>
		  				<th>Kelas</th>
		  				<th>Hari</th>
		  				<th>Jam</th>
		  				<th>Mentor</th>
		  				<th>Keterangan</th>
		  			</thead>
		  			<tbody>
		  				@foreach($schedules as $item)
							<tr>
			  					<td><a href="{{route('schedule.detail',$item->id)}}">{{$item->name}}</a></td>
			  					<td>{{$item->room_name}}</td>
			  					<td>{{$item->class_name}}</td>
			  					<td>{{get_day_name($item->day)}}</td>
			  					<td>{{$item->time}}</td>
			  					<td>{{$item->mentor_name}}</td>
			  					<td>{{$item->description}}</td>
			  				</tr>
		  				@endforeach
		  			</tbody>
		  		</table>
		    </div>
	    </div>
	</div>
@endsection
@push('script')
	<script>
	    $(document).ready(function() {
	        $('#schedule').DataTable();
	    });
  	</script>
@endpush
@include('sidemenu')