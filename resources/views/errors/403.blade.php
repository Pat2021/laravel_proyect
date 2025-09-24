<x-layout>
    <div class="text-center py-20">
        <h1 class="text-6xl font-bold text-red-600">403</h1>
        <p class="mt-4 text-xl text-gray-700">Access denied. You don’t have permission to view this page.</p>
        <a href="{{ url('/') }}" 
           class="mt-6 inline-block bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
           Back to Home
        </a>
    </div>
</x-layout>