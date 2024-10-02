import { writable, get } from "svelte/store";
import { fetchPosts } from "./postStore";

export const currentPage = writable(1);
export const totalPages = writable(1);

export function initializePagination(initialData) {
  if (initialData) {
    currentPage.set(initialData.currentPage || 1);
    totalPages.set(initialData.totalPages || 1);
  }
}

export function goToPage(page) {
  currentPage.set(page);
  fetchPosts();
}

export function getPaginationParams() {
  return {
    page: get(currentPage),
  };
}
