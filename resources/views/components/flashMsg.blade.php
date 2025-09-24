@props([
    'bg' => 'green', 
    'msg' => '',
])

@props(['bg' => 'green', 'msg' => ''])

@php
    $styles = [
        'green' => 'bg-green-100 text-green-700 border-green-200',
        'red'   => 'bg-red-100 text-red-700 border-red-200',
        'yellow'=> 'bg-yellow-100 text-yellow-700 border-yellow-200',
        'blue'  => 'bg-blue-100 text-blue-700 border-blue-200',
    ];

    $icons = [
        'green' => '✔️',
        'red'   => '❌',
        'yellow'=> '⚠️',
        'blue'  => 'ℹ️',
    ];

    $classes = $styles[$bg] ?? $styles['blue'];
    $icon = $icons[$bg] ?? $icons['blue'];
@endphp

<div 
    x-data="{ show: true }"
    x-init="setTimeout(() => show = false, 4000)"
    x-show="show"
    x-transition
    class="flex items-center gap-2 px-4 py-2 mb-2 rounded text-sm font-medium border shadow-sm {{ $classes }}"
>
    <span>{{ $icon }}</span>
    <span>{{ $msg }}</span>

    <button @click="show = false" class="ml-auto font-bold hover:opacity-70">
        ✖
    </button>
</div>