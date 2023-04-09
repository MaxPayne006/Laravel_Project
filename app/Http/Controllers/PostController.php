<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\LikeDislike;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Contracts\Cache\Store;
use Illuminate\Support\Facades\Storage;
use phpDocumentor\Reflection\Types\Nullable;

class PostController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // This will block every page except the index and show page un authenticated users
        $this->middleware('auth',['except'=>['index','show']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        /* returning view
         $posts = Post::all(); // fetch all the data from posts table
         Can also order things
        
        return Post::where('title','Post One')->get();

         Can Also fetch the data using DB library And writing SQL Commands
        $posts = DB::select('SELECT * FROM posts');
        */

        // $posts = Post::orderBy('title','asc')->get();

        // $posts = Post::orderBy('title','asc')->take(1)->get(); 
        // Pagination

        $posts = Post::orderBy('created_at','desc')->paginate(10);
        return view('posts.index')->with('posts',$posts);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //Create the posts
        return view('posts.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validating the inputs
        $this->validate($request,[
            'title' => 'required',
            'body' => 'required',
            'cover_image' => 'image|nullable|max:1999'
        ]);

        // Handling file upload
        if($request->hasFile('cover_image')){
            // Get file name with extension
            $filenameWithExt = $request->file('cover_image')->getClientOriginalName();
            // Get just file name
            $filename = pathinfo($filenameWithExt,PATHINFO_FILENAME);
            // Get just extension
            $extension = $request->file('cover_image')->getClientOriginalExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension; // did this to make the file name unique
            // upload the image
            $path = $request->file('cover_image')->storeAs('public/cover_images',$fileNameToStore);
        }
        else{
            $fileNameToStore = 'noimage.jpg';
        }
        // Create Post
        $post = new Post;
        $post->title = $request->input('title');
        $post->body = $request->input('body');
        $post->user_id = auth()->user()->id; // using auth to access user data from user table
        $post->cover_image  = $fileNameToStore;
        $post->save();

        return redirect('/posts')->with('success','Post Created');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)  // getting id from the url
    {
        // fetching from db
        $post =  Post::find($id);
        // $postAuthor = $post->user;
        $posts = Post::orderBy('title','asc')->take(4)->get(); 
        return view('posts.show',compact('post', 'posts')); // compact is used to pass data to the view
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post =  Post::find($id);
        // Check for Correct User
        if(auth()->user()->id !== $post->user_id)
            {
                return redirect('/posts')->with('error','Unauthorized Page'); 
            }

        return view('posts.edit')->with('post',$post);
    
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
         // Validating the inputs
         $this->validate($request,[
            'title' => 'required',
            'body' => 'required'
        ]);
        
        // Handling file upload
        if($request->hasFile('cover_image')){
            // Get file name with extension
            $filenameWithExt = $request->file('cover_image')->getClientOriginalName();
            // Get just file name
            $filename = pathinfo($filenameWithExt,PATHINFO_FILENAME);
            // Get just extension
            $extension = $request->file('cover_image')->getClientOriginalExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension; // did this to make the file name unique
            // upload the image
            $path = $request->file('cover_image')->storeAs('public/cover_images',$fileNameToStore);
        }


        // Updating Post
        $post = Post::find($id);
        $post->title = $request->input('title');
        $post->body = $request->input('body');
        if($request->hasFile('cover_image')){
            $post->cover_image = $fileNameToStore;
        }
        $post->save();

        return redirect('/posts')->with('success','Post Updated');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $post = post::find($id);

        // Check for Correct User
        if(auth()->user()->id !== $post->user_id)
            {
                return redirect('/posts')->with('error','Unauthorized Page'); 
            }
        
        if($post->cover_image != 'noimage.jpg'){ // doing this because dont want to delete noimage.jpg it may be used by some other user
            // Delete the Image 
            // WE have to bring in the storage library
            
                Storage::delete('public/cover_images/'.$post->cover_image);
        
            // Storage::delete('public/storage/cover_images'.$post->cover_image);
        }

        $post->delete();

        return redirect('/posts')->with('success','Post Removed');
    }

    // Save Like Or dislike
    function save_likedislike(Request $request){
        $data=new LikeDislike;
        $data->post_id=$request->post;
        if($request->type=='like'){
            $data->like=1;
        }else{
            $data->dislike=1;
        }
        $data->save(); 
        return response()->json([ 
            'bool'=>true
        ]);
    }
}
