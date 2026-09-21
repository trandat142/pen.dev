# Từ điển hình — bộ khởi điểm mở

## Chức năng của hình: đúc kết đứng độc lập được

**Hình không phải bản tóm tắt của chữ. Hình là một lối vào khác, đi thẳng tới kết
luận.** Người chỉ quét hình — không đọc một dòng chữ nào trong bài — phải nắm được
kết luận của mục đó. Người đọc chữ thì được lý lẽ, ví dụ, sắc thái mà hình không
có chỗ chứa. Hai bên không thi nhau ôm thông tin; chúng phục vụ hai tốc độ đọc.

Vì vậy **đẩy nội dung vào hình càng nhiều càng tốt** — hình không chỉ là nhãn, nó
được phép chứa cả lý lẽ, số liệu, ví dụ. Đổi lại, **chữ hạn chế diễn giải lại điều
hình đã nói.** Việc của chữ là dẫn nhập, mở bối cảnh, hoặc bổ sung thứ hình không
có chỗ chứa (case study dài, ngoại lệ, lý do sâu) — không phải viết lại bằng văn
xuôi những gì hình đã liệt kê.

**Mẫu đúng, lấy từ chính bài DuckDuckGo (mục 1):** câu dẫn trước `vnZGL.png` là
*"Khác với định kiến rằng một công ty công nghệ lớn phải sở hữu hệ thống công cụ
đồ sộ, stack làm việc hàng ngày của Carl tại DuckDuckGo chỉ xoay quanh 4 thành
phần tối giản..."* — mở bối cảnh, không nhắc lại bất kỳ chi tiết nào của 4 thẻ.
Toàn bộ nội dung nằm trong hình.

**Mẫu sai, cùng bài (mục 7):** hình `L0Blge.png` viết *"Đừng mất công vẽ hàng
chục artboard tĩnh giả lập chuyển động. Hãy đưa ý tưởng vào môi trường code càng
sớm càng tốt..."*, chữ bên dưới viết *"Đừng mất hàng chục giờ hoàn thiện hàng
trăm artboard tĩnh cho các tương tác phức tạp. Hãy đưa ý tưởng vào môi trường
code càng sớm càng tốt..."* — cùng một câu, đổi vài từ. Đây là diễn giải lại,
không phải bổ sung. Khi viết chữ quanh một hình, nếu bắt gặp mình đang paraphrase
một gạch đầu dòng đã có trong hình — cắt câu đó, hoặc đổi nó thành thông tin mới.

### Giải phẫu một thẻ — đã tự hình thành qua 4 hình thật, giờ là chuẩn

Nhìn `vnZGL.png`, `GbhQb.png`, `lMutS.png`, `L0Blge.png` (bài DuckDuckGo) thấy
cùng một giải phẫu, độc lập với nội dung từng hình:

```
Nhãn ngắn (badge)
Tiêu đề
Vài gạch đầu dòng chi tiết      ← lớp BẰNG CHỨNG, chữ trong bài đã có sẵn
Hàng kết ở đáy (số liệu/trích dẫn/verdict)   ← lớp ĐÚC KẾT
```

**Hàng kết phải là câu đứng một mình được.** Ví dụ đạt: "Bẫy one-shot bề nổi, dựa
dẫm prompt và thiếu nền tảng, dừng lại ở prototype đồ chơi." Ví dụ không đạt: một
con số trần trụi không kèm khẳng định gì ("80%" mà không nói 80% của cái gì, tốt
hay xấu).

### Phân cấp bắt buộc — cái gì to, cái gì được phép nhỏ

| Lớp | Vai trò | Yêu cầu |
|---|---|---|
| Nhãn + tiêu đề + hàng kết | Đúc kết, phải đứng một mình được | Cỡ chữ **lớn nhất**, tương phản cao nhất trong thẻ. Dựng và canh cỡ chữ cho lớp này **trước** |
| Gạch đầu dòng chi tiết | Nội dung thật, không phải phụ chú | Được phép nhỏ hơn lớp trên, nhưng **vẫn phải đọc được ở khổ hiển thị thật** — chữ trong bài không còn nghĩa vụ chứa lại nó |

**Chữ không còn là bản dự phòng cho lớp chi tiết.** Trước đây lớp chi tiết được
phép nhỏ với lý do "chữ đã chứa lại" — lý do đó hết hiệu lực từ khi chữ chuyển
sang hạn chế lặp. Hình càng ôm nhiều nội dung, hình càng phải tự đọc được: nếu
một chi tiết chỉ tồn tại trong hình mà hình lại quá nhỏ để đọc, chi tiết đó biến
mất khỏi bài, không có nơi nào khác chứa nó.

### Mã hoá bằng hình dạng — giảm chữ mà không giảm nghĩa

6 hình đã kiểm (`vnZGL`, `GbhQb`, `lMutS`, `L0Blge`, `Rqkia`, `YfOHw`) đều là thẻ
chữ thuần — không cái nào dùng kích thước, vị trí, hay mức lấp đầy để mang nghĩa.
Đây là cơ hội bị bỏ phí: `GbhQb.png` có hàng kết "~35 Phút" đối lại "2 Tuần 6
Ngày" — một chênh lệch khổng lồ, nhưng viết bằng chữ cùng cỡ. Não xử lý kích
thước và mức lấp đầy gần như tức thời (dưới 200ms), xử lý chữ chậm hơn nhiều.
Đổi kênh mã hoá từ chữ sang hình dạng nén được cùng một nội dung vào ít thời gian
đọc hơn — không phải giảm nội dung.

**Chỉ áp cho dữ liệu có bản chất định lượng:**

| Dữ liệu có dạng | Vẽ bằng | Không còn viết thành câu |
|---|---|---|
| Tỷ lệ / phần trăm | Thanh ngang lấp theo tỷ lệ, hoặc donut (`fill` + `innerRadius`) | "chiếm 80% thời gian" |
| Hai đại lượng chênh lệch lớn | Hai khối kích thước tỷ lệ thật với nhau | "35 phút so với 2 tuần 6 ngày" |
| Đạt/không đạt, đúng/sai | Icon ✓/✗ (đã dùng tốt — tiếp tục) | "điều này đúng", "điều này sai" |
| Khái niệm có vật thật liên tưởng | Pictogram (bánh taco, máy ảnh...) | Chỉ ghi tên khái niệm suông |

**Không áp cho câu mang lý lẽ nhân-quả** — *"khiến Cursor sinh code thừa, sai
trọng tâm"* không vẽ được bằng hình dạng, vẫn phải là chữ. Hình dạng thay được
con số và trạng thái, không thay được lập luận.

**Phép thử trước khi viết một gạch đầu dòng có số liệu:** tự hỏi "cái này vẽ
được bằng hình dạng không?" Vẽ được thì vẽ, chữ chỉ còn làm nhãn ngắn đi kèm
(ví dụ "35 phút" cạnh một thanh nhỏ), không viết lại thành câu đầy đủ.

Nạp thêm skill `dataviz` khi dựng thanh tỷ lệ/donut/kích thước theo dữ liệu — nó
có sẵn quy ước màu và hình cho stat tile/meter, đỡ phải tự nghĩ từ đầu. Pencil
hỗ trợ sẵn: ưu tiên bar chart dựng bằng layout, donut bằng `fill` + `innerRadius`
(xem `pen-dev` skill, mục "Graphs").

Lỗi thật đã xảy ra không phải ở nội dung hình, mà ở việc đối xử ba lớp ngang nhau:
`lMutS.png` có nhãn cột ("BẪY ONE-SHOT BỀ NỔI") cùng cỡ với gạch đầu dòng bên
dưới, nên khi hình co lại (điện thoại, hoặc mắt lướt nhanh) phần đáng lẽ phải
sống sót lại mờ trước.

### Phép thử trước khi coi hình là xong

Với **từng thẻ/node**: che phần gạch đầu dòng chi tiết, chỉ để nhãn + tiêu đề +
hàng kết. Đọc lên có phải một kết luận trọn vẹn không? Không trọn vẹn thì hàng
kết chưa đủ, hoặc lớp đúc kết chưa được ưu tiên đúng cỡ chữ.

Áp dụng cho mọi loại hình, không chỉ dạng thẻ — `flow`/`loop`/`tree` thì nhãn trên
mỗi node/mũi tên phải là một khẳng định ngắn, không phải danh từ trung tính; `anatomy`
thì chú thích đánh số phải là nhận định ("nút này gây tràn"), không phải tên bộ
phận suông ("nút X").

## Luật duy nhất

**Hình dạng phải khớp cấu trúc của ý.** Hết. Mọi thứ dưới đây là gợi ý, không
phải danh sách chọn.

Ý là vòng lặp thì vẽ vòng lặp — đừng xếp bốn thẻ ngang rồi đánh số 1-2-3-4 và coi
như xong. Đó là lỗi có thật trong `RkpmJ.png`: tiêu đề ghi "Socratic Loop", hình
ra bốn thẻ thẳng hàng, không mũi tên, không đường quay lại.

Ý có dạng ma trận, lớp chồng, bản đồ, trước/sau gối lên nhau, hay bất cứ dạng nào
không nằm dưới đây? **Vẽ dạng đó, rồi thêm vào file này.** Ép ý vào khuôn gần nhất
chính là cơ chế đã làm mọi hình trông giống nhau.

## Bộ khởi điểm

| Loại | Khi ý có dạng |
|---|---|
| `compare` | Hai ba lựa chọn song song, cùng tiêu chí |
| `flow` | Các bước **khác loại** nối nhau, một chiều |
| `loop` | Quay về điểm xuất phát, lặp lại |
| `tree` | Một gốc tẽ nhiều nhánh, có cấp bậc |
| `ladder` | **Cùng một thứ** ở các mức độ tăng dần |
| `anatomy` | Giao diện thật cần chỉ tận nơi, đánh số |
| `takeaway` | Nguyên tắc rời rạc, không có quan hệ trước–sau |

`flow` là các bước **khác loại** nối tiếp. `ladder` là **cùng một thứ** ở ba độ
chín. Vẽ lẫn là người đọc hiểu sai quan hệ.

---

## Hai chế độ dựng

| Chế độ | Cách làm | Hợp với |
|---|---|---|
| **Xếp hàng** | flexbox, thẻ | `compare`, `takeaway`, `ladder` |
| **Sơ đồ** | `layout: "none"` + toạ độ tính sẵn + `path` làm mũi tên | `flow`, `loop`, `tree`, `anatomy` |

Nhóm sơ đồ **bắt buộc** dùng chế độ sơ đồ. Flexbox không diễn đạt được "mũi tên
này bắt đầu đúng giữa cạnh dưới hộp số 2" — ép vào flexbox là mất luôn mũi tên,
và mất mũi tên là mất quan hệ.

Công cụ sẵn có mà hay bị quên: node `path` với `viewBox` (mũi tên, đường cong,
hình tự do), `Generate` với `type: "svg"` (tranh minh hoạ khi ý cần ẩn dụ), node
`icon`, gradient, shader.

---

## Lưới — thứ chặn lệch

`layout: "none"` **không phải đặt tay bằng mắt.** Lệch không đến từ việc tự tính
toạ độ; lệch đến từ việc **đoán** toạ độ. Mọi con số phải sinh ra từ lưới này.

| | |
|---|---|
| Khổ ngang | **1200** (cố định) |
| Lề hai bên | 60 → vùng nội dung **1080** |
| Khoảng cách cột | 24 |
| Đơn vị cơ sở | **4** — mọi `x`, `y`, `width`, `height` là bội của 4 |

| Số cột | Bề rộng mỗi cột |
|---|---|
| 2 | 528 |
| 3 | 344 |
| 4 | 252 |

**Đảm bảo không lệch:** các hộp cùng một hàng phải **dùng chung đúng một giá trị
`y` và `h`**. Tâm dọc khi đó bằng nhau *về số học*, nên mũi tên nối ngang phẳng
tuyệt đối — không phải "trông có vẻ phẳng".

Mũi tên bám điểm neo tính sẵn, không đặt bằng mắt. Hộp tại `(x, y, w, h)`:

```
phải  = (x + w,      y + h/2)
trái  = (x,          y + h/2)
dưới  = (x + w/2,    y + h)
trên  = (x + w/2,    y)
```

Lưới **không đổi giữa các hình**. Chính điều đó làm cả bộ trông như một hệ thống.
Linh hoạt nằm ở tầng trên — chọn chế độ nào, mấy cột, cao bao nhiêu — không nằm ở
lưới.

## Chiều cao

Chiều rộng luôn 1200. **Chiều cao theo nội dung, không ép 16:9.**

Bằng chứng vì sao: cả 5 hình đã xuất bản đều 2400×1350, và trong `RkpmJ.png` hai
thẻ dưới bị kéo giãn để lấp cho đủ 675px — chữ chiếm chưa tới nửa trên, phần dưới
trống hoàn toàn.

Gợi ý điểm xuất phát: `flow`/`ladder`/`takeaway` thấp và dài; `compare`/`tree` cao
hơn; `loop` gần vuông; `anatomy` theo tỷ lệ màn hình được mổ. Cắt sát nội dung.

Xuất PNG 2x.

## Màu

| Token | Mã | Vai trò |
|---|---|---|
| Ember | `#fc5000` | Thứ quan trọng nhất / phương án được chọn |
| Plasma Violet | `#524ae9` | Phương án thay thế, nhánh phụ, vế đối |
| Sulfur | `#f5f28e` | **Nền** cho chữ Obsidian — không bao giờ là màu chữ |
| Obsidian | `#070607` | Chữ và nét |
| Limestone | `#f7f6f2` | Mặt thẻ |
| Pumice | `#e2e2df` | Nền |

Ember dành cho **thứ quan trọng nhất**. Cần tới hai chỗ Ember thì dừng lại tự hỏi
hình này có đang làm hai việc không — hỏi, không phải cấm. Cặp đối nhau dùng
Ember / Violet là hợp lệ và đọc rất rõ.

Chữ: Momo Trust Sans. Icon: Lucide.

## Cảnh giác: bệnh "cái gì cũng là thẻ"

Tài liệu của chính Pencil cảnh báo: *"Avoid wrapping every element in its own box
or card. This is a common AI habit that makes designs look generic."*

`RkpmJ.png` có sáu khối thì cả sáu đều là thẻ bo góc. Dùng khung khi nó có vai trò
cấu trúc thật, không phải theo phản xạ.

## Tên khung trong canvas

Tên file ảnh là ID do Pencil sinh, không đổi được và không nên đổi. Ý nghĩa nằm ở
**tên khung**:

```
<Bài> - <Số> <Chủ đề>          →  CNN - Card 4 Socratic Loop
```
