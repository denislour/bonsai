puts "Cleaning database..."
[Comment, Post, Author, Tag].each(&:destroy_all)

puts "Creating authors..."
authors = [
  { name: "Nguyễn Văn A", avatar: "https://picsum.photos/40/40?random=1" },
  { name: "Trần Thị B", avatar: "https://picsum.photos/40/40?random=2" }
].map { |author| Author.create!(author) }

puts "Creating tags..."
tags = %w[Du\ lịch Văn\ hóa Việt\ Nam Nhật\ Bản Kyoto].map { |name| Tag.create!(name: name) }

puts "Creating posts..."
posts_data = [
  {
    title: "Khám phá vẻ đẹp của Việt Nam",
    excerpt: "Việt Nam, một đất nước với lịch sử lâu đời và văn hóa phong phú...",
    content: "<p>Việt Nam, một đất nước với lịch sử lâu đời và văn hóa phong phú...</p>",
    author: authors[0],
    date: Date.new(2023, 8, 15),
    tag_names: ["Du lịch", "Văn hóa", "Việt Nam"]
  },
  {
    title: "Khám phá Kyoto - Linh hồn của Nhật Bản",
    excerpt: "Kyoto, cố đô của Nhật Bản, là nơi hội tụ của truyền thống và hiện đại...",
    content: "<p>Kyoto, cố đô của Nhật Bản trong hơn một nghìn năm...</p>",
    author: authors[1],
    date: Date.new(2023, 8, 20),
    tag_names: ["Du lịch", "Văn hóa", "Nhật Bản", "Kyoto"]
  }
]

posts = posts_data.map.with_index(1) do |post_data, index|
  post = Post.create!(
    title: post_data[:title],
    excerpt: post_data[:excerpt],
    content: post_data[:content],
    author: post_data[:author],
    date: post_data[:date],
    image: "https://picsum.photos/800/400?random=#{index}"
  )
  post.tags << tags.select { |tag| post_data[:tag_names].include?(tag.name) }
  post
end

puts "Creating comments..."
comments_data = [
  { author: authors[1], content: "Bài viết rất hay và hữu ích!", date: 2.hours.ago },
  { author: Author.create!(name: "Lê Văn C", avatar: "https://picsum.photos/40/40?random=3"), content: "Tôi đã đến Hạ Long Bay năm ngoái...", date: 1.day.ago }
]

posts.each do |post|
  comments_data.each { |comment_data| Comment.create!(post: post, **comment_data) }
end

puts "Seeding completed!"