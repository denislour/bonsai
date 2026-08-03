json.id post.id
json.title post.title
json.body post.body
json.created_at post.created_at

json.author do
  json.id post.user.id
  json.email post.user.email_address
end
