@extends('layouts.app ')
{{-- wraping content in section --}}

@section('content')   
    <div class="bg-light p-5 rounded-lg m-3" >
        <h1 style="color: black">Welcome To Blog Website</h1>
        <p style="color: black">This is a blogging website for our project</p>
        <p>
            <a class="btn btn-primary btn-lg" href="/login" role="button">Login</a>
            <a class="btn btn-success btn-lg" href="/register" role="button">Register</a>
        </p>
    </div>

@endsection
        