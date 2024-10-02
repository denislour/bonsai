puts "Cleaning database..."
[ Comment, Post, Author, Tag ].each(&:destroy_all)

puts "Creating authors..."
authors = [
  { name: "Nguyễn Văn A", avatar: "https://picsum.photos/40/40?random=1" },
  { name: "Trần Thị B", avatar: "https://picsum.photos/40/40?random=2" },
  { name: "Lê Hoàng C", avatar: "https://picsum.photos/40/40?random=3" },
  { name: "Phạm Minh D", avatar: "https://picsum.photos/40/40?random=4" },
  { name: "Hoàng Thị E", avatar: "https://picsum.photos/40/40?random=5" },
  { name: "Đặng Văn F", avatar: "https://picsum.photos/40/40?random=6" },
  { name: "Vũ Thị G", avatar: "https://picsum.photos/40/40?random=7" }
].map { |author| Author.create!(author) }

puts "Creating tags..."
tags = %w[Du\ lịch Văn\ hóa Ẩm\ thực Lịch\ sử Thiên\ nhiên Kiến\ trúc Lễ\ hội Nghệ\ thuật Việt\ Nam Nhật\ Bản Hàn\ Quốc Thái\ Lan Singapore Malaysia Indonesia].map { |name| Tag.create!(name: name) }

puts "Creating posts..."
posts_data = [
  {
    title: "Khám phá vẻ đẹp của Việt Nam",
    excerpt: "Việt Nam, một đất nước với lịch sử lâu đời và văn hóa phong phú...",
    content: "<p>Việt Nam, một đất nước với lịch sử lâu đời và văn hóa phong phú, là điểm đến hấp dẫn cho du khách từ khắp nơi trên thế giới. Từ những bãi biển tuyệt đẹp ở miền Trung như Đà Nẵng, Nha Trang đến những ngọn núi hùng vĩ ở Sapa, Việt Nam có một địa hình đa dạng và ngoạn mục.</p>
    <h2>Văn hóa độc đáo</h2>
    <p>Văn hóa Việt Nam là sự kết hợp hài hòa giữa truyền thống và hiện đại. Các lễ hội truyền thống như Tết Nguyên Đán, lễ hội Đền Hùng vẫn được tổ chức hàng năm, trong khi các thành phố lớn như Hà Nội và TP.HCM đang phát triển nhanh chóng với những tòa nhà chọc trời và trung tâm mua sắm hiện đại.</p>
    <h2>Ẩm thực đặc sắc</h2>
    <p>Ẩm thực Việt Nam nổi tiếng thế giới với những món ăn như phở, bánh mì, và gỏi cuốn. Mỗi vùng miền đều có những đặc sản riêng, từ bún chả Hà Nội đến cơm tấm Sài Gòn, tạo nên một bức tranh ẩm thực đa dạng và phong phú.</p>
    <h2>Di sản thế giới</h2>
    <p>Việt Nam tự hào với 8 di sản thế giới được UNESCO công nhận, bao gồm Vịnh Hạ Long, phố cổ Hội An, và Quần thể di tích Cố đô Huế. Những địa điểm này không chỉ có giá trị lịch sử và văn hóa to lớn mà còn là những điểm du lịch hấp dẫn.</p>",
    author: authors[0],
    date: Date.new(2023, 8, 15),
    tag_names: [ "Du lịch", "Văn hóa", "Ẩm thực", "Lịch sử", "Việt Nam" ]
  },
  {
    title: "Khám phá Kyoto - Linh hồn của Nhật Bản",
    excerpt: "Kyoto, cố đô của Nhật Bản, là nơi hội tụ của truyền thống và hiện đại...",
    content: "<p>Kyoto, cố đô của Nhật Bản trong hơn một nghìn năm, là nơi hội tụ của truyền thống và hiện đại. Thành phố này nổi tiếng với hơn 1.600 ngôi chùa Phật giáo, 400 đền thờ Shinto, cung điện, vườn và kiến trúc truyền thống.</p>
    <h2>Đền chùa và vườn truyền thống</h2>
    <p>Một trong những điểm nổi bật của Kyoto là Kinkaku-ji (Chùa Vàng), một ngôi chùa được phủ vàng lá nằm bên hồ nước yên bình. Ryoan-ji nổi tiếng với khu vườn đá Zen, trong khi Kiyomizu-dera cung cấp tầm nhìn tuyệt đẹp ra toàn thành phố.</p>
    <h2>Văn hóa Geisha</h2>
    <p>Khu phố Gion của Kyoto là nơi bạn có thể bắt gặp các geisha và maiko (geisha tập sự) trong trang phục truyền thống. Đây là nơi duy trì nghệ thuật và truyền thống geisha lâu đời của Nhật Bản.</p>
    <h2>Ẩm thực Kyoto</h2>
    <p>Kyoto nổi tiếng với kaiseki - một bữa ăn nhiều món tinh tế, và các món ăn chay của Phật giáo. Đừng quên thưởng thức matcha và các loại bánh ngọt truyền thống tại các tiệm trà cổ kính.</p>
    <h2>Lễ hội truyền thống</h2>
    <p>Kyoto tổ chức nhiều lễ hội quanh năm, trong đó nổi bật nhất là Gion Matsuri vào tháng 7 và lễ hội Jidai Matsuri vào tháng 10, tái hiện lịch sử hơn 1000 năm của thành phố.</p>",
    author: authors[1],
    date: Date.new(2023, 8, 20),
    tag_names: [ "Du lịch", "Văn hóa", "Lịch sử", "Nhật Bản", "Kiến trúc" ]
  },
  {
    title: "Hàn Quốc: Xứ sở kim chi và công nghệ",
    excerpt: "Hàn Quốc, nơi hòa quyện giữa truyền thống và hiện đại...",
    content: "<p>Hàn Quốc, một quốc gia Đông Á, nổi tiếng với sự kết hợp độc đáo giữa văn hóa truyền thống và công nghệ tiên tiến. Từ những cung điện cổ kính đến những tòa nhà chọc trời hiện đại, Hàn Quốc mang đến trải nghiệm du lịch đa dạng và thú vị.</p>
    <h2>Seoul - Thủ đô năng động</h2>
    <p>Seoul, thủ đô của Hàn Quốc, là một thành phố năng động với sự pha trộn giữa cũ và mới. Bạn có thể thăm cung điện Gyeongbokgung cổ kính vào buổi sáng và khám phá khu Gangnam hiện đại vào buổi chiều.</p>
    <h2>Ẩm thực Hàn Quốc</h2>
    <p>Ẩm thực Hàn Quốc nổi tiếng với kimchi, bibimbap, và bulgogi. Đừng quên thưởng thức một bữa ăn BBQ Hàn Quốc truyền thống và thử soju - rượu truyền thống của Hàn Quốc.</p>
    <h2>Hallyu - Làn sóng Hàn Quốc</h2>
    <p>Hàn Quốc là trung tâm của làn sóng văn hóa đại chúng Hallyu, với K-pop và phim truyền hình Hàn Quốc được yêu thích trên toàn thế giới. Bạn có thể tham quan các công ty giải trí lớn hoặc tham gia vào các buổi biểu diễn K-pop.</p>
    <h2>Công nghệ tiên tiến</h2>
    <p>Hàn Quốc là quê hương của nhiều tập đoàn công nghệ hàng đầu thế giới. Bạn có thể khám phá các cửa hàng điện tử hiện đại hoặc trải nghiệm các công nghệ mới nhất tại các triển lãm công nghệ.</p>",
    author: authors[2],
    date: Date.new(2023, 9, 1),
    tag_names: [ "Du lịch", "Văn hóa", "Ẩm thực", "Hàn Quốc", "Công nghệ" ]
  },
  {
    title: "Thái Lan: Vùng đất của nụ cười",
    excerpt: "Thái Lan, quốc gia Đông Nam Á nổi tiếng với sự hiếu khách...",
    content: "<p>Thái Lan, quốc gia Đông Nam Á nổi tiếng với sự hiếu khách, ẩm thực tuyệt vời và những bãi biển tuyệt đẹp, là điểm đến du lịch hàng đầu trong khu vực. Từ những ngôi đền Phật giáo tráng lệ đến những khu chợ nổi sôi động, Thái Lan mang đến trải nghiệm du lịch đa dạng và phong phú.</p>
    <h2>Bangkok - Thủ đô sôi động</h2>
    <p>Bangkok, thủ đô của Thái Lan, là một thành phố năng động với sự pha trộn giữa truyền thống và hiện đại. Bạn có thể thăm Cung điện Hoàng gia và Wat Phra Kaew, sau đó khám phá các trung tâm mua sắm hiện đại như Siam Paragon.</p>
    <h2>Ẩm thực đường phố</h2>
    <p>Ẩm thực đường phố Thái Lan nổi tiếng thế giới với các món như Pad Thai, Tom Yum Goong, và Som Tam. Đừng quên thưởng thức một ly trà sữa Thái truyền thống.</p>
    <h2>Bãi biển và đảo</h2>
    <p>Thái Lan nổi tiếng với những bãi biển và đảo tuyệt đẹp như Phuket, Koh Samui, và Koh Phi Phi. Đây là những điểm đến lý tưởng cho những ai yêu thích biển và các hoạt động dưới nước.</p>
    <h2>Lễ hội truyền thống</h2>
    <p>Thái Lan có nhiều lễ hội độc đáo như Songkran (Tết cổ truyền Thái Lan) và Loy Krathong (Lễ hội thả đèn). Tham gia vào các lễ hội này sẽ giúp bạn hiểu sâu hơn về văn hóa Thái Lan.</p>",
    author: authors[3],
    date: Date.new(2023, 9, 10),
    tag_names: [ "Du lịch", "Văn hóa", "Ẩm thực", "Thái Lan", "Lễ hội" ]
  },
  {
    title: "Singapore: Đảo quốc sư tử hiện đại",
    excerpt: "Singapore, một đảo quốc nhỏ bé nhưng phát triển vượt bậc...",
    content: "<p>Singapore, một đảo quốc nhỏ bé nhưng phát triển vượt bậc, là sự kết hợp hoàn hảo giữa hiện đại và truyền thống. Với kiến trúc độc đáo, ẩm thực đa dạng và công viên xanh mát, Singapore là điểm đến lý tưởng cho du khách muốn trải nghiệm một châu Á hiện đại.</p>
    <h2>Kiến trúc độc đáo</h2>
    <p>Singapore nổi tiếng với những công trình kiến trúc độc đáo như Marina Bay Sands, Gardens by the Bay, và ArtScience Museum. Những tòa nhà này không chỉ là biểu tượng của Singapore mà còn là những kỳ quan kiến trúc hiện đại.</p>
    <h2>Ẩm thực đa văn hóa</h2>
    <p>Ẩm thực Singapore là sự pha trộn của nhiều nền văn hóa khác nhau. Từ các món ăn đường phố tại các khu hawker centre đến các nhà hàng được gắn sao Michelin, Singapore có thể thỏa mãn mọi khẩu vị.</p>
    <h2>Công viên và thiên nhiên</h2>
    <p>Mặc dù là một thành phố hiện đại, Singapore vẫn duy trì nhiều không gian xanh. Bạn có thể khám phá Singapore Botanic Gardens - di sản thế giới UNESCO, hoặc đi bộ trên con đường trên cao Southern Ridges.</p>
    <h2>Mua sắm và giải trí</h2>
    <p>Orchard Road là thiên đường mua sắm của Singapore với hàng loạt trung tâm thương mại. Vào ban đêm, bạn có thể thưởng thức cuộc sống về đêm sôi động tại Clarke Quay hoặc xem show nhạc nước tại Marina Bay.</p>",
    author: authors[4],
    date: Date.new(2023, 9, 20),
    tag_names: [ "Du lịch", "Kiến trúc", "Ẩm thực", "Singapore", "Công nghệ" ]
  },
  {
    title: "Malaysia: Đất nước đa sắc tộc",
    excerpt: "Malaysia, quốc gia Đông Nam Á với sự đa dạng văn hóa và thiên nhiên phong phú...",
    content: "<p>Malaysia, quốc gia Đông Nam Á với sự đa dạng văn hóa và thiên nhiên phong phú, là điểm đến hấp dẫn cho du khách muốn trải nghiệm sự pha trộn độc đáo giữa truyền thống và hiện đại. Từ những tòa tháp đôi Petronas cao chót vót đến những khu rừng nhiệt đới nguyên sinh, Malaysia mang đến trải nghiệm du lịch đa dạng và thú vị.</p>
    <h2>Kuala Lumpur - Thủ đô năng động</h2>
    <p>Kuala Lumpur, thủ đô của Malaysia, là một thành phố hiện đại với những tòa nhà chọc trời ấn tượng. Tháp đôi Petronas, biểu tượng của thành phố, là điểm đến không thể bỏ qua. Bạn cũng có thể khám phá khu phố cổ với những ngôi đền và nhà thờ Hồi giáo tuyệt đẹp.</p>
    <h2>Ẩm thực đa dạng</h2>
    <p>Ẩm thực Malaysia là sự kết hợp của nhiều nền văn hóa khác nhau. Từ Nasi Lemak, Laksa đến Roti Canai, mỗi món ăn đều mang đậm bản sắc riêng. Đừng quên thưởng thức các món ăn đường phố tại các khu hawker centre nổi tiếng.</p>
    <h2>Thiên nhiên tuyệt đẹp</h2>
    <p>Malaysia sở hữu những khu rừng nhiệt đới nguyên sinh và những bãi biển tuyệt đẹp. Bạn có thể khám phá Vườn quốc gia Taman Negara, một trong những khu rừng nhiệt đới lâu đời nhất thế giới, hoặc thư giãn trên những bãi biển cát trắng ở đảo Langkawi.</p>
    <h2>Di sản văn hóa</h2>
    <p>Malaysia có nhiều di sản văn hóa độc đáo. Thành phố Malacca và George Town, cả hai đều được UNESCO công nhận là Di sản Thế giới, là những điểm đến lý tưởng để tìm hiểu về lịch sử và văn hóa đa dạng của Malaysia.</p>",
    author: authors[5],
    date: Date.new(2023, 10, 1),
    tag_names: [ "Du lịch", "Văn hóa", "Ẩm thực", "Malaysia", "Thiên nhiên" ]
  },
  {
    title: "Indonesia: Thiên đường của 17.000 hòn đảo",
    excerpt: "Indonesia, quốc gia quần đảo lớn nhất thế giới, là một kho báu của thiên nhiên và văn hóa...",
    content: "<p>Indonesia, quốc gia quần đảo lớn nhất thế giới với hơn 17.000 hòn đảo, là một kho báu của thiên nhiên và văn hóa. Từ những ngôi đền cổ kính đến những bãi biển tuyệt đẹp, từ những núi lửa hùng vĩ đến những khu rừng nhiệt đới đa dạng sinh học, Indonesia mang đến cho du khách những trải nghiệm du lịch độc đáo và khó quên.</p>
    <h2>Bali - Hòn đảo của các vị thần</h2>
    <p>Bali, hòn đảo nổi tiếng nhất của Indonesia, được biết đến với những bãi biển tuyệt đẹp, ruộng bậc thang xanh mướt và văn hóa Hindu độc đáo. Đền Uluwatu, ruộng bậc thang Tegalalang và làng nghệ thuật Ubud là những điểm đến không thể bỏ qua.</p>
    <h2>Jakarta - Thủ đô sôi động</h2>
    <p>Jakarta, thủ đô của Indonesia, là một thành phố năng động với sự pha trộn giữa hiện đại và truyền thống. Bạn có thể khám phá khu phố cổ Kota Tua, tham quan bảo tàng quốc gia, hoặc thưởng thức ẩm thực đường phố đa dạng.</p>
    <h2>Borobudur - Kỳ quan Phật giáo</h2>
    <p>Borobudur, ngôi đền Phật giáo lớn nhất thế giới, là một trong những di sản văn hóa quan trọng nhất của Indonesia. Nằm ở trung tâm đảo Java, Borobudur là một kiệt tác kiến trúc và điêu khắc đáng kinh ngạc.</p>
    <h2>Đa dạng sinh học</h2>
    <p>Indonesia nổi tiếng với sự đa dạng sinh học phong phú. Bạn có thể gặp gỡ orangutan tại Sumatra, khám phá rồng Komodo trên đảo Komodo, hoặc lặn với cá mập voi tại Vườn quốc gia Teluk Cenderawasih.</p>
    <h2>Ẩm thực đặc sắc</h2>
    <p>Ẩm thực Indonesia đa dạng và phong phú với những món ăn như Nasi Goreng, Rendang, và Satay. Mỗi vùng miền đều có những đặc sản riêng, phản ánh sự đa dạng văn hóa của đất nước này.</p>",
    author: authors[6],
    date: Date.new(2023, 10, 10),
    tag_names: [ "Du lịch", "Văn hóa", "Thiên nhiên", "Indonesia", "Ẩm thực" ]
  },
  {
    title: "Khám phá ẩm thực đường phố Việt Nam",
    excerpt: "Ẩm thực đường phố Việt Nam - một trải nghiệm không thể bỏ qua...",
    content: "<p>Ẩm thực đường phố Việt Nam không chỉ là một phần quan trọng của văn hóa ẩm thực mà còn là một trải nghiệm du lịch không thể bỏ qua. Từ những quán phở steaming nóng hổi đến những xe bánh mì di động, ẩm thực đường phố Việt Nam mang đến hương vị đặc trưng của đất nước hình chữ S.</p>
    <h2>Phở - Linh hồn ẩm thực Việt</h2>
    <p>Phở, món ăn nổi tiếng nhất của Việt Nam, có mặt ở khắp mọi nơi từ Bắc vào Nam. Một tô phở nóng hổi với nước dùng thơm ngon, bánh phở mềm mại, thịt bò hoặc gà mềm, và các loại rau thơm tươi mát là bữa sáng lý tưởng của nhiều người Việt.</p>
    <h2>Bánh mì - Fusion của Đông và Tây</h2>
    <p>Bánh mì Việt Nam, sự kết hợp hoàn hảo giữa ẩm thực Pháp và Việt, đã trở thành một hiện tượng toàn cầu. Với vỏ bánh giòn, nhân đầy ắp pate, thịt, rau và gia vị, bánh mì là bữa ăn nhanh lý tưởng cho mọi thời điểm trong ngày.</p>
    <h2>Bún chả - Đặc sản Hà Nội</h2>
    <p>Bún chả, món ăn đặc trưng của Hà Nội, gồm bún, chả thịt nướng và nước chấm chua ngọt. Món ăn này đã trở nên nổi tiếng toàn cầu sau khi cựu Tổng thống Mỹ Obama thưởng thức trong chuyến thăm Việt Nam.</p>
    <h2>Cơm tấm - Hương vị Sài Gòn</h2>
    <p>Cơm tấm, một món ăn phổ biến ở Sài Gòn, gồm cơm với sườn nướng, trứng ốp la, bì và các loại rau. Đây là một bữa ăn đầy đủ dinh dưỡng và ngon miệng, được yêu thích bởi cả người dân địa phương và du khách.</p>
    <h2>Chè - Món tráng miệng đa dạng</h2>
    <p>Chè, một loại món tráng miệng đa dạng của Việt Nam, có hàng chục loại khác nhau. Từ chè đậu xanh mát lạnh đến chè ba màu nhiều lớp, mỗi loại chè đều mang đến một trải nghiệm vị giác độc đáo.</p>",
    author: authors[0],
    date: Date.new(2023, 10, 20),
    tag_names: [ "Ẩm thực", "Văn hóa", "Việt Nam", "Du lịch" ]
  },
  {
    title: "Lễ hội truyền thống Nhật Bản",
    excerpt: "Khám phá những lễ hội độc đáo và đầy màu sắc của xứ sở hoa anh đào...",
    content: "<p>Nhật Bản nổi tiếng với những lễ hội truyền thống độc đáo và đầy màu sắc, phản ánh văn hóa phong phú và lịch sử lâu đời của đất nước này. Từ lễ hội hoa anh đào rực rỡ đến lễ hội tuyết trang nghiêm, mỗi lễ hội đều mang đến một trải nghiệm văn hóa đặc biệt cho du khách.</p>
    <h2>Hanami - Lễ hội hoa anh đào</h2>
    <p>Hanami, hay lễ hội ngắm hoa anh đào, là một trong những lễ hội nổi tiếng nhất của Nhật Bản. Vào mùa xuân, người dân và du khách tụ tập dưới những cây anh đào đang nở rộ để picnic và thưởng thức vẻ đẹp của hoa.</p>
    <h2>Gion Matsuri - Lễ hội lớn nhất Kyoto</h2>
    <p>Gion Matsuri, diễn ra vào tháng 7 hàng năm tại Kyoto, là một trong ba lễ hội lớn nhất Nhật Bản. Lễ hội kéo dài cả tháng với điểm nhấn là cuộc diễu hành Yamaboko hoành tráng với những chiếc xe kéo được trang trí lộng lẫy.</p>
    <h2>Obon - Lễ hội tưởng nhớ tổ tiên</h2>
    <p>Obon là lễ hội Phật giáo quan trọng của Nhật Bản, thường diễn ra vào tháng 8. Trong dịp này, người Nhật tin rằng linh hồn tổ tiên sẽ trở về thăm gia đình. Lễ hội bao gồm các điệu múa truyền thống và thả đèn lồng trên sông.</p>
    <h2>Sapporo Yuki Matsuri - Lễ hội tuyết Sapporo</h2>
    <p>Lễ hội tuyết Sapporo, diễn ra vào tháng 2 hàng năm tại Hokkaido, thu hút hàng triệu du khách với những tác phẩm",
    author: authors[1],
    date: Date.new(2023, 11, 1),
    tag_names: [ "Lễ hội", "Văn hóa", "Nhật Bản", "Du lịch" ]
  },
  {
    title: "Khám phá văn hóa trà đạo Nhật Bản",
    excerpt: "Hành trình tìm hiểu nghệ thuật uống trà tinh tế của xứ Phù Tang...",
    content: "<p>Văn hóa trà đạo Nhật Bản, hay còn gọi là Chanoyu, không chỉ đơn thuần là việc uống trà mà còn là một nghi thức nghệ thuật tinh tế, phản ánh triết lý sống và thẩm mỹ của người Nhật. Trà đạo là sự kết hợp hài hòa giữa nhiều yếu tố như không gian, đạo cụ, cách pha trà và cách thưởng thức.</p>
    <h2>Lịch sử trà đạo</h2>
    <p>Trà đạo Nhật Bản có nguồn gốc từ Trung Quốc, nhưng đã được phát triển thành một nghệ thuật độc đáo dưới ảnh hưởng của Phật giáo Zen. Thiền sư Eisai được coi là người đầu tiên mang hạt giống trà từ Trung Quốc về Nhật Bản vào thế kỷ 12.</p>
    <h2>Không gian trà đạo</h2>
    <p>Buổi trà đạo thường diễn ra trong một căn phòng trà (chashitsu) được thiết kế đơn giản và thanh tịnh. Lối vào phòng trà thường là một cửa nhỏ, buộc khách phải cúi mình khi bước vào, tượng trưng cho sự khiêm nhường và bình đẳng.</p>
    <h2>Đạo cụ trà đạo</h2>
    <p>Mỗi dụng cụ trong buổi trà đạo đều có ý nghĩa riêng và được chọn lựa cẩn thận. Từ bình trà (chawan), đến muôi múc nước (hishaku), mỗi món đồ đều là tác phẩm nghệ thuật, thể hiện sự tinh tế trong thẩm mỹ của người Nhật.</p>
    <h2>Quy trình pha trà</h2>
    <p>Việc pha trà trong trà đạo là một quá trình phức tạp và tỉ mỉ. Người pha trà phải tuân theo một chuỗi động tác chuẩn mực, từ cách cầm bình trà đến cách đánh bọt trà matcha. Mỗi động tác đều mang ý nghĩa sâu sắc và được thực hiện với sự tập trung cao độ.</p>
    <h2>Ý nghĩa của trà đạo</h2>
    <p>Trà đạo không chỉ là việc uống trà mà còn là một cách để tìm kiếm sự bình an nội tâm và hòa hợp với thiên nhiên. Nó dạy cho người tham gia về sự tôn trọng, thanh tịnh, hài hòa và tĩnh lặng - những giá trị cốt lõi trong văn hóa Nhật Bản.</p>",
    author: authors[3],
    date: Date.new(2023, 11, 20),
    tag_names: [ "Văn hóa", "Nhật Bản", "Trà đạo", "Du lịch" ]
  },
  {
    title: "Khám phá văn hóa cà phê Việt Nam",
    excerpt: "Hành trình tìm hiểu nét độc đáo trong văn hóa thưởng thức cà phê của người Việt...",
    content: "<p>Văn hóa cà phê Việt Nam không chỉ là một thói quen uống cà phê đơn thuần mà còn là một phần không thể thiếu trong đời sống hàng ngày của người Việt. Từ những quán cà phê vỉa hè đơn sơ đến những quán cà phê hiện đại, văn hóa cà phê Việt Nam phản ánh lối sống và tính cách của người dân nơi đây.</p>
    <h2>Lịch sử cà phê Việt Nam</h2>
    <p>Cà phê được du nhập vào Việt Nam bởi người Pháp vào thế kỷ 19. Từ đó, cây cà phê đã trở thành một trong những cây trồng chủ lực của Việt Nam, đặc biệt là ở vùng Tây Nguyên.</p>
    <h2>Cà phê phin - Nét đặc trưng của Việt Nam</h2>
    <p>Cà phê phin là phương pháp pha cà phê truyền thống của Việt Nam. Hạt cà phê được xay mịn, cho vào phin và rót nước sôi từ từ. Quá trình này tạo ra một ly cà phê đậm đà, thơm nồng đặc trưng.</p>
    <h2>Cà phê sữa đá - Hương vị độc đáo</h2>
    <p>Cà phê sữa đá là một trong những cách thưởng thức cà phê phổ biến nhất ở Việt Nam. Sự kết hợp giữa cà phê đậm đà và sữa đặc ngọt ngào, cùng với đá lạnh tạo nên một hương vị độc đáo, thích hợp với khí hậu nhiệt đới của Việt Nam.</p>
    <h2>Văn hóa cà phê vỉa hè</h2>
    <p>Cà phê vỉa hè là một nét văn hóa đặc trưng của Việt Nam, đặc biệt là ở các thành phố lớn. Người dân thường tụ tập tại các quán cà phê nhỏ trên vỉa hè để trò chuyện, thư giãn và tận hưởng không khí nhộn nhịp của cuộc sống đô thị.</p>
    <h2>Cà phê hiện đại</h2>
    <p>Trong những năm gần đây, văn hóa cà phê Việt Nam đã có sự phát triển mạnh mẽ với sự xuất hiện của nhiều chuỗi cà phê hiện đại. Những quán cà phê này không chỉ cung cấp đồ uống chất lượng mà còn tạo ra không gian làm việc và giao lưu cho giới trẻ.</p>
    <h2>Ý nghĩa xã hội của cà phê</h2>
    <p>Đối với người Việt, cà phê không chỉ là một loại đồ uống mà còn là một phương tiện để kết nối xã hội. Việc rủ nhau đi uống cà phê là cách phổ biến để gặp gỡ bạn bè, đối tác kinh doanh hoặc thậm chí là hẹn hò.</p>",
    author: authors[4],
    date: Date.new(2023, 12, 1),
    tag_names: [ "Văn hóa", "Việt Nam", "Cà phê", "Du lịch" ]
  },
  {
    title: "Khám phá nghệ thuật Origami Nhật Bản",
    excerpt: "Hành trình tìm hiểu nghệ thuật gấp giấy tinh tế của xứ Phù Tang...",
    content: "<p>Origami, nghệ thuật gấp giấy truyền thống của Nhật Bản, là một hình thức nghệ thuật độc đáo kết hợp giữa sự sáng tạo và kỹ thuật. Từ những hình dáng đơn giản đến những tác phẩm phức tạp, Origami không chỉ là một hoạt động giải trí mà còn mang nhiều ý nghĩa văn hóa và giáo dục sâu sắc.</p>
    <h2>Lịch sử Origami</h2>
    <p>Origami có nguồn gốc từ Trung Quốc vào thế kỷ thứ 6, nhưng đã phát triển thành một nghệ thuật độc đáo ở Nhật Bản. Ban đầu, do giấy là một vật liệu quý hiếm, Origami chỉ được sử dụng trong các nghi lễ tôn giáo và quý tộc. Về sau, khi giấy trở nên phổ biến hơn, Origami dần trở thành một hình thức nghệ thuật dân gian.</p>
    <h2>Kỹ thuật cơ bản</h2>
    <p>Origami truyền thống sử dụng một tờ giấy hình vuông và không cắt hoặc dán. Các kỹ thuật cơ bản bao gồm gấp đôi, gấp góc, gấp thung lũng và gấp núi. Từ những kỹ thuật đơn giản này, người ta có thể tạo ra vô số hình dáng khác nhau.</p>
    <h2>Các tác phẩm nổi tiếng</h2>
    <p>Một số tác phẩm Origami nổi tiếng bao gồm con hạc giấy, hộp giấy, hoa sen và các loại động vật. Con hạc giấy đặc biệt có ý nghĩa trong văn hóa Nhật Bản, được coi là biểu tượng của hòa bình và hy vọng.</p>
    <h2>Ứng dụng hiện đại</h2>
    <p>Ngày nay, Origami không chỉ là một hình thức nghệ thuật mà còn được ứng dụng trong nhiều lĩnh vực khác như toán học, kỹ thuật và thiết kế. Các nguyên tắc gấp của Origami đã được sử dụng trong việc thiết kế các cấu trúc có thể gập lại như ô vệ tinh và túi khí ô tô.</p>
    <h2>Ý nghĩa văn hóa và giáo dục</h2>
    <p>Trong văn hóa Nhật Bản, Origami không chỉ là một hoạt động giải trí mà còn mang ý nghĩa tâm linh và giáo dục. Việc thực hành Origami giúp phát triển sự kiên nhẫn, tập trung và kỹ năng vận động tinh. Nó cũng dạy về sự tôn trọng đối với vật liệu và quá trình sáng tạo.</p>
    <h2>Origami trong cuộc sống hiện đại</h2>
    <p>Ngày nay, Origami vẫn là một phần quan trọng trong văn hóa Nhật Bản và đã lan rộng ra toàn thế giới. Nó được sử dụng trong giáo dục, trị liệu nghệ thuật và thậm chí cả trong các buổi xây dựng tinh thần đồng đội trong doanh nghiệp. Origami đã trở thành một phương tiện để kết nối con người với nhau và với truyền thống văn hóa lâu đời.</p>",
    author: authors[5],
    date: Date.new(2023, 12, 10),
    tag_names: [ "Nghệ thuật", "Nhật Bản", "Văn hóa", "Du lịch" ]
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
