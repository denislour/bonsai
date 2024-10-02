<script>
  import { onMount } from "svelte";
  import SearchBar from "../../components/SearchBar.svelte";
  import PostCard from "../../components/posts/PostCard.svelte";
  import Pagination from "../../components/Pagination.svelte";
  import { posts, initializeStore, fetchPosts } from "../../stores/postStore";
  import { initializePagination } from "../../stores/paginationStore";
  import { initializeSearch } from "../../stores/searchStore";

  export let initialData;

  onMount(() => {
    initializeStore(initialData);
    initializePagination(initialData);
    initializeSearch(initialData);
    fetchPosts();
  });
</script>

<div class="container mx-auto px-4 py-8">
  <h1 class="text-4xl font-bold text-center mb-8">Blog Du Lịch Việt Nam</h1>

  <div class="mb-8">
    <SearchBar />
  </div>

  {#if $posts && $posts.length > 0}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      {#each $posts as post}
        <PostCard {post} />
      {/each}
    </div>
    <Pagination />
  {:else}
    <p class="text-center text-gray-600">Không có bài viết nào.</p>
  {/if}
</div>
