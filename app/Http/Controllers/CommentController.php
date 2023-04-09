<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Comment;
use Illuminate\Http\Request;
use illuminate\Http\Response;

class CommentController extends Controller
{

    public function store(Request $request)
    {
        $comment = new Comment;
        $comment->body = $request->get('comment_body');

        $comment->user()->associate($request->user());
        $post = Post::find($request->get('post_id'));
        $post->comments()->save($comment);
        return back();
    }

    public function replyStore(Request $request)
    {
        $reply = new Comment();
        $reply->body = $request->get('comment_body');
        $reply->user()->associate($request->user());
        $reply->parent_id = $request->get('comment_id');
        $post = Post::find($request->get('post_id'));

        $post->comments()->save($reply);

        return back();

    }

    public function destroy(Request $request)
    {
        $id = $request->get('comment_id');
        $comment = comment::find($id);
        // Check for Correct User
        if(auth()->user()->id !== $comment->user_id)
        {
            return response()->json([
                'status' => 401,
                'message' => 'Not authorized to delete this comment'
            ]);
        }

        $comment->delete();
        return response()->json([
            'status' => 200,
            'message' => 'Comment Deleted Successfully'
        ]);        
    }

    /*
    public function destroy($id)
    {

        $comment = comment::find($id);

        // Check for Correct User
        if(auth()->user()->id !== $comment->user_id)
            {
                return back()->with('error','Unauthorized Access'); 
            }
        
        

        $comment->delete();

        return back()->with('success','Comment Removed');
    }
    */

    public function edit($id)
    {
        $comment =  comment::find($id);
        // Check for Correct User
        if(auth()->user()->id !== $comment->user_id)
            {
                return back()->with('error','Unauthorized Access'); 
            }

        return view('comment.edit')->with('comment',$comment);
    
    }

    /*
        // Creating a comment
    public function store(Request $request)
    {
        $comment = new Comment;
        $comment->body = $request->get('comment_body');

        $comment->user()->associate($request->user());
        $post = Post::find($request->get('post_id'));
        $post->comments()->save($comment);
        return Response::json($comment);
    }

    // Editing the comment

    public function edit($id)
    {
        $comment =  comment::find($id);
        // Check for Correct User
        if(auth()->user()->id !== $comment->user_id)
            {
                return back()->with('error','Unauthorized Access'); 
            }

        return Response::json($comment);
    
    }

    // Updating the comment
    public function update(Request $request, $id)
    {
     
        $comment = Post::find($id);
        $comment->body = $request->get('comment_body');

        $comment->user()->associate($request->user());
        $post = Post::find($request->get('post_id'));
        $post->comments()->save($comment);
        return Response::json($comment);

    }

    // Deleting the comment
    public function destroy($id)
    {

        $comment = comment::find($id);

        // Check for Correct User
        if(auth()->user()->id !== $comment->user_id)
            {
                return back()->with('error','Unauthorized Access'); 
            }
        
        $comment->delete();

        return Response::json($comment);
    }

    // Storing the reply

    public function replyStore(Request $request)
    {
        $reply = new Comment();
        $reply->body = $request->get('comment_body');
        $reply->user()->associate($request->user());
        $reply->parent_id = $request->get('comment_id');
        $post = Post::find($request->get('post_id'));

        $post->comments()->save($reply);

        return Response::json($reply);

    }

    */
}
