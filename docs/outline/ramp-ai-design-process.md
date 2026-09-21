---
nguồn: https://www.youtube.com/watch?v=mH5qIPx47jw
raw: docs/raw/Ramp's AI Design Process.txt
chuyên mục: ai-design
trạng thái: đã duyệt
---

# Quy trình Thiết kế AI-Native tại Ramp: Từ Prototype Tương tác đến Handoff Thực chiến

**Người đọc lấy được gì:** Hiểu cách George Kedenburg III (Product Designer tại Ramp, cựu thành viên nòng cốt tại Figma) tái định hình toàn bộ chu trình thiết kế: thay thế wireframe bằng prototype tương tác dựa trên substrate của code qua Magic Patterns, phân bổ tỷ lệ 80/20 giữa công cụ AI và Figma, kỹ thuật trích xuất component từ Chrome Extension, giả lập kịch bản hỗn loạn bằng Fixture Tools, tự động tìm kiếm "nỗi đau" khách hàng với LogRocket/Notion AI, và công cụ nội bộ Ramp Inspect giúp designer tự tạo GitHub PR.

**Thuật ngữ cần chú thích:** Substrate of the Internet · Magic Patterns · Fixture Tools · Happy Path & Unhappy Path · Phasing (Alpha/Beta/GA) · LogRocket Session Replay · The Mom Test · Ramp Inspect

## 1. "Làm Bánh Taco thay vì Chụp Ảnh Bánh Taco": Bắt đầu với Code thay vì Figma Tĩnh
**Ý chính:** George khởi đầu mọi dự án bằng một prototype chạy được thay vì vẽ wireframe hay loay hoay thiết lập hàng chục starting points trong Figma prototype manager. Code là "chất nền" (substrate) nguyên bản của Internet, sở hữu sẵn các tập tính tự nhiên (DNA di truyền) như tương tác gõ phím, co giãn kích thước, logic điều kiện và phản hồi tức thì. Ẩn dụ cốt lõi: nếu muốn mời ai đó ăn bánh taco, hãy làm chiếc bánh thật cho họ cắn thử thay vì chỉ đưa bức ảnh chụp bánh.
**Mốc trong raw:** [0:02], [1:05], [1:35], [2:36], [3:06], [7:42], [14:52], [20:04]
**Khối chữ:** hint (tư duy Substrate of Code vs Canvas Tĩnh)
**Hình:** compare — "Prototype Figma Tĩnh (Giả lập chuyển cảnh bằng tay, tốn công setup states, thiếu DNA web) vs Prototype Code Native (Thừa hưởng DNA trình duyệt, tương tác nhập liệu thật, kiểm tra UX tức thì)"

## 2. Chiến lược 80/20: Dùng AI Khám phá Tương tác, Giữ Figma cho Handoff & Tinh chỉnh
**Ý chính:** George xác định rõ ranh giới của công cụ: dùng Magic Patterns để giải quyết 70-80% bài toán đầu tiên (luồng tương tác, logic bảng biểu, lọc dữ liệu, cấu trúc thông tin) mà không bận tâm đến việc sai lệch vài pixel hay lệch bo góc. 20% còn lại thuộc về giai đoạn trau chuốt (craft portion): đưa luồng đã được thống nhất về Figma để áp dụng đúng Design System (Ryu), chuẩn hóa Design Tokens, kiểm tra empty states và redline để bàn giao cho kỹ sư. Việc cố dùng AI giải quyết 20% cuối cùng sẽ tốn công bảo trì vô ích ("the juice is not worth the squeeze").
**Mốc trong raw:** [8:12], [8:43], [9:13], [18:02], [18:32], [25:44], [28:25], [28:57]
**Khối chữ:** columns (so sánh 80% Khám phá tương tác bằng AI vs 20% Hoàn thiện và Handoff bằng Figma)
**Hình:** flow — "Dòng chảy 80/20 tại Ramp: 80% Magic Patterns (Thử nghiệm tương tác, form thông minh, đồng thuận UX) → 20% Figma Craft (Áp dụng Design System Ryu, redline, kiểm soát token bàn giao)"

## 3. Trích xuất Component từ Trình duyệt: Sức mạnh của Chrome Extension so với Prompt
**Ý chính:** Thay vì chụp ảnh màn hình hoặc gõ prompt mô tả lại giao diện từ đầu (thường khiến AI tạo ra component sai lệch về font chữ, màu sắc và bo góc), designer dùng Chrome Extension của Magic Patterns bốc trực tiếp các component đang chạy trên môi trường Sandbox/QA thật của Ramp (như Header, Sidenav, Approval Card). Extension phân tích DOM và cấu trúc Atomic Design thật, tạo ra component code có độ chính xác 95%, sau đó publish vào thư viện nội bộ để tái sử dụng trên mọi prototype.
**Mốc trong raw:** [6:41], [29:29], [30:01], [30:31], [31:01], [31:31], [32:02], [32:32], [33:06]
**Khối chữ:** columns (so sánh: Prompt tạo lại từ đầu vs Trích xuất trực tiếp bằng Extension)
**Hình:** compare — "Prompt Tạo lại Component từ Đầu (Sai lệch màu sắc, font chữ, layout bị vỡ) vs Trích xuất bằng Chrome Extension từ Sandbox (Kế thừa 95% cấu trúc DOM, tái sử dụng tức thì)"

## 4. Kiểm thử Hỗn loạn với Fixture Tools: Đưa Prototype Thoát khỏi Bẫy "Happy Path"
**Ý chính:** Designer thường rơi vào điểm mù khi chỉ thiết kế cho "Happy Path" (mọi thứ lý tưởng, 1-2 tài khoản). George tích hợp thanh công cụ `Fixture Tools` ngay trên đầu prototype cho phép trượt thanh tăng giảm dữ liệu cực hạn: từ 2 tài khoản lên 40 quốc gia, 200 tài khoản đa tiền tệ. Nhờ đó, cả team nhìn thấy giao diện tự động thích ứng ra sao (danh sách tự động chuyển thành bảng phân nhóm, tổng số dư tự tính lại) và dễ dàng thống nhất phân kỳ phát hành (Phasing: Alpha → Beta → GA) để kiểm soát phạm vi tính năng.
**Mốc trong raw:** [34:39], [35:10], [35:41], [36:11], [36:41], [37:11], [37:42], [38:12], [38:42]
**Khối chữ:** expandable (cách cấu hình Fixture Tools và quy trình phân kỳ Alpha → Beta → GA)
**Hình:** anatomy — "Giải phẫu Prototype Ramp: Thanh Fixture Tools giả lập dữ liệu hỗn loạn (Multi-entity, Currency) và Bộ chuyển đổi Phasing (Alpha, Beta, GA)"

## 5. Chủ động Tìm Vấn đề: Khai thác LogRocket, Notion AI và Thử nghiệm "The Mom Test"
**Ý chính:** Designer xuất sắc không thụ động chờ Product Manager giao tài liệu yêu cầu (product spec). George bắt đầu ngày làm việc bằng cách mở LogRocket xem 2-3 giờ video quay lại các phiên dùng thật của khách hàng, lọc ra các "rage clicks" (nhấp chuột giận dữ) và điểm nghẽn trải nghiệm. Kết hợp với bộ công cụ Voice of Customer và Notion AI để quét hàng trăm bản ghi phỏng vấn người dùng, anh phát hiện ra các bất cập logic ngầm (như lệch số dư giữa tài khoản vãng lai và đầu tư khi tiền đang chuyển giao) và áp dụng nguyên lý "The Mom Test" để đặt câu hỏi nghiên cứu thực chất thay vì khen ngợi xã giao.
**Mốc trong raw:** [39:12], [39:43], [40:13], [40:44], [41:23], [41:53], [42:23], [49:36], [50:07], [50:39]
**Khối chữ:** stepper (quy trình 3 bước: Soi LogRocket & Notion AI → Tái hiện lỗi trên Sandbox → Đặt câu hỏi theo The Mom Test)
**Hình:** loop — "Vòng lặp Customer Obsession: Soi Session Replay LogRocket & Notion AI → Phát hiện góc chết UX → Dựng prototype kiểm chứng theo The Mom Test"

## 6. Ramp Inspect: "Cursor Trong Trình Duyệt" Giúp Designer Tự Tạo GitHub PR
**Ý chính:** Để xóa bỏ rào cản kỹ thuật khi designer muốn đóng góp code trực tiếp nhưng không rành dòng lệnh terminal hay Git branch, Ramp xây dựng `Ramp Inspect` ngay trên trình duyệt. Designer chỉ cần click chọn phần tử giao diện, nhập prompt yêu cầu logic (ví dụ: hiển thị dòng Pending Deposit khi tiền đang chuyển giao), AI tự động sửa code và tạo bản xem trước (preview link). Sau khi kiểm tra ưng ý, designer có thể tự động tạo một GitHub Pull Request (PR) gửi kỹ sư mà không cần mở Cursor IDE hay gõ lệnh cài đặt.
**Mốc trong raw:** [45:30], [46:02], [46:33], [47:03], [47:33], [48:04]
**Khối chữ:** hint (cơ chế hạ thấp rào cản kỹ thuật bằng công cụ in-browser inspection)
**Hình:** flow — "Quy trình Sửa Lỗi và Tạo PR qua Ramp Inspect: Chọn phần tử giao diện → Nhập prompt nghiệp vụ → Xem live preview → Tự động tạo GitHub PR"

## 7. Nút thắt Thời đại AI: Tài liệu Khởi đầu, Góc nhìn Độc lập (POV) và "Sự Vật Lộn" trong Tư duy
**Ý chính:** Khi công cụ AI biến việc tạo prototype trở nên quá dễ dàng và rẻ mạt, nguy cơ mới xuất hiện: sự bùng nổ của các bản mẫu rác vô nghĩa. George và Jay chỉ ra rằng nút thắt lớn nhất hiện nay không nằm ở tốc độ sinh màn hình, mà là: 1. Bản tài liệu bài toán ban đầu (written starting document) để toàn team cùng nhìn về một hướng; 2. Góc nhìn độc lập (strong POV) của con người dựa trên sự thấu hiểu khách hàng thay vì sao chép LLM; 3. Giữ gìn "sự vật lộn" (the struggle) trong tư duy — sự khó khăn khi tự mình tìm tòi và tranh luận là con đường duy nhất giúp con người thông minh hơn, tránh để AI làm cùn mòn tư duy phản biện.
**Mốc trong raw:** [51:09], [51:41], [52:11], [52:41], [54:42], [55:14], [55:44], [56:16], [58:53], [59:26]
**Khối chữ:** cards (3 nguyên tắc cốt lõi về tư duy thời đại AI)
**Hình:** takeaway — "3 Đúc kết Chiến lược cho Product Designer: Tài liệu khởi đầu sắc bén, Góc nhìn độc lập (POV), và Trân trọng sự vật lộn trong tư duy"
