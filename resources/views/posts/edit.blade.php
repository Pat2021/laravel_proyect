<x-layout>

    <a href="{{route('dashboard')}} " class="text-blue-500 underline mb-4 inline-block">&larr; Back to Dashboard</a>
    <h1 class="text-2xl font-bold mb-4">Edit Post</h1> 

    {{-- edit post form --}}

    <div class="card">  
    <h2 class="text-xl font-semibold mb-2">Update your post</h2>
    <form action="{{ route('posts.update', $post) }}" method="POST" class="mb-4"
        enctype="multipart/form-data">
       
        @csrf
        @method('PUT')

        {{-- Title and Content fields --}}
        <div class="mb-4">
            <label for="title" class="block text-gray-700">Title:</label>
            <input type="text" name="title" id="title" class="w-full border border-gray-300 p-2 rounded" required
                value="{{ old('title', $post->title) }}" class="input-field" @error('title') is-invalid @enderror/>

        </div>
        <div class="mb-4">
            <label for="content" class="block text-gray-700">Content:</label>
            <textarea name="content" id="content" rows="5" class="w-full border border-gray-300 p-2 rounded" required
            class="input-field" @error('content') is-invalid
             @enderror>{{ old('content', $post->content) }}</textarea>
        </div>
        {{-- Image upload field --}}

        
         @if ($post->image)
            <div class="h-64 rounded-mb mb-4 w-1/2 object-cover overflow-hidden">
                <label for="image" class="block text-gray-700 mb-2">Current Image:</label>
                <img src="{{ asset('storage/' . $post->image) }}" alt="Post Image">
            </div>
         @endif
        <div class="mb-4">
                <label for="" > Feature image:</label>
                <input type="file" name="image" id="image" 
                class="file:mr-4 file:py-2 file:px-4 file:text-sm file:font-semibold file:bg-gray-200 hover:file:bg-blue-100">
                @error('image') 
                <p class="error">{{ $message }}</p>
                @enderror
            </div> 

        {{-- Submit button --}}
        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Update Post</button>
    </form>
</div>
</x-layout>