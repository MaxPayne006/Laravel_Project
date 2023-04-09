@foreach($comments as $comment)
<div class=" card comment-container display-comment mb-3 ">
    <div class="card-header">
        <strong style="color:#1f2640;font-size:1.2rem;">{{ $comment->user->name }}</strong> 
        @if(!Auth::guest()) {{--If user is not the guest --}} 
        @if(Auth::user()->id == $comment->user_id)
        <button type="button" value="{{$comment->id}}" class=" pull-right  deleteComment btn btn-default">Delete</button>
        @endif
        @endif
    </div>
    <div class="card-body">
            <div class="card-text">
                <p>{{ $comment->body }}</p> 
            </div>
    </div>
        <div class="card-footer">
            <span class="ml-4 pull-left">{{$comment->created_at->format('d M Y')}}</span>
            @if($comment->parent_id == NULL)
            @if(!Auth::guest()) {{--If user is not  the guest --}}
            <form method="post" action="{{ route('reply.add') }}" >
                @csrf
                <div class="form-group" id="hidden-form" style="display: none">
                    <textarea  name="comment_body" class="form-control" rows=3 required ></textarea>
                    <input type="hidden" name="post_id" value="{{ $post_id }}" />
                    <input type="hidden" name="comment_id" value="{{ $comment->id }}" />
                </div>
                <div class="form-group">
                    <input  type="submit" onclick="unhide()" class=" mybtn mt-2 mb-2 pull-right btn btn-secondary" value="Reply" />
                </div>
            </form>
            @endif
            @endif
        </div>

    @include('inc._comment_replies', ['comments' => $comment->replies])
</div> 
@endforeach