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

Transcript YouTube tự động thường lặp mỗi câu 2-3 lần (rác caption). Dọn trước khi
đọc, đừng đọc bản rác. Giữ mốc thời gian `[m:ss]` để trích dẫn trong outline.

Ghi bản sạch ra scratchpad, **không** ghi đè file trong `docs/raw/`.

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

**DỪNG LẠI.** Không viết bài khi `trạng thái` chưa là `đã duyệt`.
User sửa file trực tiếp — đổi thứ tự mục, đổi loại hình, gạch mục thừa.

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
dựng trong gitbook.pen  →  xuất PNG  →  Read chính file PNG đó và NHÌN
                                     →  đối chiếu checklist  →  sửa  →  xuất lại
```

Đọc cấu trúc bằng `get_app_state` **không đủ** — lỗi tràn chữ và sập layout chỉ
lộ ra khi nhìn ảnh thật. Bắt buộc phải `Read` file PNG.

Giữ `placeholder: true` trên khung suốt lúc đang làm, bỏ ngay khi xong.

### Checklist — theo đúng các kiểu hỏng của .pen

1. **Chữ tràn hoặc không xuống dòng** — `textGrowth: "auto"` không bao giờ wrap.
   Muốn wrap phải là `fixed-width` hoặc `fixed-width-height`.
2. **Khung sập về 0** — parent `fit_content` mà mọi con `fill_container` là phụ
   thuộc vòng. Layout biến mất.
3. **Nội dung bị cắt** — frame `clip: true` nuốt luôn phần tràn, không lòi ra cho
   thấy. Phóng to frame cho vừa nội dung.
4. **Chữ vô hình** — text không có `fill` thì không hiện. Emoji cũng cần `fill`.
5. **Tương phản** — Obsidian trên Pumice/Limestone thì ổn; Sulfur trên Limestone
   thì không đọc được.
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

### Kỷ luật

- **Không phải mục nào cũng cần hình.** Chỉ vẽ khi ý có quan hệ *không gian* —
  song song, vòng lặp, phân nhánh. Mục chỉ liệt kê thì để gạch đầu dòng.
- Bài CNN hiện tại có 6/6 mục đều có hình. Tỷ lệ đó quá cao; khi mọi thứ đều được
  minh hoạ thì không gì nổi bật.
