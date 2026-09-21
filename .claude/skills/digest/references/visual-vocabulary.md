# Từ điển loại hình visual

Nguyên tắc nền: **hình dạng của ý quyết định loại hình, không phải sở thích.**
Chọn sai khuôn thì người đọc phải tự dịch ngược trong đầu.

## Bảy loại

| Loại | Dùng khi ý có dạng | Ví dụ |
|---|---|---|
| `compare` | Hai hoặc ba lựa chọn song song, cùng tiêu chí | Figma stop-motion vs live code; Version A/B/C |
| `flow` | Các bước **khác loại** nối nhau, một chiều, có đầu có cuối | Design System → Deploy → Test → Jira |
| `loop` | Quay về điểm xuất phát, lặp lại | Ask (đọc) → Agent (ghi) → Commit → Ask |
| `tree` | Một gốc tẽ nhiều nhánh, có cấp bậc | `main` → bronze / silver / gold |
| `ladder` | **Cùng một thứ** ở các mức độ tăng dần | Crawl → Walk → Run |
| `anatomy` | Một giao diện thật cần chỉ tận nơi, đánh số chú thích | Switcher widget ở góc màn hình |
| `takeaway` | Nguyên tắc rời rạc, không có quan hệ trước–sau | 3 đúc kết cuối bài |

`flow` và `ladder` trông giống nhau nhưng khác bản chất. `flow` là các bước **khác
loại** nối tiếp. `ladder` là **cùng một thứ** ở ba độ chín. Vẽ lẫn là người đọc
hiểu sai quan hệ.

## Khổ giấy

**Chiều rộng luôn 1200px** — để vừa cột GitBook, không vỡ layout.
**Chiều cao thả nổi theo loại.** Không ép 16:9.

| Loại | Chiều cao gợi ý |
|---|---|
| `flow`, `ladder` | thấp và dài — ~450-550 |
| `takeaway` | ~450 |
| `compare` | cao — ~700-800 (2-3 cột cần chỗ) |
| `tree` | ~700-800 |
| `loop` | gần vuông — ~800-1000 |
| `anatomy` | theo tỷ lệ màn hình được mổ |

Xuất PNG 2x.

## Màu có nghĩa cố định, không trang trí

| Token | Mã | Nghĩa |
|---|---|---|
| Ember | `#fc5000` | Cái quan trọng nhất / phương án được chọn / bước đang nói tới |
| Plasma Violet | `#524ae9` | Phương án thay thế, nhánh phụ, đường so sánh |
| Sulfur | `#f5f28e` | Nhãn, tag, chú thích đánh số |
| Obsidian | `#070607` | Chữ và nét |
| Limestone | `#f7f6f2` | Mặt thẻ |
| Pumice | `#e2e2df` | Nền |

**Một hình chỉ một chỗ dùng Ember.** Đây là quy tắc rẻ nhất để bộ hình trông như
một hệ thống thay vì một tập hợp rời rạc.

Chữ: Momo Trust Sans. Icon: Lucide.

## Khi hình thực sự thêm giá trị

Hình phát huy mạnh nhất khi ý có quan hệ **không gian**: song song, vòng, phân
nhánh, vị trí trên màn hình. Đó là thứ chữ diễn đạt kém nhất.

Mục chỉ là vài gạch đầu dòng rời rạc thì hình thêm được ít hơn — nhưng **đây là
gợi ý, không phải luật**. User quyết mật độ hình, không phải tôi.

## Tên khung trong canvas

Tên file ảnh là ID do Pencil sinh — không đổi được và không nên đổi. Ý nghĩa phải
nằm ở **tên khung**:

```
<Bài> - <Số> <Chủ đề>          →  CNN - Card 4 Socratic Loop
```

Đặt tên khung tử tế thì `INDEX.md` sinh ra tự khắc đọc được.
