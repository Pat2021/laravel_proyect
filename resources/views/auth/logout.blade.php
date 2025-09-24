<x-layout>
    <x-slot name="title">Logout</x-slot>

    <div class="container mx-auto px-4 py-8">
        <h1 class="text-2xl font-bold mb-6">You have been logged out</h1>
        <p class="mb-4">Thank you for visiting {{ env('APP_NAME') }}. You have successfully logged out.</p>
        <a href="{{ url('/') }}" class="text-blue-600 hover:underline">Return to Home</a>
    </div>
</x-layout>