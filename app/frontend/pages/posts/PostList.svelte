<script>
  import { router } from "@inertiajs/svelte";
  import SearchBar from "../../components/SearchBar.svelte";
  import PostCard from "../../components/posts/PostCard.svelte";
  import Pagination from "../../components/Pagination.svelte";

  export let posts;
  export let currentPage;
  export let totalPages;
  export let searchQuery = "";

  function goToPage(page) {
    router.visit(`/posts?page=${page}&search=${searchQuery}`, {
      preserveState: true,
    });
  }

  function handleSearch(event) {
    searchQuery = event.detail;
    router.visit(`/posts?search=${searchQuery}`, { preserveState: true });
  }

  function goToPostDetail(postId) {
    if (postId) {
      router.visit(`/posts/${postId}`);
    } else {
      console.error("Post ID is undefined");
    }
  }
</script>

<div class="container mx-auto px-4 py-8">
  <h1 class="text-4xl font-bold text-center mb-8">Blog Du Lịch Việt Nam</h1>

  <div class="mb-8">
    <SearchBar {searchQuery} on:search={handleSearch} />
  </div>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
    {#each posts as post}
      <PostCard {post} onReadMore={goToPostDetail} />
    {/each}
  </div>

  <Pagination {currentPage} {totalPages} onPageChange={goToPage} />
</div>
