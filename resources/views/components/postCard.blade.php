@props(['post', 'full' => false])
      <div class="card">
            {{-- title --}}
            <h2 class="text-xl font-semibold mb-2">{{ $post->title }}</h2>

            {{-- image --}}
      <div class="h-52 rounded-mb mb-4 object-cover overflow-hidden">
         @if ($post->image)
            <img src="{{ asset('storage/' . $post->image) }}" alt="Post Image">
         @else
            <img src="{{ asset('storage/images/default.jpg') }}" alt="Default Image">
         @endif
      </div>
     

            {{-- author and time --}}
         <div class="text-xs">               
            <span> Posted {{ $post->created_at->diffForHumans()}} by </span>
            <a href="{{route('posts.user', $post->user)}}" class="text-blue-500 underline">{{ $post->user->username ?? 'Anon' }}</a>
         </div>

            {{-- content --}}
         @if ($full)
            <div class="text-md">
               <span>{{ $post->content }}</span>
            </div>
         @else
            <div class="text-md">
            <span>{{ Str::limit($post->content, 150) }}</span>
            <a href="{{ route('posts.show', $post) }}" class="text-blue-500 underline">Read more &rarr;</a>
            </div>
         @endif
      
         {{ $slot }}
         
        </div>
    