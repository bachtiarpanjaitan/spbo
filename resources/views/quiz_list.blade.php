@extends('layouts.app')

@section('content')
	<div class="container-fluid">
	    <div class="table-responsive">
	    	@if($participant->is_mentor)
				<a href="{{route('quiz.add')}}"><button class="btn btn-primary">Tambah Kuis</button></a>
			@endif
	    	<table id="task" class="table">
	    		<legend>Daftar Kuis</legend>
	  			<thead class="thead-dark">
	  				<th style="width:250px">Judul Kuis</th>
	  				<th>Mata Pelajaran</th>
	  				<th>Jumlah Kuis</th>
	  				<th>Aksi</th>
	  			</thead>
	  			<tbody>
	  				@foreach($quiz as $q)
	  					<tr>
	  						<td><a href="{{route('quiz.question.add',$q->id)}}">{{$q->title}}</a></td>
	  						<td>{{$q->subject->name}}</td>
	  						<td>{{$q->maximum_quiz}}</td>
	  						<td><a href="{{route('quiz.delete',$q->id)}}" class="btn btn-danger btn-small">Hapus</a></td>
	  					</tr>
	  				@endforeach
	  			</tbody>
	  		</table>
	    </div>
	</div>
@endsection