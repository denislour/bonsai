json.partial! "api/v1/posts/post", post: @post

json.comments do
  json.array! @post.comments do |comment|
    json.partial! "api/v1/comments/comment", comment: comment
  end
end
