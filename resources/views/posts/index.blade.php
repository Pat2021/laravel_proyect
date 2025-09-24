<x-layout>
   @auth
      <hi>Welcome, {{ auth()->user()->username }}!</hi>
   @endauth
   
      <h1 class="text-2xl font-bold mb-6">Latest Posts</h1>
      
      <div class="grid grid-cols-2 gap-6">
         @foreach ($posts as $post)
            <x-postCard :post="$post" />
      @endforeach
   </div>

   <div class="mt-6">
      {{ $posts->links() }}
   </div>
   {{-- If the user is not authenticated, show the register/login links --}}
   @guest
      <p class="mb-4">Please <a href="{{ route('register') }}" class="text-blue-500 underline">register</a> or <a href="{{ route('login') }}" class="text-blue-500 underline">login</a> to continue.</p>
    @endguest
</x-layout>