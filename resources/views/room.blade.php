@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6">
            @if($participant->is_mentor)
                <div class="">
                    <button class="btn btn-danger" id="btn-finish">Akhiri Kelas</button>
                </div>
                <br>
                <div class="card">
                    <div class="card-header lead">Berikan Tugas</span></div>
                    <div class="overflow-auto">
                        <textarea name="editor" id="task"></textarea>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-primary" id="save-task">Simpan Tugas</button>
                    </div>
                </div>
            @else
                <div class="row col-md-12">
                    <div class="alert alert-danger" id="alert" style="display:none !important">
                        Kelas Belum Dimulai, Tinggalkan Kelas
                    </div>
                </div>
                <div class="">
                    <button class="btn btn-danger" id="btn-leave">Tinggalkan Kelas</button>
                </div>
            @endif
            <br>
            <div class="card">
                <div class="card-header lead">Peserta <span class="pull-right">Hadir</span></div>
                <div class="overflow-auto">
                    <ul class="list-group" id="user-list"></ul>
                </div>
            </div>
        </div>
        <div class="col-md-6">
             <div class="card">
                <div class="card-header lead">Informasi</div>
                <div class="overflow-auto">
                    <ul class="list-group">
                      <li class="list-group-item">Pertemuan : <strong>{{$schedule->name?$schedule->name:'Default Room'}}</strong></li>
                      <li class="list-group-item">Mentor : <span class="badge badge-success">{{$schedule->mentor_name}}</span></li>
                      <li class="list-group-item">Dibuat : <span class="badge badge-success">{{$schedule->occupied_by_name}}</span></li>
                      <li class="list-group-item">Kelas :<span class="badge badge-success">{{$schedule->class_name}}</span></li>
                      <li class="list-group-item">Tugas : <strong>{{!empty($task)?$task->name:''}}</strong>
                        <div class="small font-italic" id="task-item">{!!Str::limit(!empty($task)?$task->name:'',250)!!}</div>
                      </li>
                      <li class="list-group-item"><textarea readonly rows="5" class="form-control">{{$schedule->description}}</textarea></span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
	<script crossorigin src="https://unpkg.com/@daily-co/daily-js"></script>
    <script>
        function createFrameAndJoinRoom() {
            var callFrame = window.DailyIframe.createFrame({
              showLeaveButton: true,
              showFullscreenButton: true,
            });
            callFrame.join({ url: '{{$schedule->room_url}}' });

            callFrame.on('joining-meeting', (event) => { 
                get_participants();
            });

            get_participants();
        }

        CKEDITOR.replace('editor');

        $('#save-task').click(function(){
            var task = CKEDITOR.instances['task'].getData();
            var data = {
                'schedule_id': {{$schedule->id}},
                'task': task,
                '_token' : '{{ csrf_token() }}',
            };

            $.ajax({
                type:'post',
                url: "{{route('task.save')}}",
                data: JSON.stringify(data),
                dataType:'json',
                headers: {
                    "content-type":"application/json",
                }
            }).done(function(data) {
                if(data.success == false){
                    alert(data.message);
                }else{
                    $('#task-item').html('');
                    $('#task-item').append(data.data);
                }
                
            });
        });

        $('#btn-finish').click(function(){
            $.ajax({
                type:'delete',
                url: "{{config('app.api_base')}}rooms/{{str_replace(' ','-',$schedule->name)}}",
                headers: {
                    "content-type":"application/json",
                    "authorization":"Bearer {{config('app.dailyco_key')}}",
                }                
            }).done(function(data) {

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
                    location.href="{{route('schedule')}}";
                });
            });
        });

        $('#btn-leave').click(function(){
            var data = {
                'schedule_id': {{$schedule->id}},
                '_token' : '{{ csrf_token() }}',
            };

            $.ajax({
                type:'post',
                url: "{{route('room.leave')}}",
                data: JSON.stringify(data),
                dataType:'json',
                headers: {
                    "content-type":"application/json",
                }
            }).done(function(data) {
                if(data.success == false){
                    alert(data.message);
                }else{
                   location.href= "{{route('home')}}";
                }
                
            });
        });

        function get_participants(){
            var data = {
                'schedule_id': {{$schedule->id}},
                '_token' : '{{ csrf_token() }}',
            };

            $.ajax({
                type:'post',
                url: "{{route('schedule.participant')}}",
                data: JSON.stringify(data),
                dataType:'json',
                headers: {
                    "content-type":"application/json",
                }
            }).done(function(data) {
                load_participant(data.data);
            });
        }

        function load_participant(data)
        {
            $('#user-list').html('');
            var view = '';

            $.each(data, function(k,v){
                if(v.present) view += '<li class="list-group-item"><span class="fa fa-user"></span> '+v.user_name+' <span class="badge badge-success pull-right"><span class="fa fa-toggle-on"></span></span></li>';
                else view += '<li class="list-group-item"><span class="fa fa-user"></span> '+v.user_name+' <span class="badge badge-danger pull-right"><span class="fa fa-toggle-off"></span></span></li>';       
            });

            $('#user-list').append(view);
        }

    </script>
    @if(empty($schedule->room_url) && $participant->is_mentor)
    <script crossorigin>
        $(document).ready(function() {
            var room_name = "{{str_replace(' ','-',$schedule->name)}}";
            var data = {
                    "name": room_name,
                    "privacy":"public",
                    "properties" : {
                        "start_audio_off":true,
                        "start_video_off":true,
                        "max_participants": '{{$schedule->max_participant}}'
                    }
                };

            //Create Room
            $.ajax({
                type:'post',
                url: "{{config('app.api_base')}}rooms",
                data: JSON.stringify(data),
                dataType:'json',
                headers: {
                    "content-type":"application/json",
                    "authorization":"Bearer {{config('app.dailyco_key')}}",
                }                
            }).done(function(data) {
                //Save Room Data
                var data_room = {
                    'room_api_id': data.id,
                    'room_url': data.url,
                    'room_privacy': data.privacy,
                    'schedule_id': '{{$schedule->id}}',
                    '_token' : '{{ csrf_token() }}',
                };

                $.ajax({
                    type:'post',
                    url: "{{route('schedule.update')}}",
                    data: JSON.stringify(data_room),
                    dataType:'json',
                    headers: {
                        "content-type":"application/json",
                    }                
                }).done(function(data) {
                    createFrameAndJoinRoom();
                });
            });

        });
    </script>
    @else
     <script crossorigin>
        $(document).ready(function() {
            var room_name = "{{str_replace(' ','-',$schedule->name)}}";
            $.ajax({
                type:'get',
                url: "{{config('app.api_base')}}rooms/{{str_replace(' ','-',$schedule->name)}}",
                headers: {
                    "content-type":"application/json",
                    "authorization":"Bearer {{config('app.dailyco_key')}}",
                }                
            }).done(function(data) {
                 createFrameAndJoinRoom();
            }).fail(function(data,status,thrown){
                if(thrown == 'Not Found'){
                    $('#alert').removeAttr('style');
                }
            });

        });
    </script>
    @endif
@endpush()