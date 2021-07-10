@extends('layouts.app')

@section('content')
<div class="container">
	    <div class="row">
	    	<div class="table-responsive">
		    	<table id="presents" class="table table-striped table-hover">
		    		<legend>Daftar Hadir</legend> 
		  			<thead class="thead-dark">
		  				<th>Nama Jadwal</th>
		  				<th>Hadir</th>
						<th>Jam</th>
		  			</thead>
		  			<tbody>
		  				@foreach($presents as $p)
							<tr>
			  					<td>{{$p->schedule_name}}</td>
								<td>{{$p->present?'Hadir':'Tidak Hadir'}}</td>
			  					<td>{{$p->present?$p->datetime:''}}</td>
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
	        $(presents).DataTable();
	    });
  	</script>
@endpush
@include('sidemenu')