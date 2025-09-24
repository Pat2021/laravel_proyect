<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;
use Illuminate\Support\Facades\Storage;

class AdminPostController extends Controller
{
    public function __construct()
        {
            $this->middleware(function ($request, $next) {
            if (auth()->user()->role !== 'admin') {
            abort(403, 'Access denied. Admins only.');
        }
        return $next($request);
    });
}

    //Display a listing of the resource.
    public function index()
    {
        $posts = Post::with('user')->paginate(8);
        return view('admin.posts.index', compact('posts'));
    }
    // Show a single post (optional)
    public function show(Post $post)    
    {
        return view('admin.posts.show', compact('post'));
    }
    // Edit a post
    public function edit(Post $post)
    {
        $users = User::all(); // Fetch all users for the author dropdown
        return view('admin.posts.edit', compact('post', 'users'));      
    }
    // Update a post
    public function update(Request $request, Post $post)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'image' => 'nullable|image|max:3000', // Optional image
            'user_id' => 'required|exists:users,id',
        ]);
    // Update imagen if exists  
        $path = $post->image ?? null;
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($post->image) {
                Storage::disk('public')->delete($post->image);
            }
            $path = Storage::disk('public')->put('posts_images', $request->image);
        }
        // Update post
        $post->update([
            'title' => $request->title,
            'content' => $request->content,
            'image' => $path,
        ]);
        return redirect()->route('admin.posts.index')->with('success', 'Post updated successfully.');
    }
    // Delete a post
    public function destroy(Post $post)
    {
        $post->delete();
        return redirect()->route('admin.posts.index')->with('success', 'Post deleted successfully.');   
    }
}
