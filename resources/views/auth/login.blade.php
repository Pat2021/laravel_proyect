<x-layout>
    <x-slot name="title">login</x-slot>

    <div class="container mx-auto px-4 py-8">
        <h1 class="text-2xl font-bold mb-6">Login to your account</h1>

        <form method="POST" action="{{ route('login') }}" class="max-w-md mx-auto bg-white p-6 rounded-lg shadow-md">
            @csrf

            <div class="mb-4">
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input id="email" type="email" name="email" value="{{ old('email') }}" required autofocus
                       class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring-blue-500">
                @error('email')
                    <span class="text-red-500 text-sm">{{ $message }}</span>
                @enderror
            </div>

            <div class="mb-4">
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <input id="password" type="password" name="password" required
                       class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring-blue-500">
                @error('password')
                    <span class="text-red-500 text-sm">{{ $message }}</span>
                @enderror
            </div>
            {{-- Remember Me checkbox --}}
            <div class="mb-4">
                <label class="inline-flex items-center">
                    <input type="checkbox" name="remember" class="form-checkbox text-blue-600">
                    <span class="ml-2 text-sm text-gray-600">Remember Me</span>
                </label>
            </div>

                @error('failed')
                    <div class="mb-4 text-red-500 text-sm">
                        {{ $message }}
                    </div>  
                    
                @enderror


            <div class="mb-6">
                <button type="submit"
                        class="w-full bg-blue-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50">
                    Login
                </button>
            </div>
        </form>
    </div>
</x-layout>