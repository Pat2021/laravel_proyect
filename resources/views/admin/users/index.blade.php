<x-layout>
    <a href="{{ route('admin.dashboard') }}" class="block mb-12 text-xs text-blue-500">&larr; Go back to your dashboard</a>
    
        <h1 class="title">Manage Users</h1>
            <a href="{{ route('admin.users.create') }}"
            class="inline-block mb-4 bg-slate-600 text-white px-4 py-2 rounded hover:bg-slate-700">
            Create New User
    </a>
    
    @if (session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
            {{ session('success') }}
        </div>
    @endif          
    <table class="min-w-full bg-white border border-gray-200">
        <thead>
        <tr>
            <th class="py-2 px-4 border-b">ID</th>
            <th class="py-2 px-4 border-b">Username</th>
            <th class="py-2 px-4 border-b">Email</th>
            <th class="py-2 px-4 border-b">Role</th>
            <th class="py-2 px-4 border-b">Actions</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($users as $user)
            <tr class="hover:bg-gray-100">
                <td class="py-2 px-4 border-b">{{ $user->id }}</td>
                <td class="py-2 px-4 border-b">{{ $user->username }}</td>
                <td class="py-2 px-4 border-b">{{ $user->email }}</td>
                <td class="py-2 px-4 border-b">{{ ucfirst($user->role) }}</td>
                <td class="py-2 px-4 border-b space-x-2">
                    <a href="{{ route('admin.users.edit', $user) }}"
                        class="text-blue-500 hover:underline">Edit</a>
                    <form action="{{ route('admin.users.destroy', $user) }}" method="POST" class="inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit"
                            class="text-red-500 hover:underline"
                            onclick="return confirm('Are you sure you want to delete this user?')">
                            Delete
                        </button>
                    </form>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
<div class="mt-4">
    {{ $users->links() }}
</div>
</x-layout> 