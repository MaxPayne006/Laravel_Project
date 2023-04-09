@extends('layouts.app')
@section('styles')
<link rel="stylesheet" href="/CSS/HomePage.css">
@endsection
@section('content')

    <div class="col-lg-12">
    {{-- <div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel">
      <!--Indicators-->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-2" data-slide-to="1"></li>
        <li data-target="#carousel-example-2" data-slide-to="2"></li>
      </ol>
      <!--/.Indicators-->
      <!--Slides-->
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
          <div class="view">
            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(61).jpg"
              alt="First slide">
            <div class="mask rgba-black-light"></div>
          </div>
          <div class="carousel-caption">
            <h3 class="h3-responsive">Important stories this week</h3>1                <p>Lion's DeN</p>
          </div>
        </div>
        <div class="carousel-item">
          <!--Mask color-->
          <div class="view">
            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(5).jpg"
              alt="Second slide">
            <div class="mask rgba-black-strong"></div>
          </div>
          <div class="carousel-caption">
            <h3 class="h3-responsive">Important stories this week</h3>
            <p>In the woods</p>
          </div>
        </div>
        <div class="carousel-item">
          <!--Mask color-->
          <div class="view">
            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(8).jpg"
              alt="Third slide">
            <div class="mask rgba-black-slight"></div>
          </div>
          <div class="carousel-caption">
            <h3 class="h3-responsive">Important stories this week</h3>
            <p>Snow Fall</p>
          </div>
        </div>
      </div>
      <!--/.Slides-->
      <!--Controls-->
      <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
      <!--/.Controls-->
    </div>
    <!--/.Carousel Wrapper-->
  </div>
    <div class="separator">
        <br>
        <hr> --}}
        <h2>Top Stories </h2>
        <hr>
    </div>
    <div class="container">
        <div class="row">
        @if(count($posts)>0)
        @foreach ($posts as $post)
            <div class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div style="color: black;">
                    <a href="/posts/{{$post->id}}" class="news-link"  style="text-decoration: none;">
                        <img src="/storage/cover_images/{{$post->cover_image}}" class="img" style="object-fit: cover">
                        <h6>{{$post->title}}</h6>
                        <div class="publising-info">
                            <span class="date-border">{{$post->created_at->format('d M Y')}}</span>
                            <span>3 min read</span> <br>
                            <span>Author :{{$post->user->name}}</span>
                            <?php $Intro=$post->body;
                            $Intro=substr($Intro,0,100); 
                            ?>
                            {{-- <p class="little-intro">{!!$Intro!!}</p> --}}
                        </div>
                    </a>
                </div>
            </div>
        @endforeach
        {{$posts->links()}}
        @else
            <p>No posts found</p>
        @endif
    </div>
    </div>
@endsection


