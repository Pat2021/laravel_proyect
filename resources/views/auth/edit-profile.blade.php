<x-layout>
    <x-slot name="title">Edit Profile</x-slot>

    <h1 class="text-2xl font-bold mb-4">Edit Profile</h1>

    <div class="mx-auto max-w-screen-sm card">
        @if (session('success'))
        <x-flashMsg msg="{{ session('success') }}" type="success" />
    @endif
   

    <form action="{{ route('profile.update') }}" method="POST" enctype="multipart/form-data">
        @csrf

        {{-- username --}}
        <div class="mb-4">
            <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
            <input type="text" name="username" id="username" value="{{ old('username', auth()->user()->username) }}" required
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2">
            @error('username')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>
        {{-- email --}}
        <div class="mb-4">
            <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
            <input type="email" name="email" id="email" value="{{ old('email', auth()->user()->email) }}" required
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2">
            @error('email')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>
        {{-- password --}}
        <div class="mb-4">
            <label for="password" class="block text-sm font-medium text-gray-700">New Password</label>
            <input type="password" name="password" id="password"
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2">
            @error('password')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>
        {{-- password confirmation --}}
        <div class="mb-4">
            <label for="password_confirmation" class="block text-sm font-medium text-gray-700">Confirm New Password</label>
            <input type="password" name="password_confirmation" id="password_confirmation"
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2">
            @error('password_confirmation')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>  
        {{-- avatar --}}
        <div class="mb-4">
            <label for="avatar" class="block text-sm font-medium text-gray-700">Profile Imagen</label>
            <input type="file" name="avatar" id="avatar"
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2">
            @if ($user->avatar)
                <img src="{{ asset('storage/avatars/' . $user->avatar) }}" alt="Current Avatar" class="w-20 h-20 rounded-full mt-2">
            @endif  
            @error('avatar')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div>
            <button type="submit"
                class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 transition">Update Profile</button>
        </div>
    </form>
</x-layout>