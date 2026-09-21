---
description: Khám phá quy trình làm việc tự chủ, bộ công cụ tinh gọn và tư duy vượt bẫy AI "One-Shot" của Design Engineer tại DuckDuckGo.
icon: duck
---

# Quy trình Làm việc của Design Engineer tại DuckDuckGo

> **Nhân vật chia sẻ**: Carl — Design Engineer tại DuckDuckGo  
> **Kênh phỏng vấn**: Sneak Peek (Host: Jay)  
> **Chủ đề**: Bộ công cụ tinh gọn, văn hóa tự chủ async-first, chiến lược "Hack Phase" và phương pháp làm chủ AI bằng kiến thức nền tảng.

{% embed url="https://www.youtube.com/watch?v=yfh4MWB78jY" %}
Video phỏng vấn gốc: Design Engineer at DuckDuckGo Shows His Workflow (and AI Tools He uses)
{% endembed %}

---

## 1. Bộ công cụ Tinh gọn: "Figma làm nháp, Cursor làm thật"

Khác với định kiến rằng một công ty công nghệ lớn phải sở hữu hệ thống công cụ đồ sộ, stack làm việc hàng ngày của Carl tại DuckDuckGo chỉ xoay quanh 4 thành phần tối giản nhưng có vai trò phân định rành mạch.

![Dòng chảy công việc tinh gọn của Design Engineer tại DuckDuckGo](../../assets/design/vnZGL.png)

{% tabs %}
{% tab title="Asana — Kho tri thức 18 năm" %}
Asana được DuckDuckGo sử dụng từ những ngày đầu thành lập khi nhà sáng lập gặp gỡ đội ngũ Asana tại sự kiện South by Southwest. Trải qua 18 năm, Asana đã trở thành **nguồn chân lý duy nhất (Single Source of Truth)** lưu trữ toàn bộ lịch sử công ty:
- Mọi quyết định thiết kế (tại sao chọn bo góc `8px`, tại sao hiển thị module này ở trường hợp A thay vì B) đều được ghi chép tường minh kèm ngữ cảnh.
- Nhờ tích hợp AI tìm kiếm ngữ nghĩa, bất kỳ nhân sự nào cũng có thể truy vết lại quyết định từ năm 2010 chỉ bằng một câu hỏi tự nhiên.
{% endtab %}

{% tab title="Figma — Bàn nháp tốc độ" %}
Figma là công cụ thiết kế chuẩn của toàn công ty, nhưng với vai trò Design Engineer, Carl không dùng Figma để vẽ từng luồng (flow) phức tạp hay mọi trạng thái (state) chi tiết:
- Figma đóng vai trò như một **bàn nháp tư duy (scratchpad)** để nhanh chóng đưa ý tưởng từ trong đầu ra mặt phẳng thị giác.
- Sau khi định hình được bộ khung cơ bản, anh chuyển ngay sang code thay vì sa đà vào việc trau chuốt bản vẽ tĩnh.
{% endtab %}

{% tab title="Cursor — 80% thời lượng làm việc" %}
Cursor là môi trường phát triển tích hợp (IDE) chính của Carl:
- Chiếm tới **80% thời gian làm việc hàng ngày**.
- Giúp rút ngắn khoảng cách từ ý tưởng đến giải pháp chạy thực tế, loại bỏ vòng lặp bàn giao (handoff) qua lại tốn kém giữa thiết kế và lập trình.
{% endtab %}

{% tab title="Ghostty & Mattermost" %}
- **Ghostty**: Trình giả lập terminal tối giản, tốc độ cao phục vụ các thao tác lệnh nhẹ nhàng.
- **Mattermost**: Nền tảng nhắn tin mã nguồn mở tự host bảo mật (thay thế Slack) phục vụ trò chuyện thường nhật, nhưng mọi quyết định quan trọng bắt buộc phải được chuyển về lưu trữ trong Asana.
{% endtab %}
{% endtabs %}

---

## 2. Văn hóa Async-first: Lịch làm việc không họp và Quyền tự chủ dự án

Lịch làm việc của một Design Engineer tại DuckDuckGo thường khiến nhiều người bất ngờ: **hầu như không có bất kỳ cuộc họp định kỳ nào**. Nhân sự có toàn quyền sắp xếp quỹ thời gian cá nhân (như dành 2 tiếng đi tập thể thao vào đầu ngày) miễn là đảm bảo tiến độ và chất lượng công việc.

{% hint style="info" %}
**Văn hóa Chất vấn Giả định (Questioning Assumptions)**  
Tại DuckDuckGo, không có Product Manager đứng lớp giao từng ticket Jira chi tiết. Nhân sự tự duyệt backlog trên Asana, tự nhận dự án phù hợp với sở trường (ví dụ: tối ưu khối hiển thị AI Answer) và tự lập timeline thực hiện.  
Cơ chế kiểm soát không dựa trên mệnh lệnh mà dựa trên việc **chất vấn hai chiều**: đồng nghiệp có thể đặt câu hỏi xem 1 tuần có quá tham vọng hay không, nhưng khi bạn đã đưa ra lập luận thuyết phục dựa trên dữ liệu, toàn đội sẽ trao trọn sự tin tưởng.
{% endhint %}

### Lợi ích cốt lõi của mô hình Async-first
- **Tập trung sâu (Deep Work)**: Thời gian làm việc liên tục không bị cắt vụn bởi các cuộc gọi đồng bộ, giúp designer và kỹ sư thực sự làm ra sản phẩm thay vì chỉ "họp bàn về việc làm sản phẩm".
- **Ép buộc văn bản hóa (Documentation Forcing Function)**: Vì làm việc lệch múi giờ trên toàn cầu (từ Anh, Mỹ đến Nhật Bản, Úc), mọi trao đổi và lý do đưa ra quyết định bắt buộc phải được viết rõ ràng trong Asana.

---

## 3. Chiến lược "Hack Phase": 5 phút làm mẫu, 3 tuần hoàn thiện

Một trong những quy trình thú vị nhất mà Carl áp dụng khi tiếp cận dự án mới là **Hack Phase** — giai đoạn thuần chất Design Engineer nhất trong vòng đời phát triển tính năng.

![Chiến lược Hack Phase vs Production Phase](../../assets/design/GbhQb.png)

{% stepper %}
{% step %}
### 1. Nhận diện cơ hội từ Backlog
Quan sát thấy Google có tính năng làm nổi bật (highlight) câu trả lời chính trong kết quả tìm kiếm AI, Carl nhận thấy DuckDuckGo cần lấp khoảng trống trải nghiệm này để tăng sức cạnh tranh và quyết định kéo task từ backlog về.
{% endstep %}

{% step %}
### 2. Triển khai Hack Phase thần tốc (5 phút)
Chưa vội lập kế hoạch cồng kềnh, Carl mở Cursor và chỉ mất **5 phút** để thay đổi một câu lệnh prompt trong hệ thống AI backend. Sau 30 phút trau chuốt lại giao diện (CSS/UI), anh đã có một nhánh làm việc (working branch) với tính năng chạy thực tế để demo cho toàn đội trải nghiệm.
{% endstep %}

{% step %}
### 3. Đánh giá Tác động Dây chuyền (Downstream Impacts)
Bản prototype chứng minh tính khả thi nhanh chóng, nhưng cũng làm lộ ra vấn đề: thay đổi prompt khiến các câu trả lời phức tạp bị giảm sút chất lượng và không vượt qua được bộ tiêu chí kiểm thử (evals).
{% endstep %}

{% step %}
### 4. Tinh chỉnh Production (gần 3 tuần)
Dành toàn bộ 2 tuần 6 ngày tiếp theo để làm bài toán phân tích đối thủ, prompt engineering chuyên sâu, thiết lập bộ tiêu chuẩn đánh giá tự động (evaluation criteria) và hoàn thiện các ca biên (edge cases) trước khi đưa tính năng ra người dùng cuối.
{% endstep %}
{% endstepper %}

---

## 4. Nâng cấp Kỹ năng bằng Tự động hóa (Automation Stack)

Để duy trì góc nhìn sắc bén về thiết kế sản phẩm, chuyển động và trí tuệ nhân tạo, Carl duy trì việc đọc và tuyển chọn hàng trăm bài viết mỗi tuần. Thay vì ngồi lọc tay 3-4 tiếng mỗi Chủ nhật, anh đã xây dựng một hệ thống tự động hóa thông minh.

{% expandable title="Xem chi tiết Kiến trúc Kịch bản Tự động hóa của Carl" %}
Hệ thống vận hành ngầm trên máy Mac thông qua một daemon `launchd` (chạy định kỳ hàng tuần):
1. **Thu thập nguồn tin**: Kịch bản Python tự động cào dữ liệu từ danh sách RSS feed, newsletter và các trang thiết kế uy tín.
2. **Lọc từ khóa thông minh**: Bóc tách nội dung thô, lọc bỏ rác quảng cáo và phân loại bài viết theo chuyên mục (Branding, Product Design, AI, Motion, Nerd Alerts).
3. **Biên tập bằng LLM**: Gọi API mô hình Gemini với system prompt định hình phong cách rõ ràng:
   > *"Đóng vai trò một biên tập viên am hiểu thiết kế, tôn trọng thời gian của độc giả. Hãy tóm tắt cô đọng, sắc bén và hấp dẫn những người có chuyên môn."*
4. **Xuất bản đa định dạng**: Tự động sinh ra file Markdown và Rich Text sẵn sàng để đăng tải.

**Nguyên tắc Human-in-the-loop**: Dù script có thể tự động publish lên web cá nhân, Carl luôn giữ bước duyệt cuối cùng bằng tay vào sáng thứ Hai để đảm bảo từng đường link chia sẻ đều đạt chuẩn chất lượng cao nhất.
{% endexpandable %}

---

## 5. Nguồn cảm hứng Thị giác: Motion là vũ khí của Design Engineer

Khi tìm kiếm cảm hứng giao diện, nguồn tài nguyên được Carl mở ra thường xuyên nhất là **Mobbin**, đặc biệt là thư viện các đoạn ghi hình tương tác chuyển động (motion recordings).

{% hint style="success" %}
**Motion — 10% Tinh xảo Cuối cùng Thường bị Bỏ quên**  
Trong các dự án phần mềm truyền thống, khi thời hạn bàn giao (deadline) bị rút ngắn, **chuyển động tương tác chính là thứ đầu tiên bị cắt bỏ**. Đội ngũ kỹ thuật thường coi motion là yếu tố phụ, không bắt buộc.  
Đây chính là nơi Design Engineer tỏa sáng: bằng cách làm việc trực tiếp trong code, họ nắm quyền kiểm soát và hiện thực hóa 10% độ tinh xảo cuối cùng — từ nhịp thở của trạng thái chờ AI (thinking state) đến độ trễ tự nhiên của các vi tương tác chuyển trang.
{% endhint %}

---

## 6. Lộ trình Chuyển dịch & Vượt qua bẫy "One-Shot" của AI

Nhiều người lầm tưởng muốn làm Design Engineer thì phải có xuất phát điểm chuyên sâu ở cả hai ngành. Hành trình của Carl cho thấy một con đường thực tế hơn: học kỹ năng mới khi công cụ cũ không còn đủ sức diễn đạt ý tưởng.

- **Dự án năng lượng tái tạo**: Figma không thể mô phỏng bảng tính động lượng phát thải CO2 theo thanh trượt kéo thả; Carl tự học Vue.js và Material UI để dựng bản mẫu chạy thật, sau này trở thành nền tảng cho sản phẩm chính thức.
- **Dự án ứng dụng di động**: Khi Apple vừa ra mắt SwiftUI, thay vì chờ đợi tài liệu, Carl tham gia viết tới 50% frontend ứng dụng vì lúc đó mọi kỹ sư đều bắt đầu từ con số 0.
- **Dự án Duck AI**: Tự tay làm prototype bằng Next.js và Vercel AI SDK để thuyết phục ban lãnh đạo đưa tính năng vào lộ trình phát triển.

![Thoát khỏi bẫy One-Shot bằng năng lực lõi hai chiều](../../assets/design/lMutS.png)

{% columns %}
{% column width="50%" %}
### Dành cho Kỹ sư muốn học Design
- Cần nắm vững các **nguyên lý thị giác cốt lõi**: phân cấp thị giác (visual hierarchy), tỷ lệ tương quan typography (type scale, font weight), khoảng cách (spacing tokens) và độ tương phản màu sắc.
- Khi có nền tảng thiết kế, bạn mới có thể đưa ra prompt chính xác cho AI (như yêu cầu chỉnh lại tương quan giữa `H1` và body text) thay vì chỉ ra lệnh mơ hồ *"hãy làm trang này đẹp hơn"*.
{% endcolumn %}

{% column width="50%" %}
### Dành cho Designer muốn học Code
- Cần hiểu bản chất của **cấu trúc cây DOM, luồng dữ liệu (state) và cơ chế hệ thống** (như tiến trình chạy ngầm, API, phân loại file).
- Nhờ hiểu sâu bản chất kỹ thuật, khi AI sinh code lỗi hoặc tìm kiếm sai file, bạn biết cách mổ xẻ vấn đề và dẫn dắt AI quay lại đúng quỹ đạo thay vì bế tắc bỏ cuộc.
{% endcolumn %}
{% endcolumns %}

---

## 7. Ba Nguyên tắc Hành động cho Designer thời đại AI

![Ba nguyên tắc cốt lõi của Design Engineer thời đại AI](../../assets/design/L0Blge.png)

1. **Figma là bàn nháp, Code là đích đến**: Đừng mất hàng chục giờ hoàn thiện hàng trăm artboard tĩnh cho các tương tác phức tạp. Hãy đưa ý tưởng vào môi trường code càng sớm càng tốt để kiểm chứng bằng cảm giác chuột và dữ liệu thật.
2. **Làm chủ nguyên lý gốc để dẫn dắt AI**: Khả năng tạo giao diện bằng một câu lệnh ("one-shot") sẽ ngày càng phổ biến. Giá trị cạnh tranh của bạn không nằm ở việc bấm nút generate, mà nằm ở năng lực thẩm định chi tiết và gọt giũa 10% tinh hoa cuối cùng.
3. **Thực chiến liên tục để duy trì độ nhạy**: AI và công cụ thay đổi từng ngày. Chỉ có việc trực tiếp giải quyết các bài toán sản phẩm thực tế mới giúp bạn phân biệt được đâu là giá trị cốt lõi trường tồn và đâu chỉ là trào lưu nhất thời.
