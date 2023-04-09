@extends('layouts.app')
@section('styles')
    {{-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" /> --}}
        {{-- <link rel="stylesheet" media="screen" href="https://fontlibrary.org//face/averia-sans-gwf" type="text/css"> --}}
        {{-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> --}}
        {{-- Custom Styles --}}
        <link rel="stylesheet" href="/CSS/Search.css">
@endsection
        @section('content')
        <div class="container">
            <div class="row">
                <div class="col-12 search-title">
                    <h2>Search Blogs Here?</h2>
                </div>
                <div class="col-12">
                    <div class="form-group">
                        <input type="text" name="search" id="search" class="form-control mr-sm-2" placeholder="Search Blogs " />
                    </div>
                </div>
                <div class="col-12">
                    <div class="result" style="margin-top: 2rem;">
                        <span>Total Results: <span style="border: 1px solid white; padding: 1px 5px;" id="total_records"></span></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top: 2rem;">
            <div class="row">
                <div class="col-12 line-under-result">
                    <h2>Here are your results</h2>
                    <hr class="col-12">
                </div>
                    <div id="search-data">
                        
                    </div>
            </div>
        </div>
@endsection
@section('scripts')
<script>
$(document).ready(function(){

 fetch_blog_data();

 function fetch_blog_data(query = '')
 {
  $.ajax({
   url:"{{ route('live_search.action') }}",
   method:'GET',
   data:{query:query},
   dataType:'json',
   success:function(data)
   {
    $('#search-data').html(data.table_data);
    $('#total_records').text(data.total_data);
   }
  })
 }

 $(document).on('keyup', '#search', function(){
  var query = $(this).val();
  fetch_blog_data(query);
 });
});
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
@endsection

