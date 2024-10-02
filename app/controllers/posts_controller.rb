require_relative "../services/post_service"

class PostsController < ApplicationController
  def index
    page = params[:page] || 1
    search_query = params[:search] || ""

    all_posts = PostService.all_posts

    if search_query.present?
      all_posts = all_posts.where("LOWER(title) LIKE ?", "%#{search_query.downcase}%")
    end

    total_pages = (all_posts.count.to_f / ITEMS_PER_PAGE).ceil
    posts = all_posts.offset((page.to_i - 1) * ITEMS_PER_PAGE).limit(ITEMS_PER_PAGE)

    render inertia: "posts/PostList", props: {
      posts: posts.as_json(include: [ :author, :tags ]),
      currentPage: page.to_i,
      totalPages: total_pages,
      searchQuery: search_query
    }
  end

  def show
    post = PostService.find_post(params[:id])

    if post
      render inertia: "posts/PostDetail", props: {
        post: post.as_json(include: { author: {}, tags: {}, comments: { include: :author } })
      }
    else
      redirect_to posts_path, alert: "Không tìm thấy bài viết"
    end
  end
end
