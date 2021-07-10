@extends('layouts.app')

@section('content')
	<div class="container">
		<div>
			<h4>{{$theory->name}}</h4>
		</div>
		<div class="mt-3">
			{!!$theory->content!!}
		</div>
		<div class="mt-5">
			<label for=" text-success"><span class="fa fa-share"></span> Bagikan Link</label>
			<input type="text" name="" class="form-control" id="share-link" value="{{Request::url()}}">
		</div>
	</div>
@endsection

@push('script')
	<script>
		$('.collapse').collapse();
		$('#share-link').click(function(){
			$(this).select();
		});
	</script>
@endpush

@include('sidemenu')