<script>
  import { Search } from "lucide-svelte";
  import { searchQuery, handleSearch } from "../stores/searchStore";

  function onSearch() {
    handleSearch($searchQuery);
  }
</script>

<div class="relative">
  <Search
    class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"
  />
  <input
    type="search"
    placeholder="Tìm kiếm bài viết..."
    class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
    bind:value={$searchQuery}
    on:keyup={(e) => e.key === "Enter" && onSearch()}
  />
  <button
    class="absolute right-2 top-1/2 transform -translate-y-1/2 bg-blue-500 text-white px-4 py-1 rounded-md hover:bg-blue-600 transition duration-300"
    on:click={onSearch}
  >
    Tìm kiếm
  </button>
</div>
