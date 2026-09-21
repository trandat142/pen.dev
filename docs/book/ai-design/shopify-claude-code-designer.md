---
description: Khám phá cách product designer tại Shopify ứng dụng Claude Code, xóa bỏ chi phí bảo trì bản vẽ tĩnh, phân tách Sandbox và Playground, cùng quy trình cộng tác qua Git branch.
---

# Cách Product Designer tại Shopify Làm việc với Claude Code

Tại Shopify, sự phát triển của các công cụ AI và code agent như Claude Code đang tái định hình căn bản vai trò của người làm thiết kế sản phẩm. Không còn dừng lại ở việc vẽ các màn hình tĩnh trên Figma rồi bàn giao cho kỹ sư, một bộ phận lớn designer tại đây đang trực tiếp viết code, chạy thử nghiệm trên trình duyệt và biến mã nguồn thành phương tiện giao tiếp chính.

---

## 1. Văn hóa "Vibe Coding" từ Ban Lãnh đạo: Code là Kỳ vọng Cốt lõi của Designer

Khác với nhiều doanh nghiệp nơi việc designer học code hay dùng công cụ dòng lệnh thường bị coi là "lấn sân" hoặc cần sự phê duyệt phức tạp từ khối kỹ thuật, văn hóa tại Shopify bắt nguồn trực tiếp từ tinh thần làm gương của đội ngũ lãnh đạo cao nhất.

{% hint style="info" %}
**Kỳ vọng Văn hóa (Cultural Expectation) chứ Không phải Tùy chọn**  
- **CEO Tobi Lütke** là một trong những người có số lượng commit mã nguồn nhiều nhất trên GitHub của công ty, liên tục thử nghiệm các công cụ AI mới nhất.  
- **Chief Design Officer (CDO) Carl** thường xuyên chia sẻ các buổi "vibe coding" — tự tay dùng AI viết prototype giao diện để truyền cảm hứng cho toàn bộ bộ phận thiết kế.  
- Lãnh đạo đặt ra định hướng rõ ràng: việc thử nghiệm AI, tự tạo bot hỗ trợ công việc và hiểu về code không còn là kỹ năng cộng thêm, mà là một **kỳ vọng chuẩn mực** đối với mọi nhân sự.
{% endhint %}

Nhờ sự hậu thuẫn này, các rào cản hành chính biến mất. Nhân sự ở mọi bộ phận — từ thiết kế, hỗ trợ khách hàng đến quản trị rủi ro — đều tự do xây dựng hàng trăm bot nội bộ, kết nối với các server MCP (Model Context Protocol) và biến các công cụ dòng lệnh như Claude Code thành một phần tự nhiên trong công việc hàng ngày.

---

## 2. Cái chết của "Bản vẽ Tĩnh": Chi phí Duy trì Artifact Giảm về 0

Một trong những chuyển dịch mang tính giải phóng lớn nhất đối với designer khi làm việc với Claude Code là sự biến mất của gánh nặng **duy trì các bản thiết kế tĩnh (single artifact maintenance)**.

<!-- HÌNH: compare — "Mô hình Truyền thống (Bảo trì hàng trăm màn hình tĩnh) vs Mô hình AI-native (Chi phí duy trì artifact về 0, code là nguồn chân lý duy nhất)" -->
![Mô hình Truyền thống (Bảo trì hàng trăm màn hình tĩnh) vs Mô hình AI-native (Chi phí duy trì artifact về 0, code là nguồn chân lý duy nhất)](../../assets/design/A4ljZk.png)

{% columns %}
{% column width="50%" %}
### Mô hình Truyền thống (Figma-heavy)
- Designer phải mất hàng tuần, thậm chí hàng tháng để vẽ và bảo trì hàng trăm artboard cho từng breakpoint màn hình, từng trạng thái chi tiết (empty state, loading state, error state).
- Tài liệu thiết kế nhanh chóng bị **lỗi thời (stale)** khi logic sản phẩm thay đổi. Kỹ sư thường xuyên tham chiếu nhầm phiên bản cũ, dẫn đến tranh cãi và mất thời gian căn chỉnh thủ công.
- Vòng lặp bàn giao (handoff) kéo dài nhiều tuần chỉ để giải thích ý định thiết kế cho đội ngũ lập trình.
{% endcolumn %}

{% column width="50%" %}
### Mô hình AI-native (Code-first)
- Chi phí thời gian dành cho việc duy trì một bản vẽ trung gian giảm thẳng về **con số 0**.
- **Mã nguồn là Nguồn chân lý Duy nhất (Single Source of Truth)**: Designer sửa đổi trực tiếp trong code; khi giao diện thay đổi, sản phẩm thực tế cũng lập tức cập nhật mà không cần qua khâu đồng bộ hai chiều.
- Thời gian triển khai dự án rút ngắn thần tốc từ vài tháng xuống chỉ còn **vài ngày hoặc vài tuần**, bởi mọi người đều giao tiếp trực tiếp trên sản phẩm thật có thể tương tác.
{% endcolumn %}
{% endcolumns %}

---

## 3. Quy trình 3 Tầng: Từ Cảm hứng Có Ngữ cảnh đến Sandbox Vanilla HTML

Để đưa một ý tưởng từ trực giác mơ hồ thành tính năng chạy thực tế, Caston xây dựng một quy trình 3 tầng rõ ràng, đảm bảo tốc độ tối đa ở giai đoạn đầu và sự chỉn chu ở giai đoạn cuối.

<!-- HÌNH: flow — "Dòng chảy 3 tầng: Cảm hứng có ngữ cảnh (FigJam/Mobbin) → Bàn nháp tự do (Vanilla HTML Sandbox) → Môi trường thực thi (Shopify Playground)" -->
![Dòng chảy 3 tầng: Cảm hứng có ngữ cảnh → Bàn nháp tự do → Môi trường thực thi](../../assets/design/QPvCx.png)

{% stepper %}
{% step %}
### Tầng 1: Thu thập Cảm hứng có Ngữ cảnh (FigJam & Mobbin)
Thay vì gom hàng loạt ảnh chụp màn hình một cách vô định, Caston tổ chức một moodboard trên FigJam và **dùng nét highlight màu vàng đánh dấu chính xác chi tiết cần học hỏi** (ví dụ: cách sắp xếp thanh điều khiển của Midjourney, cấu trúc phân trang gallery ảnh).  
Việc cắt cúp và highlight cụ thể mang lại hai lợi ích lớn:
- Giúp đồng nghiệp nhìn vào hiểu ngay ý đồ thẩm mỹ mà không bị quá tải thông tin.
- Cung cấp cho Claude Code hình ảnh cắt chính xác khu vực cần mô phỏng, tránh việc AI đọc sai ngữ cảnh từ các thành phần dư thừa.
{% endstep %}

{% step %}
### Tầng 2: Thiết lập Thư mục Dự án & Ngữ cảnh Markdown
Song song với việc tìm cảm hứng, Caston khởi tạo một thư mục cục bộ cho dự án chứa các file Markdown ghi chú tường minh:
- Những nỗi đau thực tế của merchant (người bán hàng trên Shopify) được trích xuất từ nghiên cứu người dùng.
- Các yêu cầu cốt lõi (requirements) và giới hạn của tính năng.  
Các file Markdown này đóng vai trò như **bộ nhớ ngữ cảnh**, giúp Claude Code hiểu sâu bài toán trước khi bắt tay vào sinh mã nguồn.
{% endstep %}

{% step %}
### Tầng 3: Dựng Khung Thô Bằng Vanilla HTML/CSS/JS (Sandbox)
Chưa vội dùng tới hệ thống component phức tạp của công ty, Caston yêu cầu Claude Code dựng ngay một bản wireframe thô bằng HTML và CSS thuần.  
Ở tầng này, mục tiêu duy nhất là kiểm chứng nhanh cảm giác tương tác, bố cục không gian và luồng trải nghiệm cơ bản trên trình duyệt trong thời gian ngắn nhất có thể.
{% endstep %}
{% endstepper %}

---

## 4. "Nấu Nhiều Món Cùng Lúc" với Claude Code: Tách biệt Sandbox & Playground

Một thắc mắc phổ biến là: *Tại sao không đưa thẳng vào hệ thống Design System của Shopify ngay từ đầu để tiết kiệm bước làm lại?*

<!-- HÌNH: compare — "Vanilla Sandbox (Tự do phân nhánh A/B) vs Shopify Playground (Hội tụ Design System Polaris)" -->
![Tách biệt môi trường: Vanilla Sandbox vs Shopify Playground](../../assets/design/IhTcP.png)

{% tabs %}
{% tab title="Vanilla Sandbox — Không gian Phân kỳ Ý tưởng" %}
- **Tự do tuyệt đối**: HTML và CSS thuần không bị ràng buộc bởi các quy chuẩn khắt khe của component library, cho phép designer tự do khám phá các phom dáng giao diện mới lạ.
- **Phân nhánh song song (Variant A/B)**: Trong sandbox thô, việc yêu cầu Claude Code tạo một bộ điều khiển phiên bản (version controller) để so sánh song song phương án A và B diễn ra cực kỳ nhanh chóng.
- **Tư duy như đầu bếp nấu nhiều món**: Trong lúc Claude Code ở cửa sổ terminal thứ nhất đang suy nghĩ và lập kế hoạch ("Plan Mode"), designer chuyển sang cửa sổ khác tiếp tục tìm cảm hứng hoặc điều chỉnh nhánh giao diện phụ mà không phải ngồi chờ thụ động.
{% endtab %}

{% tab title="Shopify Playground — Không gian Hội tụ Sản phẩm" %}
- **Môi trường Clone Admin thật**: Shopify xây dựng một môi trường nội bộ gọi là **Playground** — bản sao hoàn chỉnh của trang quản trị Shopify Admin, tích hợp toàn bộ hệ thống Polaris Design System và nền tảng hosting nội bộ (Quick).
- **Hội tụ tính năng**: Khi các quyết định thiết kế trong Sandbox đã chín muồi, designer mang ý tưởng sang Playground. Tại đây, các nút bấm, thanh panel hay bảng điều khiển được thay thế bằng các component Polaris chuẩn mực của công ty.
- **Trải nghiệm gắn liền thực tế**: Bản prototype trong Playground kết nối với cơ sở dữ liệu giả lập (mock database), mô phỏng đầy đủ luồng tương tác phức tạp như một tính năng sản xuất thực thụ.
{% endtab %}
{% endtabs %}

### Kỹ thuật Prompting Đa Phương Thức với Claude Code
Khi chuyển ý tưởng từ Sandbox sang Playground, Caston sử dụng sức mạnh đa phương thức của Claude Code:
1. **Đọc ngữ cảnh bằng giọng nói (Dictation)**: Mô tả rành mạch bằng ngôn từ tự nhiên vị trí muốn đặt nút bấm mới, hành vi mở thanh panel bên trái và màu nền tương phản.
2. **Kèm ảnh chụp màn hình**: Dán ảnh chụp bản wireframe thô từ Sandbox để AI hình dung chính xác bố cục không gian.
3. **Kéo trực tiếp mã nguồn**: Kéo thư mục chứa code HTML thô vào terminal để Claude Code tham chiếu logic cấu trúc.
4. **Tận dụng Plan Mode**: Để mô hình phân tích bài toán, chủ động đặt lại các câu hỏi chất vấn ngược (như "Variant B có cần đổi cấu trúc lưới không?") và lập kế hoạch thực thi chi tiết trước khi ghi đè mã nguồn.

---

## 5. Hợp tác Kỹ thuật Kiểu Mới: Chia sẻ Git Commit Hash thay vì Link Figma

Quy trình làm việc dựa trên mã nguồn đã thay đổi hoàn toàn phương thức cộng tác giữa Designer, Product Manager và Software Engineer tại Shopify.

<!-- HÌNH: loop — "Vòng lặp cộng tác mới: Designer commit branch → Quick live preview → Engineer fork code hoàn thiện logic" -->
![Vòng lặp hợp tác kỹ thuật mới: Chia sẻ Git commit thay vì link Figma](../../assets/design/oK6ZQ.png)

{% hint style="success" %}
**Handoff Bằng Mã Nguồn — Vòng lặp Đồng Kiến tạo**  
- **Tạo link live bằng một dòng lệnh**: Chỉ cần gõ lệnh `dev save` trong terminal, nền tảng Quick tự động tạo một URL nội bộ có thể truy cập tức thì cho toàn bộ nhân viên công ty.
- **Bình luận trực tiếp trên web thật**: Đồng nghiệp mở đường link trên trình duyệt, trực tiếp trải nghiệm tính năng bằng thao tác chuột và bấm ghim bình luận (comment) ngay trên giao diện web hệt như trải nghiệm trong Figma.
- **Bàn giao qua Git commit hash**: Thay vì xuất spec đo đạc pixel, designer chỉ cần gửi **mã commit hash cuối cùng** trên Git branch cho kỹ sư. Kỹ sư kéo nhánh về máy cá nhân, tái sử dụng tới **85–90% mã nguồn giao diện** đã được designer gọt giũa và chỉ cần tập trung đấu nối API production thật.
{% endhint %}

---

## 6. Bộ Não Tăng Cường (Augmented Brain) ngay trong Terminal

Không chỉ dùng Claude Code để viết giao diện, Caston biến công cụ dòng lệnh này thành một **trợ lý điều hành (Executive Assistant)** mở rộng tư duy của chính mình.

<details>
<summary>Xem chi tiết Kiến trúc "Bộ Não Mở Rộng" trong Terminal</summary>

Hệ thống vận hành thông qua một thư mục ngữ cảnh mà Caston liên tục bồi đắp mỗi ngày:
1. **Tài liệu hóa kiến thức liên tục**: Tập hợp các file Markdown ghi lại toàn bộ kinh nghiệm tích lũy, bối cảnh các dự án đang triển khai, bảng phân rã design token và cả transcript các cuộc thảo luận quan trọng trên Slack.
2. **Tự động rà soát chuẩn mực**: Khi làm việc với file giao diện, Claude Code tự động đối chiếu các token màu sắc và khoảng cách với tiêu chuẩn trợ năng (accessibility), đồng thời nhắc nhở designer thiết kế các trạng thái biên (edge cases, empty states) mà con người dễ bỏ sót.
3. **Giao tiếp bất đồng bộ qua video ngắn**: Để lan tỏa bài học mới cho toàn đội ngũ, Caston sử dụng Descript ghi lại video màn hình 1–2 phút. Công cụ tự động cắt gọt khoảng lặng và từ đệm, xuất link xem nội bộ nhanh chóng, giúp cả team nâng cao năng lực mà không cần tổ chức các cuộc họp đồng bộ tốn kém.
</details>

---

## 7. Ba Nguyên tắc Hành động cho Product Designer Thời đại AI-native

<!-- HÌNH: takeaway — "3 Nguyên tắc cốt lõi của Product Designer tại Shopify thời đại AI-native" -->
![3 Nguyên tắc cốt lõi của Product Designer tại Shopify thời đại AI-native](../../assets/design/zeHbB.png)

1. **Mã nguồn là phương tiện giao tiếp tối thượng**: Đừng lãng phí hàng tuần để trau chuốt các bản vẽ tĩnh cho những tương tác phức tạp. Hãy chuyển ý tưởng sang môi trường code càng sớm càng tốt để kiểm chứng bằng cảm giác thực tế và loại bỏ chi phí bảo trì tài liệu rườm rà.
2. **Ngữ cảnh càng cụ thể, AI càng sắc bén**: Sức mạnh của AI phụ thuộc vào chất lượng dữ liệu đầu vào. Việc cắt cúp ảnh cảm hứng chính xác, highlight đúng chi tiết cần học và viết rõ ràng bài toán của người dùng vào file Markdown giúp AI trở thành cộng sự tư duy đắc lực thay vì chỉ sinh ra các giao diện chung chung.
3. **Xây dựng bộ não số cho riêng mình**: Công cụ AI không chỉ để sinh code theo yêu cầu mà còn để đồng hành trong toàn bộ quy trình làm việc. Bằng cách lưu trữ tri thức dưới dạng văn bản và kết nối với các agent trong dòng lệnh, mỗi designer đều có thể tự tạo ra một trợ lý thông minh giúp gia tăng đáng kể tầm vóc và chiều sâu của bản thân.
