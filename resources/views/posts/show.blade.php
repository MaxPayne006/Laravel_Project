@extends('layouts.app')
@section('styles')
<link rel="stylesheet" href="/CSS/NPS.css">
@endsection
@section('content')
    <div class="container">
        <a href="/posts" class="btn btn-default">Go Back</a>
        <br> <br>
        <div class="row">
            <div class="col-lg-8">
                <img src="/storage/cover_images/{{$post->cover_image}}" id="first-image" class="img-fluid" alt="Cover image" style="object-fit: cover">
                <div class="title">
                    <h2>{{$post->title}}</h2>
                </div>
                <div class="info-and-icons">
                    <div class="creator-info">
                        <div class="date-and-time">
                            <p>Written By : {{$post->user->name}}</p>
                            <div>
                                <span>{{$post->created_at->format('d M Y')}} • 3 min read</span>
                                <span class="fa fa-star checked"></span>
                            </div>
                        </div>
                    </div>
                    {{-- These social icons will point to the Writer's social accounts --}}
                    <div class="social-icons">
                        <span><a style="color: black;" href="#" class="fa fa-share-alt"></a></span>
                        <span><a href="#" class="fa fa-facebook"></a></span>
                        <span><a href="#" class="fa fa-twitter"></a></span>
                        <span><a href="#" class="fa fa-instagram"></a></span>
                        <span><a href="#" class="fa fa-pinterest"></a></span>
                    </div>
                </div>
                <div class="article">
                    <!-- Here comes the post body -->
                    {!!$post->body!!}
                </div>
                {{-- rem (may include a col in posts where writer will put category)--}}
                <div class="tags">
                    <p>Categories: <a href="#">Design</a> , <a href="#">Events</a> &nbspTags: <a href="#">#HTML</a> , <a
                            href="#">#Trends</a></p>
                </div>
                <div>
                    <br>
                    @if(!Auth::guest()) {{--If user is not the guest --}}
                        @if(Auth::user()->id == $post->user_id) {{--If user is the author of the post --}}
                            <a href="/posts/{{$post->id}}/edit" class="btn btn-default">Edit</a>
                            {!!Form::open(['action'=>['App\Http\Controllers\PostController@destroy',$post->id],'method'=>'POST','class'=>'pull-right']) !!}
                                {{Form::hidden('_method','DELETE')}}
                                {{Form::submit('Delete',['class'=>'btn btn-danger'])}}
                            {{-- Hidden spoofing method  --}}
                            {!!Form::close()!!}
                        @endif
                    @endif
                </div>
                {{-- AJAX To update likes in db and show total likes here --}}
                @if(!Auth::guest()) {{--If user is not the guest --}}
                    <div class="likes-main-div">
                        {{-- Like Dislike Button --}}
                        <span title="Likes" id="saveLikeDislike" data-type="like" data-post="{{ $post->id}}" class=" btn btn-sm btn-outline-primary  font-weight-bold">
                            Like
                            <span class="like-count mr-2">{{ $post->likes() }}</span>
                        </span>
                        <span title="Dislikes" id="saveLikeDislike" style="margin-left: 5px;" data-type="dislike" data-type="dislike" data-post="{{ $post->id}}" class=" btn btn-sm btn-outline-danger  font-weight-bold">
                            Dislike
                            <span class="dislike-count">{{ $post->dislikes() }}</span>
                        </span>
                    </div>
                @endif
                {{-- Will Use AJAX here  --}}
                <div class="big-voting">
                    <div class="voting-heading auto" style="margin-top: 1rem;">
                        <h4>Vote for difficulty:</h4>
                    </div>
                    <div class="voting-level">
                        <button class="btn btn-primary vote-btns" type="submit">Easy</button>
                        <button class="btn btn-primary vote-btns" type="submit">Normal</button>
                        <button class="btn btn-primary vote-btns" type="submit">Medium</button>
                        <button class="btn btn-primary vote-btns" type="submit">Hard</button>
                        <button class="btn btn-primary vote-btns" type="submit">Expert</button>
                    </div>
                </div>
                <div class="write-comments">
                    <div class="comment-heading">
                        <section>
                            <h2>Leave a comment</h2>
                        </section>
                    </div>
                    {{-- Comments Form --}}
                    <div class="form-div">
                        @if(!Auth::guest()) {{--If user is not the guest --}} 
                        <form method="post" action="{{ route('comment.add') }}">
                            @csrf
                            <div class="form-group">
                                <label for="InputMsg1">Comments</label>
                                <textarea  required name="comment_body" class="form-control post-comment-input" id="InputMsg1" rows="5"></textarea>
                                <input type="hidden" name="post_id" value="{{ $post->id }}" />
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary mt-3 com" value="Add Comment" />
                            </div>
                        </form>
                        @endif
                    </div>
                    {{-- Displaying the comments --}}
                    <h4>Comments</h4>
                    @include('inc._comment_replies',['comments'=>$post->comments,'post_id'=>$post->id])
                    
                    {{-- Comments display end --}}
                    {{-- Rem --}}
                </div>
            </div>
            {{-- Fetch the popular posts from the db  --}}
            <div class="col-lg-3 ml-auto" style="margin-top: 3rem;">
                <div class="popular-posts">
                    <h2 style="text-decoration: underline;">Popular Posts</h2>
                </div>
                @if(count($posts)>0)
                <?php  $count=1; ?>
                @foreach ($posts as $spost)
                <div class="news-blocks">
                    <div class="news-number align-self-start">
                        <?php echo $count++;?>
                    </div>
                    <div class="news-and-details">
                        <div class="popular-news-heading">
                            <h6><a href="/posts/{{$spost->id}}" style="color: black;"> {{$spost->title}}</a>
                            </h6>
                        </div>
                        <div class="date-and-time-again">
                            <div>
                                <p style="display: block;">{{$spost->user->name}}</a>
                            </div>
                            <div>
                                <span>{{$post->created_at->format('d M Y')}} • 3 min read</span>
                                <span class="fa fa-star checked"></span>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
                @else
                    <p>No Posts to show</p>
                @endif
                                <p class="see-all-p">
                    <a href="/posts">See all popular</a>
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-arrow-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
                        </svg>
                    </span>
                </p>
            </div>
        </div>
    </div>

@endsection
@section('scripts')
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/JS/like.js"></script>
    <script>
        $(document).ready(function(){
            $(".mybtn").click(function(){
            $("#hidden-form").css("display","block");
            });

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            
            $(document).on('click','.deleteComment',function(){
                if(confirm('Are you sure to delete this comment'))
                {
                    var thisClicked = $(this);
                    var comment_id = thisClicked.val();
                    $.ajax({
                        type:"DELETE",
                        url: "/delete-comment",
                        data:{
                            'comment_id':comment_id
                        },
                        success:function(res){
                            if(res.status == 200){
                                thisClicked.closest('.comment-container').remove();
                                alert(res.message);
                            }
                            else{
                                alert(res.message);
                            }
                        }
                    })
                }
            });
        });

    </script>
@endsection


