---
name: digest
description: Biến tài liệu thô trong docs/raw/ thành bài GitBook trực quan — dựng outline để duyệt, viết bài, rồi dựng hình trong gitbook.pen. Dùng khi user thả file vào docs/raw/, đưa transcript hoặc bài viết dài cần xử lý, yêu cầu viết bài cho GitBook, hoặc yêu cầu dựng infographic minh hoạ.
---

# Digest — từ bài thô sang bài GitBook

Bốn chặng, ba cổng duyệt. **Không được nhảy cóc qua cổng.**

```
docs/raw/<tên>.md                   [1] Dọn & đọc
        ↓
docs/outline/<slug>.md              [2] Outline  ← ★ CỔNG 1: duyệt cấu trúc
        ↓
docs/book/<mục>/<slug>.md           [3] Viết     ← ★ CỔNG 2: đọc chữ
        ↓
PNG sạch lỗi cơ học                 [4] Dựng hình + tự kiểm
                                                 ← ★ CỔNG 3: duyệt thị giác
        ↓
chèn ảnh vào bài + cập nhật INDEX.md
```

## Chặng 1 — Dọn & đọc

**Nhận dạng loại raw trước.** Không phải file nào cũng là transcript.

| Loại | Dấu hiệu | Xử lý |
|---|---|---|
| Transcript tự động | Có `[m:ss]`, câu lặp chồng lấn | Dedupe (xem dưới) rồi đọc |
| Bài viết / blog | Có heading, đoạn văn mạch lạc | Đọc thẳng |
| Ghi chú / brief | Ngắn, gạch đầu dòng | Đọc thẳng |

### Dedupe transcript — đừng làm ẩu

Caption YouTube lặp theo **cửa sổ trượt**, chồng lấn *giữa chừng câu*, không phải
lặp nguyên dòng:

```
So, what was your old workflow like? So, what was your old workflow like? Like
before using AI tools, what was Like before using AI tools, what was Like before
using AI tools, what was your traditional workflow like?
```

Dedupe theo dòng **sẽ hỏng**. Phải khử chồng lấn ở mức cụm từ. Viết script cho
từng file (mẫu lặp mỗi nguồn mỗi khác), chạy, rồi **đọc lại vài đoạn ngẫu nhiên
của bản sạch để xác nhận không mất chữ** trước khi tin nó.

Giữ mốc `[m:ss]` để trích dẫn trong outline.

Ghi bản sạch ra scratchpad, **không** ghi đè file trong `docs/raw/`. Bản sạch phải
nhỏ hơn hẳn bản gốc — đọc bản sạch, đừng nạp bản gốc vào context.

## Chặng 2 — Outline (CỔNG 1)

Viết ra `docs/outline/<slug>.md`:

```markdown
---
nguồn: <URL gốc>
raw: docs/raw/<tên>.md
chuyên mục: <thư mục trong docs/book/>
trạng thái: chờ duyệt
---

# <Tiêu đề bài>

**Người đọc lấy được gì:** <một câu>

**Thuật ngữ cần chú thích:** <a · b · c>

## 1. <Tiêu đề mục>
**Ý chính:** <2-3 câu>
**Mốc trong raw:** [0:02], [4:12]
**Khối chữ:** <hint | expandable | stepper | tabs | columns | cards | không>
**Hình:** <loại> — "<mô tả hình>"   (hoặc: không cần hình)
```

**DỪNG LẠI.** Không viết bài khi user chưa duyệt.

User duyệt kiểu nào cũng được — gật trong chat, hoặc sửa thẳng vào file (đổi thứ
tự mục, đổi loại hình, gạch mục thừa). **Đừng bắt user tự sửa dòng YAML.** Khi họ
gật, *tôi* đổi `trạng thái` thành `đã duyệt` — trường đó là bản ghi cho phiên sau,
không phải nút bấm cho user vặn.

## Chặng 3 — Viết bài (CỔNG 2)

Ghi ra `docs/book/<chuyên-mục>/<slug>.md`, cập nhật `docs/book/SUMMARY.md`.

Chỗ nào có hình thì để placeholder rõ ràng, chưa chèn ảnh:

```markdown
<!-- HÌNH: compare — "Figma stop-motion vs Live code" -->
```

**DỪNG LẠI.** User đọc và sửa chữ trước. Chữ sửa rẻ, hình sửa đắt — chốt chữ xong
mới dựng hình.

## Chặng 4 — Dựng hình + tự kiểm

Đọc `references/visual-vocabulary.md` trước khi dựng.

**Làm từng hình một.** Không dựng cả 6 hình rồi mới kiểm — hỏng thì hỏng cả loạt.
Vòng lặp cho mỗi hình:

```
dựng trong gitbook.pen  →  xuất bản nháp 1x RA SCRATCHPAD
                        →  Read file PNG đó và NHÌN
                        →  đối chiếu checklist  →  sửa  →  xuất lại
                        →  sạch rồi mới xuất 2x vào assets/design/
```

Đọc cấu trúc bằng `get_app_state` **không đủ** — lỗi tràn chữ và sập layout chỉ
lộ ra khi nhìn ảnh thật. Bắt buộc phải `Read` file PNG.

Soi bản nháp ở **1x trong scratchpad**, không phải 2x: ảnh 2x rộng 2400px, đọc
vài vòng lặp cho vài hình là rất tốn. 1x vẫn đủ thấy tràn chữ, sập khung, lệch
hàng. Chỉ bản đã sạch mới xuất 2x vào `assets/design/`.

Giữ `placeholder: true` trên khung suốt lúc đang làm, bỏ ngay khi xong.

### Checklist — theo đúng các kiểu hỏng của .pen

1. **Chữ tràn hoặc không xuống dòng** — `textGrowth: "auto"` không bao giờ wrap.
   Muốn wrap phải là `fixed-width` hoặc `fixed-width-height`.
2. **Khung sập về 0** — parent `fit_content` mà mọi con `fill_container` là phụ
   thuộc vòng. Layout biến mất.
3. **Nội dung bị cắt** — frame `clip: true` nuốt luôn phần tràn, không lòi ra cho
   thấy. Phóng to frame cho vừa nội dung.
4. **Chữ vô hình** — text không có `fill` thì không hiện. Emoji cũng cần `fill`.
5. **Tương phản** — Obsidian trên Pumice/Limestone đạt tương phản cao, dùng thoải
   mái. **Sulfur là màu NỀN cho chữ Obsidian, không bao giờ là màu chữ** —
   Sulfur trên Limestone chỉ đạt ~1.1:1, vô hình. Obsidian trên Sulfur đạt ~15.8:1.
6. **Căn lề và khoảng cách** — có đều không, có lệch hàng không.
7. **Một Ember duy nhất** trong hình.
8. **Đúng loại hình** như outline đã chốt (đừng vẽ `flow` khi outline ghi `loop`).

Sửa thì **cập nhật node có sẵn**, đừng xoá đi dựng lại.

## CỔNG 3 — user duyệt hình

Tôi chỉ bắt được lỗi cơ học. **Cân đối thị giác, nhịp điệu, "trông sai sai" là mắt
của user** — họ là UI/UX designer, họ thấy thứ tôi không thấy.

Đưa ảnh cho user xem (`SendUserFile`) rồi mới chèn vào bài. Chỉ sau khi user gật
mới thay placeholder bằng `![alt](../../assets/design/<ID>.png)` và cập nhật
`assets/design/INDEX.md`.

---

## Luật bất di bất dịch

### Hai làn không lấn nhau

| | Dùng gì |
|---|---|
| **Hình minh hoạ** | Luôn dựng trong `gitbook.pen`. Không Mermaid, không ASCII art, không thư viện biểu đồ. |
| **Cấu trúc chữ** | Block dựng sẵn của GitBook. |

Lý do: hình phải giữ đúng bộ token thương hiệu, mà Mermaid render theo theme GitBook
nên mất hết. Đừng đề xuất lại Mermaid như cách "tiết kiệm công" — đã bị bác một lần.

### Tên file ảnh = ID khung vẽ

Pencil xuất file theo **ID node**, không theo tên khung. `P9bWlk.png` là địa chỉ trỏ
thẳng vào canvas — cầm tên file là mở đúng khung để sửa. **Không đổi tên ảnh.**

Ý nghĩa nằm ở **tên khung trong canvas** (`CNN - Card 1 Paradigm Shift`) và ở
`assets/design/INDEX.md`. Đặt tên khung tử tế, đừng đặt tên file.

### Văn phong

Viết dễ, chú thích thuật ngữ **tại chỗ**. Người ít kinh nghiệm phải đọc được mà
designer có nghề không thấy bị hạ thấp.

- Thuật ngữ nhỏ → giải thích ngay trong ngoặc giữa câu.
- 2-3 khái niệm cốt lõi của bài → một `{% hint %}` riêng.
- **Tối đa ~3 `{% hint %}` mỗi bài.** Trang đầy hộp màu trông như bảng điều khiển.
- Phần sâu mà người mới bỏ qua được → `{% expandable %}`.

### Block GitBook hay dùng

- `{% hint style="info|success|warning|danger" %}` — chú thích thuật ngữ, cảnh báo
- `{% expandable %}` — phần sâu, không bắt người mới đọc
- `{% stepper %}` + `{% step %}` — quy trình nhiều bước bằng chữ
- `{% tabs %}` + `{% tab %}` — nội dung song song cùng loại
- `{% columns %}` + `{% column width="50%" %}` — hai cột, trước/sau
- `<table data-view="cards">` — lưới thẻ điều hướng, dùng ở trang chuyên mục
- `{% embed url="..." %}` — nhúng video nguồn, đừng để link trần
- frontmatter: `description:`, `icon:`, `cover:`

### Mật độ hình — user quyết, không phải tôi

Trong outline, **đề xuất** hình cho mục nào ý có quan hệ *không gian* (song song,
vòng lặp, phân nhánh, vị trí trên màn hình) và ghi rõ mục nào tôi thấy không cần.

Nhưng đó chỉ là đề xuất. **User là UI/UX designer và cả dự án này xoay quanh việc
giải thích bằng hình** — họ muốn 100% số mục có hình thì đó là lựa chọn của họ,
không phải lỗi cần sửa. Đừng viện "kỷ luật thị giác" để ép giảm số hình.
