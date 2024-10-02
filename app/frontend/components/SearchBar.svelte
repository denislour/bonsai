<script>
  import { Search } from "lucide-svelte";
  import { createEventDispatcher } from "svelte";

  export let searchQuery = "";
  const dispatch = createEventDispatcher();

  function handleSearch() {
    dispatch("search", searchQuery);
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
