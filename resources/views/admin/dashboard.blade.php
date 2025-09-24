<x-layout>

    <x-slot name="title">Admin Dashboard</x-slot>
<h1 class="text-3xl font-bold text-center mb-8">Admin Dashboard</h1>    


    <div class="space-y-6 max-w-md mx-auto text-center">
        <a href="{{ route('admin.users.index') }}"
            class="block p-5 bg-slate-700 text-white rounded-lg shadow-md border border-slate-600
        hover:bg-slate-800 hover:shadow-lg transition duration-300 font-semibold text-lg">
    
        Manage Users
    </a>
        <a href="{{ route('admin.posts.index') }}"
            class="block p-5 bg-slate-600 text-white rounded-lg shadow-md border border-slate-500
        hover:bg-slate-700 hover:shadow-lg transition duration-300 font-semibold text-lg">

        Manage Posts
    </a>
</div>

</x-layout>
