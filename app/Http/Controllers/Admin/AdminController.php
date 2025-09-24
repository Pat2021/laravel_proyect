<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function __construct()
    {
        // Apply the auth middleware to all methods
        $this->middleware(function ($request, $next) {
            if (auth()->check() && auth()->user()->role === 'admin' ) {
                return $next($request);
            }
            abort(403, 'Access denied. Admin only area.');
        });
    }
    //
    public function index()
    {
        return view('admin.dashboard');
    }
}
