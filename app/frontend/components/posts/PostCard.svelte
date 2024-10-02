<script>
  export let post;
  export let onReadMore;
</script>

<div class="bg-white rounded-lg shadow-md overflow-hidden">
  <img src={post.image} alt={post.title} class="w-full h-48 object-cover" />
  <div class="p-6">
    <h2 class="text-xl font-semibold mb-2">{post.title}</h2>
    <p class="text-gray-600 mb-4">{post.excerpt}</p>
    <div class="flex items-center mb-4">
      <img
        src={post.author.avatar}
        alt={post.author.name}
        class="w-10 h-10 rounded-full mr-4"
      />
      <div>
        <p class="font-semibold">{post.author.name}</p>
        <p class="text-sm text-gray-500">{post.date}</p>
      </div>
    </div>
    <div class="mb-4">
      {#each post.tags as tag}
        <span
          class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2"
        >
          {tag.name}
        </span>
      {/each}
    </div>
    <button
      class="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition duration-300"
      on:click={() => onReadMore(post.id)}
    >
      Đọc thêm
    </button>
  </div>
</div>
