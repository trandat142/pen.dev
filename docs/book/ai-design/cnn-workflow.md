# Quy trình Thiết kế Tương tác bằng AI tại CNN

> **Tác giả chia sẻ**: Jennifer — Staff Product Designer tại CNN  
> **Chủ đề**: Ứng dụng Cursor, Git và Design Systems để nâng cấp quy trình làm Prototype tương tác cao (High-Fidelity Prototyping) và kiểm thử giao diện thực tế.

---

## 1. Cuộc cách mạng Prototyping: Từ Figma sang Live Code

Trước khi ứng dụng AI và công cụ code như Cursor, toàn bộ quy trình thiết kế tại CNN bắt đầu và kết thúc bên trong **Figma**. Với các tính năng thông thường, Smart Animate hay Figma Slides đáp ứng tốt. Tuy nhiên, khi đối mặt với các tính năng có **micro-interaction phức tạp** (như kéo-thả nhiều thành phần, giao diện lồng giao diện trong hệ thống CMS tin tức), Figma bộc lộ nhiều rào cản lớn:

- **Prototype dạng "Stop-motion"**: Để mô phỏng một thao tác kéo-thả (drag-and-drop), designer phải nhân bản hàng chục frame tĩnh, xếp absolute position cho từng mảnh nhỏ.
- **Tốn thời gian nhưng thiếu tự nhiên**: Mất hàng giờ căn chỉnh nhưng chuyển động vẫn giật cục, thiếu độ mượt và vật lý tương tác chuột thực tế.
- **Khó khăn khi demo cho stakeholder**: Đối tác kỹ thuật và biên tập viên khó cảm nhận được tính khả thi và độ trễ thao tác khi sản phẩm ra mắt.

Khi chuyển sang **Cursor** kết hợp mô hình AI Agent, designer có thể tạo ra prototype kéo-thả với vật lý chuột hoàn chỉnh chỉ trong **vài phút** thay vì hàng giờ:

![Figma Mock vs. Live Code Prototype](../../assets/design/P9bWlk.png)

---

## 2. Thử nghiệm Đa biến thể & Cơ chế "Variant Switcher"

Tại tòa soạn báo như CNN, **tốc độ đưa tin phá vỡ (breaking news)** là yếu tố sống còn. Từng micro-interaction nhỏ mà biên tập viên thực hiện trên hệ thống CMS đều tác động trực tiếp đến thời gian bài viết được xuất bản (Time-to-Publish).

Thay vì áp đặt một thiết kế duy nhất, Jennifer xây dựng đồng thời **3 biến thể tương tác** để kiểm thử thực tế:

1. **Version A (Ghost Overlay)**: Khi kéo, toàn bộ khối nội dung mờ đi và di chuyển theo con trỏ chuột.
2. **Version B (Empty Slot Placeholder)**: Khi kéo, vị trí đích để lộ khoảng trống dạng viền đứt đoạn để báo hiệu vùng thả.
3. **Version C (Compact Label)**: Thay vì kéo khối lớn, chỉ có nhãn thu gọn hiển thị theo chuột, giúp giảm che khuất các bài viết khác (biến thể được biên tập viên ưu tiên nhất).

### Giải pháp "In-Prototype Switcher" trên 1 URL duy nhất
Thay vì gửi 3-4 đường link khác nhau qua Slack khiến stakeholder nhầm lẫn, designer tích hợp một thanh **chuyển đổi biến thể (Switcher Widget)** ngay góc dưới màn hình. Stakeholder và tester có thể chuyển đổi mượt mà giữa các Version A/B/C ngay trong cùng một phiên thử nghiệm:

![Multi-Variant Architecture & Switcher](../../assets/design/VZ4p8.png)

---

## 3. Hệ thống Git Branching dành cho Product Designer

Một trong những bước tiến quan trọng nhất trong quy trình làm việc mới là biến **Git** thành công cụ thiết kế cốt lõi. Git hoạt động như một **vết bánh mì (breadcrumb trail)**, giúp designer tự tin thử nghiệm các ý tưởng mới mà luôn có thể quay lui an toàn.

### Mô hình phân nhánh theo Framework sản phẩm
Thay vì tạo file Figma lộn xộn, Jennifer ánh xạ các mô hình tư duy sản phẩm trực tiếp thành các nhánh Git:

- **Trục chính (`main`)**: Giữ phiên bản CMS chuẩn sản xuất (baseline).
- **Nhánh theo Framework Crawl → Walk → Run (hoặc Bronze → Silver → Gold)**:
  - `feat/bronze-mvp`: Phiên bản cơ bản, dùng component sẵn có, bám sát trải nghiệm hiện tại.
  - `feat/silver-ghost-drag`: Phiên bản cải tiến phản hồi thị giác và kéo-thả.
  - `feat/gold-dynamic-reorder`: Phiên bản nâng cao với thuật toán tự động dồn bài viết thông minh.
- **Quy tắc đặt tên nhánh thân thiện (Human-readable Naming)**:
  - Đặt theo cấu trúc `v-[letter]-[mô-tả]` (ví dụ: `v-d-rounded-controls`), tránh dùng mã ticket Jira máy móc để đối tác PM và Design dễ nắm bắt.

![Designer Git Branching Matrix](../../assets/design/Eml9g.png)

---

## 4. Kỹ thuật Socratic Prompting & Tự động hóa Lệnh

Khi giao tiếp với AI trong Cursor, Jennifer nhấn mạnh tầm quan trọng của việc **viết prompt** thay vì dùng voice dictation: việc gõ chữ giúp designer suy nghĩ thấu đáo về cấu trúc và ràng buộc trước khi yêu cầu AI thực hiện.

### Chu trình Socratic Prompting (Tách biệt Đọc và Ghi)
Để tránh AI "đi chệch hướng" hoặc tự ý sửa đổi code không mong muốn, quy trình được chia làm 2 pha rõ rệt:

1. **Pha chẩn đoán — Cursor Ask (Read-only)**:
   - Khi phát hiện lỗi giao diện (ví dụ: tooltip bị cắt viền trong thanh chọn), dùng chế độ Ask để hỏi AI: *"Thành phần này đang bị lỗi layout gì? Đề xuất prompt chính xác nhất để xử lý?"*.
   - Chế độ Ask chỉ đọc code nên an toàn tuyệt đối, giúp designer có prompt tối ưu.
2. **Pha thực thi — Cursor Agent (Write)**:
   - Áp dụng prompt tinh chỉnh vào Cursor Agent để sửa file code đích.
3. **Pha lưu mốc — Cursor Commands**:
   - Sử dụng lệnh tắt lưu trong `.cursorrules` (ví dụ: lệnh `commit to branch`) để tự động commit code kèm mô tả rõ ràng, đồng thời chặn AI tự ý tạo nhánh mới hoặc push lên remote.

![Socratic Prompting Loop](../../assets/design/RkpmJ.png)

---

## 5. Tích hợp Design System & Bàn giao Kỹ thuật (Handoff)

Một ưu thế vượt trội của Cursor so với các công cụ tạo giao diện thông thường là khả năng cài đặt trực tiếp các thư viện **npm** và kết nối **MCP Server**.

### Quy trình phân phối khép kín từ Token đến Jira
1. **Design System đồng bộ**: Recreate CMS bằng `shadcn` MCP và cài trực tiếp gói npm `@cnn/design-system`, tận dụng toàn bộ token màu sắc, spacing và bộ icon vector (Lucide).
2. **Multi-Branch Deployment**: Cấu hình triển khai tự động từng nhánh Git thành các URL độc lập trên GitHub Pages hoặc Netlify branch subdomains.
3. **Usability Testing qua Slack**: Gửi trực tiếp link prototype cho biên tập viên và đo lường thời gian thao tác thực tế (Time-on-task).
4. **Bàn giao kỹ thuật (Handoff)**: Trong Figma vẫn duy trì trang `Handoff`, nhưng bên cạnh redline tĩnh là **đường link prototype tương tác sống** được đính kèm thẳng vào Jira Ticket để lập trình viên tự do trải nghiệm chuyển động trước khi code.

![Enterprise Design Pipeline](../../assets/design/pg7Jd.png)

---

## 6. Đúc kết thực tiễn cho Product Designer

- **Prototype là code, không chỉ là hình ảnh**: Tương tác thực tế giúp loại bỏ giả định sai lệch và mang lại dữ liệu kiểm thử chất lượng cao.
- **Học Git là lợi thế chiến lược**: Git giúp designer tư duy mạch lạc, quản lý phiên bản chuyên nghiệp và nói cùng ngôn ngữ với engineering.
- **Kiểm soát AI bằng phương pháp Socratic**: Luôn hỏi để hiểu nguyên nhân trước khi ra lệnh thực thi để bảo toàn tính toàn vẹn của mã nguồn.
