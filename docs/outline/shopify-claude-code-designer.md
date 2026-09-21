---
nguồn: https://www.youtube.com/watch?v=aVDAhJ3PtLg
raw: docs/raw/How I use Claude Code as a Designer at Shopify.txt
chuyên mục: ai-design
trạng thái: đã duyệt
---

# Cách Product Designer tại Shopify Làm việc với Claude Code

**Người đọc lấy được gì:** Hiểu trọn vẹn quy trình thiết kế AI-native tại Shopify: từ văn hóa "vibe coding" của ban lãnh đạo, tư duy loại bỏ chi phí duy trì bản vẽ Figma tĩnh, quy trình thử nghiệm 3 tầng (FigJam → Vanilla HTML Sandbox → Shopify Playground), cơ chế cộng tác bằng nhánh Git đến cách xây dựng "bộ não mở rộng" ngay trong terminal.

**Thuật ngữ cần chú thích:** Single Source of Truth · Playground Environment · Polaris Design System · Plan Mode · Multi-surface Flow · Git Branching Handoff · Augmented Brain (Bộ não tăng cường)

## 1. Văn hóa "Vibe Coding" từ Ban Lãnh đạo: Code là Kỳ vọng Cốt lõi của Designer
**Ý chính:** Tại Shopify, việc tiếp cận AI và code không phải là sở thích cá nhân mà là một kỳ vọng văn hóa được dẫn dắt trực tiếp từ cấp cao nhất: CEO Tobi Lütke là một trong những người commit nhiều nhất trên GitHub, và Chief Design Officer (CDO) trực tiếp "vibe code" sản phẩm. Sự hậu thuẫn từ lãnh đạo tạo nên một môi trường nơi mọi designer được khuyến khích thử nghiệm, tự tạo bot nội bộ và biến code thành ngôn ngữ giao tiếp chung.
**Mốc trong raw:** [47:31], [49:04], [50:38], [52:09]
**Khối chữ:** hint (văn hóa lãnh đạo làm gương và kỳ vọng AI tại Shopify)
**Hình:** không cần hình

## 2. Cái chết của "Bản vẽ Tĩnh": Chi phí Duy trì Artifact Giảm về 0
**Ý chính:** Trong quy trình truyền thống, designer phải mất hàng tháng để vẽ và bảo trì hàng trăm artboard tĩnh trên Figma cho mọi breakpoint, state (empty, loading, error) và biến thể giao diện, dẫn đến tình trạng tài liệu bị lỗi thời (stale) và sai lệch với code thực tế. Với Claude Code, chi phí duy trì bản vẽ trung gian giảm về 0: designer sửa trực tiếp trong code, dự án rút ngắn từ hàng tháng xuống còn vài ngày hoặc tuần, và code chính thức trở thành nguồn chân lý duy nhất.
**Mốc trong raw:** [1:03], [44:30], [45:00], [45:30], [46:01]
**Khối chữ:** columns (so sánh chi phí và tốc độ: Duy trì hàng trăm màn hình Figma vs Trực tiếp thao tác trên Code)
**Hình:** compare — "Mô hình Truyền thống (Bảo trì hàng trăm màn hình tĩnh, độ trễ handoff cao) vs Mô hình AI-native (Chi phí duy trì artifact về 0, code là nguồn chân lý duy nhất)"

## 3. Quy trình 3 Tầng: Từ Cảm hứng Có Ngữ cảnh đến Sandbox Vanilla HTML
**Ý chính:** Caston tiếp cận dự án mới theo 3 tầng rành mạch: bắt đầu bằng FigJam để gom ảnh cảm hứng từ Mobbin/Are.na (luôn highlight màu vàng chính xác chi tiết cần học để đồng nghiệp và AI hiểu đúng ngữ cảnh); tiếp theo lập folder dự án kèm file Markdown chứa bài toán của merchant và yêu cầu kỹ thuật; sau đó dùng Claude Code dựng ngay bản mẫu thô bằng Vanilla HTML/CSS/JS mà chưa cần vội dùng Design System để giữ độ linh hoạt tối đa.
**Mốc trong raw:** [2:04], [2:35], [3:37], [4:10], [4:40], [5:10], [5:40], [6:11]
**Khối chữ:** stepper (quy trình 3 bước: Curate cảm hứng có highlight → Nạp ngữ cảnh Markdown → Dựng Wireframe Vanilla HTML)
**Hình:** flow — "Dòng chảy 3 tầng: FigJam/Mobbin (Cảm hứng có ngữ cảnh) → Vanilla HTML Sandbox (Tự do phân nhánh) → Shopify Playground (Hội tụ Design System Polaris)"

## 4. "Nấu Nhiều Món Cùng Lúc" với Claude Code: Tách biệt Sandbox & Playground
**Ý chính:** Tại sao không code thẳng vào Design System của Shopify ngay từ đầu? Caston giải thích việc dùng Vanilla HTML giúp anh thoát khỏi các ràng buộc phức tạp của thư viện component để tự do phân nhánh sinh nhiều phương án (Variant A/B). Trong lúc Claude Code chạy ở chế độ Plan Mode và "nấu" các phương án trong terminal, anh tiếp tục tìm kiếm cảm hứng thị giác, trả lời chất vấn của AI và chỉ chuyển sang Shopify Playground (môi trường clone Admin tích hợp Polaris) khi ý tưởng đã hội tụ.
**Mốc trong raw:** [7:43], [8:13], [8:44], [9:44], [10:15], [10:45], [11:15], [12:17], [12:47]
**Khối chữ:** tabs (chia chi tiết 2 môi trường: Vanilla Sandbox để phân kỳ ý tưởng vs Shopify Playground để hội tụ sản phẩm)
**Hình:** compare — "Vanilla Sandbox (Tự do khám phá, chi phí thấp, phân nhánh Variant A/B) vs Shopify Playground (Ràng buộc Design System Polaris, liên kết Quick hosting, sẵn sàng cho review)"

## 5. Hợp tác Kỹ thuật Kiểu Mới: Chia sẻ Git Commit Hash thay vì Link Figma
**Ý chính:** Khi hoàn thiện prototype trong Playground, thay vì xuất file ảnh hoặc gửi link Figma, designer gõ lệnh `dev save` để hệ thống Quick tự động sinh URL chạy thực tế cho toàn bộ nhân sự nội bộ trải nghiệm và comment trực tiếp trên trình duyệt. Khi bàn giao cho kỹ sư, designer chỉ cần gửi mã Git commit hash cuối cùng của branch; kỹ sư fork branch về máy cá nhân và tái sử dụng ngay 85-90% code giao diện đã được trau chuốt, chỉ cần đấu nối API backend thật.
**Mốc trong raw:** [38:03], [41:27], [41:58], [42:29], [42:59], [43:29]
**Khối chữ:** hint (cách vòng lặp handoff biến thành luồng đồng kiến tạo trên Git branch)
**Hình:** loop — "Vòng lặp cộng tác thế hệ mới: Designer commit branch & link Playground → Team review & comment trên live preview → Engineer fork code & gắn backend production"

## 6. Bộ Não Tăng Cường (Augmented Brain) ngay trong Terminal
**Ý chính:** Ngoài việc tạo mẫu giao diện, Caston sử dụng Claude Code như một trợ lý điều hành cá nhân (Executive Assistant): cung cấp kho dữ liệu Markdown ghi chép kiến thức, ngữ cảnh dự án, bảng token thiết kế và transcript từ Slack. Khi designer làm việc, Claude Code tự động đối chiếu các token giao diện với tiêu chuẩn trợ năng (accessibility), nhắc nhở các trạng thái rỗng (empty states) và hỗ trợ quay video Descript tóm tắt tiến độ để chia sẻ bất đồng bộ với team.
**Mốc trong raw:** [53:40], [55:11], [56:41], [57:43], [58:13], [59:50], [1:01:22]
**Khối chữ:** expandable (kiến trúc bộ não số cá nhân trong terminal và quy trình chia sẻ bất đồng bộ bằng video ngắn)
**Hình:** không cần hình

## 7. Ba Nguyên tắc Hành động cho Product Designer Thời đại AI-native
**Ý chính:** Ba đúc kết thực chiến quan trọng nhất rút ra từ trải nghiệm của Caston tại Shopify: 1. Code là phương tiện giao tiếp tối thượng, loại bỏ sự lãng phí của các bản vẽ trung gian; 2. Cung cấp ngữ cảnh sắc nét (highlight cụ thể, tài liệu hóa bài toán bằng Markdown) để dẫn dắt AI chính xác; 3. Xây dựng thói quen nạp dữ liệu và mở rộng năng lực tư duy bằng các trợ lý dòng lệnh.
**Mốc trong raw:** [10:45], [46:01], [1:01:22], [1:02:54]
**Khối chữ:** cards (3 nguyên tắc đúc kết)
**Hình:** takeaway — "3 Nguyên tắc cốt lõi của Product Designer tại Shopify thời đại AI-native"
