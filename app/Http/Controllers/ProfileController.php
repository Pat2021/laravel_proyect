<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    //
    public function edit()
    {
        $user = Auth::user();
        return view('auth.edit-profile', compact('user'));
    }
    public function update(Request $request)
    {
        $user = Auth::user();

        $validated = $request->validate([
            'username' => 'required|string|max:255|unique:users,username,',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'password' => 'nullable|min:8|confirmed',
            'avatar' => 'nullable|image|max:3000', // Optional avatar upload
        ]);

        $user->username = $request->username;
        $user->email = $request->email;

        if ($validated['password']) {
            $user->password = Hash::make($validated['password']);
            
        }

        if ($request->hasFile('avatar')) {
            if ($user->avatar) {
                // Delete the old avatar if it exists
                Storage::disk('public')->delete($user->avatar);
            }
            $path = $request->file('avatar')->store('avatars', 'public');
            $user->avatar = $path;
        }
        $user->save();

        return back()->with('success', 'Profile updated successfully.');
    }
        
}
