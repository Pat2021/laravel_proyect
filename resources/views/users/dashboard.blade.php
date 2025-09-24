<x-layout>
    <h1 class="text-2xl font-bold mb-4">Dashboard</h1>
    <p>Welcome, {{ auth()->user()->username }}! 
        You have {{$posts->total()}} posts in your dashboard.</p>

    {{-- create post form --}}
    <div class=" card mt-4">
        <h2 class="text-xl font-semibold mb-2">Create a New Post</h2>
       
        {{-- session message --}}

        @if (session('success'))
                <x-flashMsg bg="green" :msg="session('success')" />        
            @elseif (session('delete'))        
                <x-flashMsg bg="red" :msg="session('delete')" />     
        @endif
       
        <form action="{{ route('posts.store') }}" method="POST" class="mb-4"
        enctype="multipart/form-data">  
            @csrf

            {{-- Title and Content fields --}}
            <div class="mb-4">
                <label for="title" class="block text-gray-700">Title:</label>
                <input type="text" name="title" id="title" class="w-full border border-gray-300 p-2 rounded" required
                    value="{{ old('title') }}" class="input-field" @error('title') is-invalid @enderror/>

            </div>
            <div class="mb-4">
                <label for="content" class="block text-gray-700">Content:</label>
                <textarea name="content" id="content" rows="5" class="w-full border border-gray-300 p-2 rounded" required
                value="{{ old('content')}}" class="input-field" @error('content') is-invalid
                 @enderror ></textarea>
            </div>

            {{-- Image upload field --}}
            <div class="mb-4">
                <label for="" > Feature image:</label>
                <input type="file" name="image" id="image" 
                class="file:mr-4 file:py-2 file:px-4 file:text-sm file:font-semibold file:bg-gray-200 hover:file:bg-blue-100">
                @error('image') 
                <p class="error">{{ $message }}</p>
                @enderror
            </div> 
        
            {{-- Submit button --}}
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Create Post</button>
        </form>
    </div>
         {{-- Display user's posts --}}
    <div class="mt-6">
        <h2 class="text-xl font-semibold mb-2">Your Latest Posts</h2>
    
        <div class="grid grid-cols-2 gap-6">
         @foreach ($posts as $post)

            <x-postCard :post="$post">
                {{-- Update and Delete buttons --}}
                <div class="mt-4 flex justify-between">
                    <a href="{{ route('posts.edit', $post) }}" class="bg-yellow-500 text-white px-3 py-1 rounded">Update</a>
                    <form action="{{ route('posts.destroy', $post) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this post?');">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="bg-red-500 text-white px-3 py-1 rounded">Delete</button>
                    </form>
                </div>  
            </x-postCard> 
    @endforeach
   </div>
    </div>
    <div class="mt-4">
        {{ $posts->links() }}
    </div>

</x-layout>