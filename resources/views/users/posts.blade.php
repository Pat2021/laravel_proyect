<x-layout>
        <hi class= "text-2xl font-bold mb-6"> {{ $user->username }}'s Posts &#9830;
            {{ $posts->total() }}
        </hi>
        <br></br>
      
        <div class="grid grid-cols-2 gap-6">
            @foreach ($posts as $post)
                <x-postCard :post="$post" />
            @endforeach
        </div>
   
    
    <div class="mt-6">
        {{ $posts->links() }}
    </div>
    
</x-layout>