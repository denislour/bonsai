json.id comment.id
json.body comment.body
json.created_at comment.created_at
json.post_id comment.post_id
json.author do
  json.id comment.user.id
  json.email comment.user.email_address
end
