<script>
  import { Search } from "lucide-svelte";
  import { router } from "@inertiajs/svelte";

  export let posts;
  export let currentPage;
  export let totalPages;
  export let searchQuery = ""; // Thêm biến này để lưu trữ từ khóa tìm kiếm

  function getRandomAvatarUrl() {
    return `https://picsum.photos/40/40?random=${Math.random()}`;
  }

  function goToPage(page) {
    router.visit(`/posts?page=${page}&search=${searchQuery}`, {
      preserveState: true,
    });
  }

  function handleSearch() {
    router.visit(`/posts?search=${searchQuery}`, { preserveState: true });
  }

  function goToPostDetail(postId) {
    if (postId) {
      router.visit(`/posts/${postId}`);
    } else {
      console.error("Post ID is undefined");
    }
  }

  function getPaginationRange(currentPage, totalPages) {
    let start = Math.max(1, currentPage - 2);
    let end = Math.min(totalPages, currentPage + 2);

    if (start === 1) {
      end = Math.min(5, totalPages);
    }
    if (end === totalPages) {
      start = Math.max(1, totalPages - 4);
    }

    return Array.from({ length: end - start + 1 }, (_, i) => start + i);
  }
</script>

<div class="container mx-auto px-4 py-8">
  <h1 class="text-4xl font-bold text-center mb-8">Blog Du Lịch Việt Nam</h1>

  <div class="mb-8">
    <div class="relative">
      <Search
        class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"
      />
      <input
        type="search"
        placeholder="Tìm kiếm bài viết..."
        class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
        bind:value={searchQuery}
        on:keyup={(e) => e.key === "Enter" && handleSearch()}
      />
      <button
        class="absolute right-2 top-1/2 transform -translate-y-1/2 bg-blue-500 text-white px-4 py-1 rounded-md hover:bg-blue-600 transition duration-300"
        on:click={handleSearch}
      >
        Tìm kiếm
      </button>
    </div>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
    {#each posts as post}
      <div class="bg-white rounded-lg shadow-md overflow-hidden">
        <img
          src={post.image}
          alt={post.title}
          class="w-full h-48 object-cover"
        />
        <div class="p-6">
          <h2 class="text-xl font-semibold mb-2">{post.title}</h2>
          <p class="text-gray-600 mb-4">{post.excerpt}</p>
          <div class="flex items-center mb-4">
            <img
              src={getRandomAvatarUrl()}
              alt={post.author}
              class="w-10 h-10 rounded-full mr-4"
            />
            <div>
              <p class="font-semibold">{post.author}</p>
              <p class="text-sm text-gray-500">{post.date}</p>
            </div>
          </div>
          <div class="mb-4">
            {#each post.tags as tag}
              <span
                class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2"
              >
                {tag}
              </span>
            {/each}
          </div>
          <button
            class="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition duration-300"
            on:click={() => goToPostDetail(post.id)}
          >
            Đọc thêm
          </button>
        </div>
      </div>
    {/each}
  </div>

  {#if totalPages > 1}
    <div class="flex justify-center mt-8 space-x-2">
      <button
        class="px-4 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition duration-300"
        on:click={() => goToPage(currentPage - 1)}
        disabled={currentPage === 1}
      >
        Trước
      </button>

      {#if getPaginationRange(currentPage, totalPages)[0] > 1}
        <button
          class="px-4 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition duration-300"
          on:click={() => goToPage(1)}
        >
          1
        </button>
        {#if getPaginationRange(currentPage, totalPages)[0] > 2}
          <span class="px-4 py-2">...</span>
        {/if}
      {/if}

      {#each getPaginationRange(currentPage, totalPages) as page}
        <button
          class="px-4 py-2 {currentPage === page
            ? 'bg-blue-500 text-white'
            : 'border border-gray-300'} rounded-md hover:bg-blue-600 hover:text-white transition duration-300"
          on:click={() => goToPage(page)}
        >
          {page}
        </button>
      {/each}

      {#if getPaginationRange(currentPage, totalPages)[getPaginationRange(currentPage, totalPages).length - 1] < totalPages}
        {#if getPaginationRange(currentPage, totalPages)[getPaginationRange(currentPage, totalPages).length - 1] < totalPages - 1}
          <span class="px-4 py-2">...</span>
        {/if}
        <button
          class="px-4 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition duration-300"
          on:click={() => goToPage(totalPages)}
        >
          {totalPages}
        </button>
      {/if}

      <button
        class="px-4 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition duration-300"
        on:click={() => goToPage(currentPage + 1)}
        disabled={currentPage === totalPages}
      >
        Sau
      </button>
    </div>
  {/if}
</div>
