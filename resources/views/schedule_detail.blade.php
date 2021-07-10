@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
    	<table class="table table-striped table-hover">
    		<legend>Detail Jadwal</legend>
    		<thead>
    			<th>Detail</th>
    			<th></th>
    		</thead>
    		<tbody>
    			<tr>
    				<td>Nama</td>
    				<td>{{$schedule->name}}</td>
    			</tr>
    			<tr>
    				<td>Kelas</td>
    				<td>{{$schedule->class_name}}</td>
    			</tr>
    			<tr>
    				<td>Hari</td>
    				<td>{{get_day_name($schedule->day)}}</td>
    			</tr>
    			<tr>
    				<td>Jam</td>
    				<td>{{$schedule->time}}</td>
    			</tr>
    			<tr>
    				<td>Mentor</td>
    				<td>{{$schedule->mentor_name}}</td>
    			</tr>
    		</tbody>
    	</table>
    	<div class="row col-md-12">
    		@if($is_mentor)
                <div class="col"><a href="{{route('room.active',$schedule->id)}}" class="btn btn-primary btn-block">Mulai Kelas</a></div>
	    		<div class="col"><a id="stop_room" href="#" class="btn btn-danger btn-block">Akhiri Kelas</a></div>
				<div class="col"><a href="{{route('schedule.schedule_present',$schedule->id)}}" class="btn btn-success btn-block">Daftar Hadir</a></div>
	    	@else
	    		<div class="col"><a href="{{route('room.active',$schedule->id)}}" class="btn btn-primary btn-block">Masuk Kelas</a></div>
    		@endif
    	</div>
    </div>
</div>
@endsection

@push('script')
    
<script>
     $(document).ready(function() {
        $('#stop_room').click(function(){
            var room_name = "{{str_replace(' ','-',$schedule->name)}}";
            $.ajax({
                type:'delete',
                url: "{{env('API_BASE')}}rooms/{{str_replace(' ','-',$schedule->name)}}",
                headers: {
                    "content-type":"application/json",
                    "authorization":"Bearer {{env('DAILYCO_KEY')}}",
                }                
            }).done(function(data) {
            });
			
			var data = {
                    'id': '{{$schedule->id}}',
                    '_token' : '{{ csrf_token() }}',
                };
			$.ajax({
				type:'post',
				url: "{{route('room.stop')}}",
				data: JSON.stringify(data),
				dataType:'json',
				headers: {
					"content-type":"application/json",
				}                
			}).done(function(data) {
				location.reload();
			});
        });
		
		
     });
</script>

@endpush

@include('sidemenu')