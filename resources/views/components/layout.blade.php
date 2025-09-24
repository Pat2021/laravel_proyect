<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $title ?? env('APP_NAME') }}</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>
<body class="bg-gray-100 text-gray-900 min-h-screen flex flex-col">

    {{-- Header --}}
    <header class="bg-white shadow sticky top-0 z-50">
        <nav class="max-w-7xl mx-auto flex justify-between items-center px-6 h-16">
            {{-- Logo & Links --}}
            <div class="flex items-center space-x-6">
                <a href="{{ route('posts.index') }}" class="text-xl font-bold text-indigo-600 hover:text-indigo-700">
                    {{ env('APP_NAME') }}
                </a>
                <a href="{{ route('posts.index') }}" class="text-gray-700 hover:text-indigo-500">Home</a>
                @auth
                    <a href="{{ route('dashboard') }}" class="text-gray-700 hover:text-indigo-500">Dashboard</a>
                @endauth
            </div>

            {{-- Right side (Auth) --}}
            <div class="flex items-center space-x-4">
                @guest
                    <a href="{{ route('login') }}" class="px-4 py-2 rounded bg-indigo-500 text-white hover:bg-indigo-600 transition">
                        Login
                    </a>
                    <a href="{{ route('register') }}" class="px-4 py-2 rounded border border-indigo-500 text-indigo-500 hover:bg-indigo-50 transition">
                        Register
                    </a>
                @else
                    {{-- Dropdown --}}
                    <div class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="flex items-center gap-2 focus:outline-none">
                            <img src="{{ auth()->user()->avatar ? asset('storage/' . auth()->user()->avatar) : asset('build/img/avatar6.png') }}"
                                 alt="Profile" class="w-9 h-9 rounded-full object-cover">
                            <span class="text-sm font-medium">{{ auth()->user()->username }}</span>
                        </button>

                        <div x-show="open" @click.away="open = false"
                             x-transition
                             class="absolute right-0 mt-2 w-56 bg-white rounded-md shadow-lg ring-1 ring-black/5 overflow-hidden">
                             
                            <div class="px-4 py-3 border-b">
                                <p class="text-sm font-semibold">{{ auth()->user()->username }}</p>
                                <p class="text-xs text-gray-500">{{ auth()->user()->email }}</p>
                            </div>

                            @if (auth()->user()->role === 'admin')
                                <a href="{{ route('admin.dashboard') }}" class="block px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50">
                                    Admin Panel
                                </a>
                            @endif

                            <a href="{{ route('profile.edit') }}" class="block px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50">
                                Edit Profile
                            </a>

                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button type="submit" class="w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-red-50">
                                    Logout
                                </button>
                            </form>
                        </div>
                    </div>
                @endguest
            </div>
        </nav>
    </header>

    {{-- Main Content --}}
    <main class="flex-1 max-w-7xl mx-auto px-6 py-8">
        {{ $slot }}
    </main>

    {{-- Footer --}}
    <footer class="bg-gray-800 text-gray-300 text-center py-4">
        <p>&copy; {{ date('Y') }} {{ env('APP_NAME') }}. All rights reserved.</p>
    </footer>

</body>
</html>