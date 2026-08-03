json.array! @posts do |post|
  json.partial! "api/v1/posts/post", post: post
end
