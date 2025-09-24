<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    //
    public function register(Request $request)
    {
       //validate
        $fields = $request->validate([
              'username' => 'required|max:255',
              'email' => 'required|email|max:255|unique:users',
              'password' => 'required|min:3|confirmed',
          ]);
          // dd($fields);
  
          //create user
          $user = User::create($fields);
          // dd('ok');

           //login user

           Auth::login($user);
  
          //return response
          return redirect()->route('dashboard');
       
    }
    public function login(Request $request)
    { 
        //validate
        $fields = $request->validate([
              'email' => 'required|email',
              'password' => 'required',
          ]);

            //attempt to login
          if(Auth::attempt($fields, $request->remember)){
             // login success
              return redirect()->route('dashboard');
        }else{
             // login failed
             return back()->withErrors(['failed' => 'Wrong password or email'])->withInput();
          }
    }
    public function logout(Request $request)
    {
        Auth::logout(); // Use the Auth facade to log out the user
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return view('auth.logout');
    }
}
