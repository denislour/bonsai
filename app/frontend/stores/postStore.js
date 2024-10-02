import { writable } from "svelte/store";
import { router } from "@inertiajs/svelte";
import {
  getPaginationParams,
  currentPage,
  totalPages,
} from "./paginationStore";
import { getSearchParams } from "./searchStore";

export const posts = writable([]);

export function initializeStore(initialData) {
  if (initialData) {
    posts.set(initialData.posts || []);
  }
}

export function fetchPosts() {
  const params = {
    ...getPaginationParams(),
    ...getSearchParams(),
  };

  router.get("/posts", params, {
    preserveState: true,
    preserveScroll: true,
    only: ["posts", "currentPage", "totalPages"],
    onSuccess: (page) => {
      posts.set(page.props.posts);
      currentPage.set(page.props.currentPage);
      totalPages.set(page.props.totalPages);
    },
  });
}

export function goToPostDetail(postId) {
  router.visit(`/posts/${postId}`);
}
