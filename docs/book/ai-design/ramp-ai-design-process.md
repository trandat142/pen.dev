---
description: "Khám phá cách George Kedenburg III (Product Designer tại Ramp) định hình lại quy trình thiết kế sản phẩm tài chính bằng AI: từ prototype tương tác bằng code, chiến lược phân bổ 80/20 với Figma, đến kiểm thử dữ liệu hỗn loạn và công cụ tự động tạo GitHub PR."
---

# Quy trình Thiết kế AI-Native tại Ramp

Khi phần lớn các đội ngũ thiết kế vẫn loay hoay tìm cách đưa AI vào việc sinh ra hàng trăm bản vẽ tĩnh trên Figma, George Kedenburg III — Product Designer phụ trách mảng Treasury (Quản lý ngân quỹ doanh nghiệp) tại Ramp và từng là thành viên nòng cốt tại Figma — đã lựa chọn một lối đi hoàn toàn khác: biến code thành chất nền (substrate) chính để khám phá sản phẩm ngay từ ngày đầu tiên.

Tại Ramp, quy trình thiết kế không bắt đầu từ wireframe hay những bản mockup tĩnh. Thay vào đó, nó bắt đầu bằng những prototype sống động có khả năng xử lý logic dữ liệu thật, được kiểm thử dưới áp lực hỗn loạn, và kết nối thẳng vào chu trình phát hành sản phẩm.

---

## 1. "Làm Bánh Taco Thay Vì Chụp Ảnh Bánh Taco": Bắt Đầu Với Code Thay Vì Figma Tĩnh

Trong quy trình truyền thống, khi nhận một yêu cầu tính năng mới, designer thường mở Figma, vẽ wireframe, rồi nối các mũi tên prototype phức tạp qua Prototype Manager để chuẩn bị cho buổi họp Design Critique. George gọi đây là sự lãng phí lớn:

> "Nếu tôi nói sẽ làm cho bạn một chiếc bánh taco, tôi thà làm chiếc bánh thật cho bạn cắn thử hơn là chỉ đưa bức ảnh chụp bánh."

Khi thiết kế luồng chuyển tiền (Transfer Funds) cho doanh nghiệp tại Ramp, yêu cầu nghiệp vụ rất phức tạp: nếu người dùng chuyển dưới 10 triệu USD, hệ thống có thể dùng phương thức thanh toán tức thì (Real-Time Payments - RTP); nhưng nếu chuyển từ 10 triệu đến 100 triệu USD, giao dịch bắt buộc phải đổi sang điện chuyển tiền (Wire transfer) theo quy định liên bang.

![Prototype Figma Tĩnh vs Prototype Code Native](../../assets/design/Rqkia.png)

Nếu dựng luồng này bằng Figma, designer sẽ phải nhân bản ít nhất 5 đến 10 màn hình khác nhau, thiết lập nhiều starting point và gán biến tương tác giả lập cồng kềnh. Nhưng khi chuyển sang môi trường web (chạy trên các công cụ như Magic Patterns hay v0), designer nhận được toàn bộ các hành vi này hoàn toàn tự nhiên:

{% hint style="info" %}
**Substrate of the Internet (Chất nền của Internet):** Web được xây dựng trên nền tảng code (HTML/CSS/JS). Trình duyệt đã có sẵn "bộ gen di truyền" (DNA) để xử lý việc nhập liệu form, tự co giãn bảng biểu, phản hồi sự kiện chuột, và kiểm tra điều kiện logic. Figma không có bộ gen này; mọi hành vi tương tác trên canvas tĩnh đều phải giả lập thủ công một cách máy móc.
{% endhint %}

Thay vì tổ chức một buổi họp Design Crit đông người rồi chia sẻ màn hình xem lướt qua các slide tĩnh, George chỉ cần gửi một đường link prototype duy nhất vào kênh Slack. Các bên liên quan (Stakeholders) trực tiếp gõ số tiền thật, bấm chuyển tiền, và trải nghiệm đúng cảm giác của người dùng cuối. Khi ai đó bấm vào một nút mà không có phản hồi, đó là tín hiệu khách quan báo hiệu cần đào sâu thiết kế thêm, thay vì phải ghi chú bằng lời trên bản vẽ.

---

## 2. Chiến Lược 80/20: Dùng AI Khám Phá Tương Tác, Giữ Figma Cho Handoff & Tinh Chỉnh

Một sai lầm phổ biến của các designer khi mới dùng AI là cố gắng ép công cụ phải tạo ra sản phẩm hoàn hảo từng pixel (pixel perfection) ngay lập tức. Họ mất hàng giờ để gõ prompt tinh chỉnh khoảng cách lề 8px hay đổi màu viền.

George phân định ranh giới rất rành mạch theo tỷ lệ 80/20:

![Dòng chảy 80/20 tại Ramp: Magic Patterns UX sang Figma Craft](../../assets/design/fI7YR.png)

{% columns %}
{% column width="50%" %}
### 80% Đầu tiên: Khám phá với AI
* **Công cụ:** Magic Patterns (hoặc v0).
* **Mục tiêu:** Giải quyết cảm giác sử dụng (feel of using), luồng tương tác (interaction flow), cấu trúc bảng biểu, phân nhóm dữ liệu và bộ lọc.
* **Tư duy:** Chấp nhận lỗi giao diện nhỏ, màu sắc chưa chuẩn 100% so với Design System.
* **Thời gian:** Rút ngắn xuống còn vài giờ thay vì nhiều tuần.
{% endcolumn %}

{% column width="50%" %}
### 20% Sau cùng: Trau chuốt & Handoff
* **Công cụ:** Figma (Craft Portion).
* **Mục tiêu:** Áp dụng hệ thống Design System chuẩn của Ramp (Ryu), gán Design Tokens, thiết lập Redline, trau chuốt typography và chuẩn bị bàn giao kỹ thuật.
* **Tư duy:** Figma là "nguồn chân lý" (source of truth) cho thông số kỹ thuật, nhưng luôn đính kèm link prototype tương tác.
{% endcolumn %}
{% endcolumns %}

Nhiều người hỏi tại sao không dùng Figma MCP hay các công cụ tự động hóa để AI giải quyết nốt 20% cuối cùng? Câu trả lời của George là: *"The juice is not worth the squeeze"* (Công sức bỏ ra không bõ với kết quả nhận lại). 

Việc redline trên Figma bằng Design System có sẵn diễn ra rất nhanh và ngăn nắp. Nếu cố ép prototype AI phải khớp từng token thiết kế, thì chỉ cần một token thay đổi ở bản gốc, designer lại phải quay sang bảo trì và sửa lỗi code trong prototype — tạo ra gánh nặng bảo trì hai đầu không đáng có.

---

## 3. Trích Xuất Component Từ Trình Duyệt: Sức Mạnh Của Chrome Extension So Với Prompt

Làm sao để một prototype tạo bằng AI trong 5 phút trông giống sản phẩm thật của Ramp mà không phải gõ lại từng dòng code giao diện?

George không gõ prompt mô tả lại từ đầu, cũng không chụp ảnh màn hình nạp cho AI (vốn là cách tiếp cận phổ biến nhưng kém hiệu quả):

![Prompt AI Tạo lại từ Đầu vs Trích xuất Component bằng Chrome Extension](../../assets/design/jOWXT.png)

| Tiêu chí | Prompt AI Tạo lại từ Đầu | Bốc qua Chrome Extension |
|---|---|---|
| **Độ chính xác thị giác** | Thường lệch màu, sai font chữ, bo tròn góc tùy tiện | Khớp 95% cấu trúc DOM và CSS thực tế |
| **Cấu trúc Component** | Tạo ra các khối HTML phẳng, khó tái sử dụng | Giữ nguyên phân cấp Atomic Design (nhóm nút, thẻ duyệt, thanh điều hướng) |
| **Tốc độ thực hiện** | Mất nhiều vòng prompt tinh chỉnh | Một cú click chuột trên trình duyệt sandbox |
| **Khả năng kế thừa** | Mỗi màn hình prompt lại một kiểu | Xuất bản vào thư viện component để dùng chung cho mọi prototype |

Thông qua Chrome Extension của Magic Patterns, George mở môi trường thử nghiệm (Sandbox) của Ramp, chọn trực tiếp các component như `Treasury Sidenav`, `Bill Pay Header`, hay `Approval Card` để extension tự động phân tích DOM và chuyển hóa thành component code chuẩn. 

Khi cần dựng màn hình mới mang tên "Upcoming Bills", anh chỉ việc ra lệnh bằng giọng nói: *"Hãy ghép ramp treasury sidenav và ramp treasury bill pay header lại với nhau"*. Hệ thống sẽ gọi chính xác các component đã lưu trong thư viện mà không bị méo mó giao diện.

---

## 4. Kiểm Thử Hỗn Loạn Với Fixture Tools: Đưa Prototype Thoát Khỏi Bẫy "Happy Path"

Designer thường có xu hướng rơi vào bẫy "Happy Path" — thiết kế giao diện trong điều kiện lý tưởng với 1 hoặc 2 tài khoản ngân hàng có tên ngắn, số dư tròn trịa và không có lỗi phát sinh. Khi ra mắt thực tế, giao diện lập tức bị vỡ khi gặp khách hàng doanh nghiệp lớn.

Để giải quyết triệt để vấn đề này, George nhúng một thanh công cụ mang tên **Fixture Tools** ngay trên đầu các bản prototype:

![Giải phẫu Prototype Ramp: Thanh Fixture Tools và Bộ chuyển đổi Phasing](../../assets/design/Mazqw.png)

<details>
<summary><strong>Tìm hiểu cơ chế hoạt động của Fixture Tools và Phasing</strong></summary>

* **Giả lập quy mô dữ liệu (Scale Multipliers):** Fixture Tools cho phép stakeholder kéo thanh trượt từ 1 công ty lên 40 quốc gia (entities) và hàng trăm tài khoản ngân hàng. Giao diện lúc này tự động biến chuyển: danh sách thẻ thông thường sẽ tự động chuyển thành bảng dữ liệu (Data Table) có phân nhóm theo quốc gia (US, Canada, Mexico) và định dạng đa tiền tệ.
* **Kiểm tra độ chịu tải của bố cục:** Khi số lượng tài khoản tăng lên 5 tài khoản mỗi chi nhánh, trang kéo dài ra gấp nhiều lần. Designer và Product Manager lập tức nhìn thấy sự bất tiện khi cuộn trang, từ đó nảy sinh nhu cầu làm bộ lọc hoặc thanh tìm kiếm nhanh.
* **Chuyển đổi phân kỳ (Phasing Switcher):** Fixture Tools tích hợp sẵn các nút chuyển đổi giai đoạn:
  * **Alpha (Phase 1):** Phiên bản tối giản tính năng, thử nghiệm khép kín với 5–20 khách hàng thân thiết để đo lường phản hồi.
  * **Beta (Phase 2):** Bổ sung các bộ lọc phức tạp và phân quyền người dùng.
  * **GA - General Availability (Phase 3):** Bản hoàn thiện đầy đủ tính năng ra mắt toàn bộ thị trường.

Nhờ việc trực quan hóa các giai đoạn ngay trên prototype, designer dễ dàng từ chối các yêu cầu phát sinh (scope creep) bằng cách chỉ rõ: tính năng này sẽ thuộc về Phase 2 hay Phase 3 thay vì tranh cãi lý thuyết.
</details>

---

## 5. Chủ Động Tìm Vấn Đề: Khai Thác LogRocket, Notion AI Và Thử Nghiệm "The Mom Test"

Thay vì ngồi đợi Product Manager (PM) hay bộ phận nghiên cứu người dùng (UXR) lập danh sách tính năng cần làm, một designer chủ động tại Ramp bắt đầu ngày làm việc bằng cách tự mình tìm kiếm các "nỗi đau" của khách hàng.

![Vòng lặp Customer Obsession: LogRocket, Notion AI và The Mom Test](../../assets/design/wWk8y.png)

Quy trình tự thân của designer diễn ra qua 3 bước chặt chẽ:

{% stepper %}
{% step %}
### Soi Session Replay trên LogRocket
George dành 2 đến 3 giờ mỗi tuần (thường là vào đầu giờ sáng bên tách cà phê) để xem các đoạn video ghi lại phiên sử dụng thực tế của khách hàng trên LogRocket. Anh thiết lập bộ lọc theo URL (`/treasury`, `/investment-accounts`) và tìm kiếm các hành vi "rage clicks" (nhấp chuột liên tục thể hiện sự ức chế). Nhìn khách hàng lúng túng trên chính màn hình mình thiết kế là cách rèn luyện sự đồng cảm chân thực nhất.
{% endstep %}

{% step %}
### Quét dữ liệu nghiên cứu với Notion AI
Đội ngũ UXR của Ramp lưu trữ toàn bộ biên bản phỏng vấn khách hàng trên Notion. George dùng Notion AI để truy vấn nhanh các vấn đề nổi cộm. Ví dụ: phát hiện khách hàng phàn nàn về việc chuyển tiền giữa tài khoản kinh doanh và tài khoản đầu tư khiến số dư hiển thị bị lệch trong thời gian chờ thanh toán (in-transit period), gây khó khăn cho việc đối soát sổ sách kế toán.
{% endstep %}

{% step %}
### Kiểm chứng theo nguyên tắc "The Mom Test"
Khi chuẩn bị phỏng vấn hoặc gửi prototype cho khách hàng trải nghiệm, George áp dụng triết lý trong cuốn sách kinh điển *The Mom Test*: tuyệt đối không hỏi những câu hỏi xã giao như *"Bạn có thích tính năng này không?"* (vì người nghe sẽ luôn khen ngợi để làm vừa lòng bạn). Thay vào đó, hãy hỏi về hành vi thực tế trong quá khứ: *"Lần gần nhất bạn đối soát số dư bị lệch, quy trình của bạn diễn ra như thế nào và bạn mất bao lâu để giải quyết nó?"*.
{% endstep %}
{% endstepper %}

---

## 6. Ramp Inspect: "Cursor Trong Trình Duyệt" Giúp Designer Tự Tạo GitHub PR

Khi đã tìm ra giải pháp cho bài toán số dư không nhất quán (chỉ cần hiển thị thêm dòng trạng thái `Pending Deposit` dưới mục số dư khả dụng), designer sẽ làm gì tiếp theo? Chụp ảnh màn hình rồi mở ticket Jira nhờ kỹ sư thêm một dòng chữ?

Tại Ramp, rào cản kỹ thuật được xóa bỏ hoàn toàn nhờ công cụ nội bộ mang tên **Ramp Inspect** — được ví như một phiên bản Cursor IDE tích hợp trực tiếp trong trình duyệt:

![Quy trình Sửa Lỗi và Tạo PR qua Ramp Inspect](../../assets/design/IJRxI.png)

{% hint style="success" %}
**Hạ thấp rào cản đóng góp code:** Không cần phải mở terminal, không cần chạy lệnh `yarn start`, không cần cấu hình Git branch trên máy cá nhân. Mọi nhân viên — kể cả designer không rành kỹ thuật — đều có thể chỉnh sửa giao diện và logic đơn giản trực tiếp trên nền web.
{% endhint %}

Quy trình làm việc diễn ra thần tốc:
1. **Chọn phần tử (Inspect):** Designer bấm chọn trực tiếp vào thành phần số dư trên màn hình web.
2. **Ra lệnh bằng ngôn ngữ tự nhiên:** Nhập prompt: *"Thêm một dòng text bên dưới giá trị tài khoản thể hiện số tiền đang chờ gửi (pending deposits). Kể cả khi số tiền này bằng 0, vẫn hiển thị nhãn để người dùng an tâm rằng hệ thống đang ghi nhận các giao dịch đang trung chuyển."*
3. **Kiểm tra Preview Link:** Ramp Inspect tự động sửa code và sinh ra đường dẫn preview tức thì (tương tự như localhost) để designer kiểm tra trực tiếp.
4. **Tự động mở GitHub PR:** Nếu bản xem trước hoạt động hoàn hảo, designer chỉ cần nhấn một nút để hệ thống tự động tạo một Pull Request (PR) chuẩn chỉnh trên GitHub gửi cho kỹ sư phụ trách xem xét và merge vào production.

---

## 7. Nút Thắt Thời Đại AI: Tài Liệu Khởi Đầu, Góc Nhìn Độc Lập (POV) Và "Sự Vật Lộn" Trong Tư Duy

Khi các công cụ AI giúp việc tạo prototype trở nên quá dễ dàng và rẻ mạt, một nghịch lý mới xuất hiện: sự bùng nổ của rác thải giao diện. Bất kỳ ai cũng có thể tạo ra hàng tá bản mẫu bắt mắt chỉ sau vài phút gõ lệnh.

Trong phần kết của buổi trò chuyện, George và Jay đã chỉ ra 3 nguyên tắc định hướng mang tính sống còn đối với người làm thiết kế sản phẩm:

![3 Đúc kết Chiến lược cho Product Designer thời đại AI](../../assets/design/ra6fu.png)

### 1. Nút thắt lớn nhất là Tài liệu Định nghĩa Bài toán (Starting Document)
Khi ai cũng sở hữu "máy in 3D", việc in ra sản phẩm không còn là lợi thế cạnh tranh. Khó khăn lớn nhất của các tổ chức hiện nay là làm sao để mọi người cùng thống nhất xem **cần giải quyết bài toán gì**. Một bản đặc tả sản phẩm (product spec) hoặc tài liệu bài toán được viết gãy gọn, rõ ràng chính là ngọn hải đăng duy nhất ngăn cả team không bị lạc giữa rừng prototype AI.

### 2. Giữ vững góc nhìn độc lập (Strong POV)
AI là một người bạn đồng hành dễ dãi — nó sẵn sàng chiều theo mọi gợi ý và tạo ra những kết quả có vẻ hợp lý nhưng rỗng tuếch. Giá trị của một designer chuyên nghiệp nằm ở góc nhìn cá nhân (Point of View) độc lập, được tôi luyện qua hàng trăm giờ quan sát hành vi thực tế của khách hàng. Không có bất kỳ mô hình ngôn ngữ lớn (LLM) nào có thể thay thế được trực giác và sự nhạy bén thị trường của con người.

### 3. Trân trọng "Sự vật lộn" (The Struggle) trong tư duy
> "Sự vật lộn khi đối diện với sai lầm và việc nỗ lực tự mình tìm ra hạt ngọc chân lý — dù đơn độc hay cùng đồng đội — là con đường duy nhất giúp con người thông minh hơn."

Việc khoán trắng tư duy cho ChatGPT hay AI sẽ dần biến chúng ta thành những người thụ động và làm thui chột khả năng phản biện. Hãy dám ngồi một mình trước trang giấy trắng, dám vật lộn với những bài toán hóc búa, bởi vì chính trong sự vật lộn đó, những giải pháp đột phá và bản sắc nghề nghiệp mới thực sự được hình thành.
