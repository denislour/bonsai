<script>
  export let post;
</script>

{#if post}
  <div class="container mx-auto px-4 py-8">
    <article class="max-w-3xl mx-auto">
      <h1 class="text-4xl font-bold mb-4">{post.title}</h1>

      <div class="flex items-center space-x-4 mb-6">
        <img
          src={post.author.avatar}
          alt={post.author.name}
          class="w-10 h-10 rounded-full"
        />
        <div>
          <p class="font-semibold">{post.author.name}</p>
          <p class="text-sm text-gray-500">{post.date}</p>
        </div>
      </div>

      <img
        src={post.image}
        alt={post.title}
        class="w-full h-64 object-cover rounded-lg mb-6"
      />

      <div class="prose max-w-none mb-8">
        {@html post.content}
      </div>

      <div class="flex flex-wrap gap-2 mb-8">
        {#each post.tags as tag}
          <span
            class="bg-gray-200 text-gray-700 px-3 py-1 rounded-full text-sm"
          >
            {tag.name}
          </span>
        {/each}
      </div>

      <div class="border-t border-gray-200 pt-8">
        <h2 class="text-2xl font-bold mb-4">Bình luận</h2>
        {#each post.comments as comment}
          <div class="bg-gray-50 p-4 rounded-lg mb-4">
            <div class="flex items-center space-x-2 mb-2">
              <img
                src={comment.author.avatar}
                alt={comment.author.name}
                class="w-8 h-8 rounded-full"
              />
              <span class="font-semibold">{comment.author.name}</span>
              <span class="text-sm text-gray-500">{comment.date}</span>
            </div>
            <p>{comment.content}</p>
          </div>
        {/each}
        <div class="mt-4">
          <textarea
            class="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            rows={4}
            placeholder="Viết bình luận của bạn..."
          ></textarea>
          <button
            class="mt-2 bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 transition duration-300"
          >
            Gửi bình luận
          </button>
        </div>
      </div>
    </article>
  </div>
{:else}
  <div class="container mx-auto px-4 py-8">
    <p>Không tìm thấy bài viết.</p>
  </div>
{/if}
