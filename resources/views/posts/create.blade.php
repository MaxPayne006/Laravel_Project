@extends('layouts.app')

@section('content')
    <div class="separator">
        <h2>Write a Blog </h2>
        <br>
    </div>
    {!! Form::open(['action'=>'App\Http\Controllers\PostController@store', 'method'=>'POST','enctype' => 'multipart/form-data'  ])!!}
        <div class="form-group">
            {{Form::label('title','Title')}}
            {{Form::text('title','',['class'=>'form-control','placeholder'=>'Title'])}}
        </div> <br>
        <div class="form-group">
            {{Form::label('body','Body')}}
            {{Form::textarea('body','',['id'=>'summary-ckeditor' ,'class'=>'form-control','placeholder'=>'Body Text'])}}
        </div> <br>
        <div class="form-group">
            {{Form::file('cover_image')}}
        </div> <br>
        {{Form::submit('Submit',['class'=>'btn btn-primary'])}}
    {!! Form::close() !!}
@endsection