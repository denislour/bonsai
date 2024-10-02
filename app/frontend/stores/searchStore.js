import { writable, get } from "svelte/store";
import { currentPage } from "./paginationStore";
import { fetchPosts } from "./postStore";

export const searchQuery = writable("");

export function initializeSearch(initialData) {
  if (initialData) {
    searchQuery.set(initialData.searchQuery || "");
  }
}

export function handleSearch(query) {
  searchQuery.set(query);
  currentPage.set(1);
  fetchPosts();
}

export function getSearchParams() {
  return {
    search: get(searchQuery),
  };
}
