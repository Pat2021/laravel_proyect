<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
//use Illuminate\Routing\Controllers\Middleware;
//use Illuminate\Routing\Controllers\HasMiddleware;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller 
{
    public function __construct()
    {
        // Apply the auth middleware to all methods except index and show
        $this->middleware('auth')->except(['index', 'show']);
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Retrieve all posts from the database, ordered by creation date (latest first) 
        $posts = Post::latest()->paginate(6);
        //return view('users.dashboard', ['posts' => $posts]);

        return view('posts.index', ['posts' => $posts]);
        
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
    
        // validate the incoming request data
        $fields = $request->validate([
            'title' => ['required', 'max:255'],
            'content' => ['required'],
            'image' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif,svg', 'max:3000'],
        ]);

        $path = null;
        if ($request->hasFile('image')) {
            $path = Storage::disk('public')->put('images', $request->image);
        }

        // create a new post associated with the authenticated user
        Auth::user()->posts()->create([
            'title' => $request->title,
            'content' => $request->content,
            'image' => $path,
        ]);
        // redirect to the posts index page with a success message
        return back()->with('success', 'Post created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        //
        return view('posts.show', ['post' => $post]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post)
    {
        //authorize the user to modify the post
        Gate::authorize('modify', $post);
        return view('posts.edit', ['post' => $post]);
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post)
    {
        //authorize the user to modify the post
        Gate::authorize('modify', $post);
        // Validate the incoming request data
        $request->validate([
            'title' => ['required', 'max:255'],
            'content' => ['required'],
            'image' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
        ]);
        // Prepare the data for updating
        $path = $post->image ?? null;
        if ($request->hasFile('image')) {
            // Delete the old image from storage if it exists
            if ($post->image) {
                Storage::disk('public')->delete($post->image);
            }
            // Store the new image and get its path
            $path = Storage::disk('public')->put('images', $request->image);
        }
        // Update the post with the validated data
        $post->update([
            'title' => $request->title,
            'content' => $request->content,
            'image' => $path,

        ]);

        // Redirect to the posts index page with a success message
        return redirect()->route('dashboard')->with('success', 'Post updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
        // authorize the user to modify the post
        Gate::authorize('modify', $post);
        
        //delete the image from storage
        if($post->image) {
            Storage::disk('public')->delete($post->image);
        }
        //delete the post
        $post->delete();
        //redirect to the posts index page with a success message
        return back()->with('delete', 'Post deleted successfully!');
        
    }
}
