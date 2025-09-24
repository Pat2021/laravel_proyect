<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{env('APP_NAME')}}</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

</head>
 <h1 class="text-4xl">Welcome to {{env('APP_NAME')}}</h1>
 <p>Laravel project!</p>
<body class="bg-slate-100 text-slate-900">
    <header class="bg-slade-800 shadow-lg">
        <nav>
            <a href="{{ route('posts.index') }}" class="text-blue text-lg font-bold">Home</a>
        @auth
            <div class="relative inline-block"
     x-data="{ open: false }"
     @click.away="open = false">

    {{-- Botón de perfil --}}
    <button @click="open = !open"
        type="button"
        class="flex items-center justify-center w-10 h-10 rounded-full border border-gray-200 hover:border-indigo-400 hover:ring-2 hover:ring-indigo-200 transition">
        {{--<img src="{{ asset('build/img/Patricia-Lara.jpg') }}"--}}
        <img src="{{ auth()->user()->avatar ? asset('storage/avatars/' . auth()->user()->avatar) : asset('build/img/Patricia-Lara.jpg') }}"
             alt="Profile"
             class="w-9 h-9 rounded-full object-cover">
    </button>

    {{-- Dropdown debajo del botón --}}
    <div x-show="open"
         @click.outside="open = false"
         x-transition:enter="transition ease-out duration-200"
         x-transition:enter-start="opacity-0 translate-y-1"
         x-transition:enter-end="opacity-100 translate-y-0"
         x-transition:leave="transition ease-in duration-150"
         x-transition:leave-start="opacity-100 translate-y-0"
         x-transition:leave-end="opacity-0 translate-y-1"
         class="absolute left-1/2 transform -translate-x-1/2 mt-2 w-48 bg-white shadow-lg rounded-lg ring-1 ring-black/5 z-50 overflow-hidden">

        <div class="px-4 py-3 border-b">
            <p class="text-sm font-medium text-gray-900">{{ auth()->user()->username }}</p>
            <p class="text-xs text-gray-500">{{ auth()->user()->email }}</p>
        </div>

        @if (auth()->user()->role==='admin')
        <div class="flex flex-col py-1 border-b">
            <a href="{{ route('admin.dashboard') }}"
               class="px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50 hover:text-indigo-600 transition">
                Admin Panel
            </a>
        </div>
        @endif  

        <div class="flex flex-col py-1">
            <a href="{{ route('dashboard') }}"
               class="px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50 hover:text-indigo-600 transition">
                Dashboard
            </a>
            <a href="{{ route('profile.edit') }}"
               class="px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50 hover:text-indigo-600 transition">
                Edit Profile
            </a>
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit"
                    class="text-left px-4 py-2 text-sm text-red-600 hover:bg-red-50 transition w-full">
                    Logout
                </button>
            </form>
        </div>
    </div>
</div>
        @endauth
        @guest 
            <ul class="flex space-x-4">
                <li><a href="{{ route('login') }}" class="text-white-500 hover:underline">login</a></li>
                <li><a href="{{ route('register') }}" class="text-white-500 hover:underline">Register</a></li>
            </ul>
        @endguest
        </nav>
    </header>
    <main class="container mx-auto px-4 py-8">
        {{ $slot }}
    </main>
</body>
</html>
