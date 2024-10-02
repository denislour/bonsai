class PostService
  def self.all_posts
    Post.includes(:author, :tags).all
  end

  def self.find_post(id)
    Post.includes(:author, :tags, comments: :author).find(id)
  end

  def self.create_post(post_params)
    Post.create!(post_params)
  end

  def self.update_post(id, post_params)
    post = Post.find(id)
    post.update!(post_params)
    post
  end

  def self.delete_post(id)
    Post.find(id).destroy
  end
end
