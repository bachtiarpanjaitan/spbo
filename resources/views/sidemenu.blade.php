@section('sidemenu')
	<div class="panel">
	  <div class="panel-heading">
	    <h3 class="panel-title">Mata Kuliah</h3>
	  </div>
	  <div class="panel-body pre-scrollable">
	    @if(!empty($side_subjects))
			<ul class="list-group">
			@foreach($side_subjects as $key => $sbj)
				<li class="list-group-item"><a href="{{route('subject',$sbj->subject_id)}}"><span class="fa fa-mortar-board"></span> {{$sbj->subject?$sbj->subject->name:$sbj->name}}</a></li>
			@endforeach
			</ul>
		@else 
			
		@endif
	  </div>
	  <h3>Online</h3>
	  <div class="panel-body pre-scrollable">
	    @if(!empty($all_participants))
			<ul class="list-group">
			@foreach($all_participants as $key => $prt)
				<li class="list-group-item">{!!$prt->live_status?'<span class="badge badge-success"> </span>':'<span class="badge badge-danger"> </span>'!!} {{$prt->zoom_firstname}}</a></li>
			@endforeach
			</ul>
		@endif
	  </div>
	</div>
@endsection