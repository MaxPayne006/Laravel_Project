<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;

class PagesController extends Controller
{
    
    public function index(){
        $title = "Welcome  !";
        // return view('pages.index',compact('title')) ; one way to pass in a single value
        return view('pages.index')->with('title',$title);
    }

    public function about(){
        $title = "About Us ";
        return view('pages.about')->with('title',$title);
    }

    public function storeContact(Request $request)
    {
        $contact = new Contact;
        $contact->contactname = $request->contactName;
        $contact->contactemail = $request->contactEmail;
        $contact->contactsubject = $request->contactSubject;
        $contact->contactmessage = $request->contactMessage;
        $contact->save();
        return view('pages.contact-us')->with('success','Message Sent Successfully');
    }
    public function contact(){
        $title = "Contact Us ";
        return view('pages.contact-us');
    }
    public function services(){
        // Passing multiple values into the view
        $data = array(
            'title' => 'Services',
            'services' =>['Web Design','Programming','SEO']
        );
        return view('pages.services')->with($data);
    }

    
}
