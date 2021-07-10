@php
  if(!empty(Auth::user()))
  {
    $user = App\Models\UserInformation::where('id',Auth::user()->id)->first();
  }

@endphp

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=1">

  <title>Sistem Pembelajaran Berbasis Online</title>
  <meta content="Sistem Pembelajaran Berbasis Online" name="description">
  <meta content="SPBO" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  {{-- <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Dosis:300,400,500,,600,700,700i|Lato:300,300i,400,400i,700,700i" rel="stylesheet"> --}}

  <link href="https://fonts.googleapis.com/css2?family=Prompt:wght@300;400&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="{{url('assets/vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
  <link href="{{url('assets/vendor/icofont/icofont.min.css')}}" rel="stylesheet">
  <link href="{{url('assets/vendor/boxicons/css/boxicons.min.css')}}" rel="stylesheet">
  <link href="{{url('assets/vendor/venobox/venobox.css')}}" rel="stylesheet">
  <link href="{{url('assets/vendor/line-awesome/css/line-awesome.min.css')}}" rel="stylesheet">
  <link href="{{url('assets/vendor/owl.carousel/assets/owl.carousel.min.css')}}" rel="stylesheet">
  {{-- <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet"> --}}

    <link rel="stylesheet" href="{{url('assets/vendor/fontawesome/css/font-awesome.min.css')}}">

  <!-- Template Main CSS File -->
  <link href="{{url('assets/css/style.css')}}" rel="stylesheet">
</head>

<body>

  <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="{{route('home')}}">{{config('app.name')}}</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            @guest
            @else
              <li class="active nav-item"><a class="nav-link" href="{{route('schedule')}}">Jadwal</a></li>
              <li><a class="nav-link" href="{{route('task')}}">Tugas</a></li>
              @if($user->is_mentor)
                <li><a href="{{route('quiz.list')}}" class="nav-link">Kuis</a></li>
              @endif
            @endguest

            @guest
                <li class="nav-item"><a class="nav-link" href="{{ route('login') }}">Masuk</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('register') }}">Daftar</a></li>
            @else
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{ Auth::user()->name }} <span class="caret"></span>
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="{{route('profile')}}">Profil</a>
                    <a class="dropdown-item" href="{{ route('logout') }}"
                       onclick="event.preventDefault();
                                     document.getElementById('logout-form').submit();">
                        {{ __('Logout') }}
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                  </div>
                </li>
            @endguest        
        </div>
      </div>
    </nav>
  </div>

  <main id="main">
    <br>
    <div class="row col-md-12">
      <div class="col-md-10">
        @yield('content')
      </div>
      <div class="col col-md-2">
        @yield('sidemenu')
      </div>
    </div>
  </main>
  <script src="{{url('assets/vendor/jquery/jquery.min.js')}}"></script>
  <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
  <script src="{{url('assets/vendor/datatable/jquery.datatable.min.js')}}"></script>
  <script src="{{url('assets/vendor/datatable/datatable.bootstrap.min.js')}}"></script>
  <script src="{{url('assets/vendor/bootstrap/js/bootstrap.min.js')}}"></script>
  @stack('script');
</body>
</html>