<?php

use App\Http\Controllers\PagesController;
use App\Http\Controllers\SearchController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/','App\Http\Controllers\PostController@index');

//Routes for contact us page
Route::get('contact-us', 'App\Http\Controllers\PagesController@contact');
Route::post('contact-us', 'App\Http\Controllers\PagesController@storeContact');

 

// Route for about page
Route::get('/about','App\Http\Controllers\PagesController@about');

// Route for services page
Route::get('/services','App\Http\Controllers\PagesController@services');

// creating resource routes for the posts
Route::resource('posts',PostController::class);

Auth::routes();

Route::get('/dashboard', [App\Http\Controllers\DashboardController::class, 'index']);




// creating routes for comments
Route::post('/comment/store','App\Http\Controllers\CommentController@store')->name('comment.add');
// Route for replies
Route::post('/reply/store','App\Http\Controllers\CommentController@replyStore')->name('reply.add');
// To delete the comment or reply
Route::delete('/delete-comment','App\Http\Controllers\CommentController@destroy');
// To edit the comment
Route::get('/comments/{id}/edit','App\Http\Controllers\CommentController@edit');

// Routes for live search
Route::get('/live_search', 'App\Http\Controllers\Search@index');
Route::get('/live_search/action', 'App\Http\Controllers\Search@action')->name('live_search.action');

// Like Or Dislike
Route::post('/save-likedislike','App\Http\Controllers\PostController@save_likedislike');