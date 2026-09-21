# Từ điển hình — bộ khởi điểm mở

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
