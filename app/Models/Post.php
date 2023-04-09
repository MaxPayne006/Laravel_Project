<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    // Setting table name
    protected $table = 'posts';
    // Primary Key
    public $primaryKey = 'id';
    // Timestamps
    public $timestamps = true;
    // We will add relationships here other things handled in Model

    // Creating a relationship

    public function user(){
        return $this->belongsTo('App\Models\User');
    }

    // Creating a polymorphic relationship for comments
    public function comments()
    {
        return $this->morphMany(Comment::class,'commentable')->whereNull('parent_id');
    }

    // relationship for likes and dislikes
    // Likes
    public function likes(){
        return $this->hasMany('App\Models\LikeDislike','post_id')->sum('like');
    }
    // Dislikes
    public function dislikes(){
        return $this->hasMany('App\Models\LikeDislike','post_id')->sum('dislike');
    }
}
