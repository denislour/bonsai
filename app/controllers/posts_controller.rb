class PostsController < ApplicationController
  def index
    page = params[:page] || 1
    per_page = 12
    search_query = params[:search]

    all_posts = generate_all_posts

    if search_query.present?
      all_posts = all_posts.select { |post| post[:title].downcase.include?(search_query.downcase) }
    end

    total_pages = (all_posts.length.to_f / per_page).ceil
    posts = all_posts.slice((page.to_i - 1) * per_page, per_page)

    render inertia: "posts/PostList", props: {
      posts: posts,
      currentPage: page.to_i,
      totalPages: total_pages,
      searchQuery: search_query
    }
  end

  def show
    post = find_post(params[:id])

    if post
      post[:comments] = generate_comments # Thêm comments vào post
      render inertia: "posts/PostDetail", props: {
        post: post
      }
    else
      redirect_to posts_path, alert: "Không tìm thấy bài viết"
    end
  end

  private

  def find_post(id)
    all_posts = generate_all_posts
    all_posts.find { |p| p[:id].to_s == id.to_s }
  end

  def generate_comments
    [
      { author: "Trần Thị B", content: "Bài viết rất hay và hữu ích! Tôi đã học được nhiều điều mới về Việt Nam.", date: "2 giờ trước" },
      { author: "Lê Văn C", content: "Tôi đã đến Hạ Long Bay năm ngoái và hoàn toàn đồng ý với bạn. Đó là một trong những nơi đẹp nhất mà tôi từng thấy.", date: "1 ngày trước" }
    ]
  end

  def generate_all_posts
    base_posts = [
      {
        title: "Khám phá vẻ đẹp của Việt Nam",
        excerpt: "Việt Nam, một đất nước với lịch sử lâu đời và văn hóa phong phú, là điểm đến hấp dẫn cho du khách từ khắp nơi trên thế giới...",
        author: "Nguyễn Văn A",
        date: "15 tháng 8, 2023",
        tags: [ "Du lịch", "Văn hóa", "Việt Nam" ],
        image: "https://picsum.photos/800/400?random=1",
        content: <<-HTML
          <p>Việt Nam, một đất nước với lịch sử lâu đời và văn hóa phong phú, là điểm đến hấp dẫn cho du khách từ khắp nơi trên thế giới. Từ những bãi biển tuyệt đẹp ở miền Trung đến những dãy núi hùng vĩ ở phía Bắc, Việt Nam có rất nhiều điều để khám phá.</p>

          <h2>Hạ Long Bay - Kỳ quan thiên nhiên thế giới</h2>
          <p>Hạ Long Bay, một trong những kỳ quan thiên nhiên của thế giới, là điểm nhấn không thể bỏ qua khi đến Việt Nam. Với hàng nghìn hòn đảo đá vôi nhô lên từ mặt nước xanh ngọc bích, Hạ Long Bay mang đến cảnh quan tuyệt đẹp và trải nghiệm du lịch độc đáo.</p>

          <h2>Phố cổ Hội An - Nơi thời gian ngừng lại</h2>
          <p>Hội An, một thành phố cổ nằm ở miền Trung Việt Nam, là nơi bạn có thể cảm nhận được không khí của một thời kỳ đã qua. Với những ngôi nhà cổ, đèn lồng đầy màu sắc và những con phố nhỏ quanh co, Hội An mang đến cho du khách cảm giác như đang lạc vào một thế giới khác.</p>

          <h2>Ẩm thực Việt Nam - Hương vị đặc trưng</h2>
          <p>Không thể nói về Việt Nam mà không nhắc đến ẩm thực phong phú và đa dạng. Từ phở Hà Nội đến bánh mì Sài Gòn, mỗi món ăn đều mang trong mình một câu chuyện về văn hóa và lịch sử của đất nước. Hãy thử thách vị giác của bạn với các món ăn đường phố ngon tuyệt như bánh xèo, gỏi cuốn, và cà phê sữa đá.</p>
        HTML
      },
      {
        title: "Khám phá Kyoto - Linh hồn của Nhật Bản",
        excerpt: "Kyoto, cố đô của Nhật Bản, là nơi hội tụ của truyền thống và hiện đại, mang đến cho du khách trải nghiệm độc đáo về văn hóa Nhật Bản...",
        author: "Trần Thị B",
        date: "20 tháng 8, 2023",
        tags: [ "Du lịch", "Văn hóa", "Nhật Bản", "Kyoto" ],
        image: "https://picsum.photos/800/400?random=2",
        content: <<-HTML
          <p>Kyoto, cố đô của Nhật Bản trong hơn một nghìn năm, là nơi hội tụ của truyền thống và hiện đại. Với hơn 1.600 ngôi chùa Phật giáo, 400 đền thờ Shinto, cung điện, vườn truyền thống và kiến trúc đẹp mắt, Kyoto mang đến cho du khách trải nghiệm độc đáo về văn hóa Nhật Bản.</p>

          <h2>Khu rừng tre Arashiyama - Vẻ đẹp thanh bình</h2>
          <p>Khu rừng tre Arashiyama là một trong những địa điểm nổi tiếng nhất ở Kyoto. Đi dạo qua những con đường mòn được bao quanh bởi những cây tre cao vút, bạn sẽ cảm nhận được sự yên bình và tĩnh lặng hiếm có. Ánh sáng xuyên qua những thân tre tạo nên một khung cảnh ma mị, đặc biệt vào buổi sáng sớm hoặc hoàng hôn.</p>

          <h2>Chùa Vàng Kinkaku-ji - Biểu tượng của Kyoto</h2>
          <p>Kinkaku-ji, hay còn gọi là Chùa Vàng, là một trong những biểu tượng nổi tiếng nhất của Kyoto. Tòa nhà ba tầng được phủ vàng lá hoàn toàn, phản chiếu hình ảnh lấp lánh xuống mặt hồ xung quanh, tạo nên một khung cảnh tuyệt đẹp. Mỗi tầng của chùa được xây dựng theo một phong cách kiến trúc khác nhau, đại diện cho sự hòa hợp giữa các nền văn hóa khác nhau trong lịch sử Nhật Bản.</p>

          <h2>Trải nghiệm văn hóa trà đạo</h2>
          <p>Kyoto là nơi lý tưởng để trải nghiệm nghệ thuật trà đạo Nhật Bản. Tham gia một buổi lễ trà truyền thống, bạn sẽ được học cách pha và thưởng thức trà theo nghi thức cổ xưa, đồng thời hiểu thêm về triết lý sâu sắc đằng sau mỗi động tác trong buổi lễ. Đây là cách tuyệt vời để hiểu sâu hơn về văn hóa và tinh thần Nhật Bản.</p>
        HTML
      }
    ]

    all_posts = []
    15.times do |i|
      base_posts.each_with_index do |post, index|
        new_post = post.dup
        new_post[:id] = i * base_posts.length + index + 1
        new_post[:title] += " (Phần #{i + 1})"
        new_post[:image] = "https://picsum.photos/800/400?random=#{new_post[:id]}"
        all_posts << new_post
      end
    end

    all_posts
  end
end
