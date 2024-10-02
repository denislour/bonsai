<script>
  export let currentPage;
  export let totalPages;
  export let onPageChange;

  function getPaginationRange(currentPage, totalPages) {
    let start = Math.max(1, currentPage - 2);
    let end = Math.min(totalPages, currentPage + 2);

    if (start === 1) {
      end = Math.min(5, totalPages);
    } else if (end === totalPages) {
      start = Math.max(1, totalPages - 4);
    }

    return Array.from({ length: end - start + 1 }, (_, index) => start + index);
  }
</script>

{#if totalPages > 1}
  <div class="flex justify-center mt-8 space-x-2">
    <button
      class="px-4 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition duration-300"
      on:click={() => onPageChange(currentPage - 1)}
      disabled={currentPage === 1}
    >
      Trước
    </button>

    {#if getPaginationRange(currentPage, totalPages)[0] > 1}
      <button
        class="px-4 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition duration-300"
        on:click={() => onPageChange(1)}
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
        on:click={() => onPageChange(page)}
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
        on:click={() => onPageChange(totalPages)}
      >
        {totalPages}
      </button>
    {/if}

    <button
      class="px-4 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition duration-300"
      on:click={() => onPageChange(currentPage + 1)}
      disabled={currentPage === totalPages}
    >
      Sau
    </button>
  </div>
{/if}
