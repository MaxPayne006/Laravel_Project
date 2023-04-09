<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Search extends Controller
{
    function index()
    {
     return view('search');
    }

    function action(Request $request)
    {
     if($request->ajax()) 
     {
      $output = '';
      $query = $request->get('query');
      if($query != '')
      {
       $data = DB::table('posts')
         ->where('title', 'like', '%'.$query.'%')
         ->orWhere('body', 'like', '%'.$query.'%')
         ->orderBy('id', 'desc')
         ->get();
         
      }
      else
      {
       $data = DB::table('posts')
         ->orderBy('id', 'desc')
         ->get();
      }
      $total_row = $data->count();
      if($total_row > 0)
      {
       foreach($data as $row)
       { $intro = $row->body;
         $intro = substr($intro,0,250);
         $output .= '<div class="col-12 " style="margin-bottom: 1.5rem;">
                      <a href="/posts/'.$row->id.'" class="color-results" style="text-decoration:none">
                        <div>
                          <h3>'.$row->title.'</h3>
                        </div>'.'
                        <div style="margin-top:1rem">
                          <p>'.$intro.'</p>
                        </div>
                      </a>
                    </div><hr>';
       }
      }
      else
      {
       $output = '<h4>No posts found</h4>

       ';
      }
      $data = array(
       'table_data'  => $output,
       'total_data'  => $total_row
      );

      echo json_encode($data);
     }
    }
}
