---
name: digest
description: Dùng khi user thả file vào docs/raw/, đưa transcript hoặc bài viết dài cần xử lý, yêu cầu viết bài cho GitBook, yêu cầu dựng infographic minh hoạ trong gitbook.pen, hoặc yêu cầu sửa một bài đã xuất bản trên GitBook.
---

# Digest — từ bài thô sang bài GitBook

**Chạy một mạch, không cổng duyệt.** User thả file vào `docs/raw/` là chạy thẳng
tới bài live trên GitBook. Họ đọc và sửa trên GitBook sau — đó là nơi họ muốn
review, nên dừng giữa chừng chỉ làm chậm.

```
docs/raw/<tên>.md                   [1] Dọn & đọc
        ↓
docs/outline/<slug>.md              [2] Outline — ghi file + dán vào chat, KHÔNG chờ
        ↓
docs/book/<mục>/<slug>.md           [3] Viết bài & Dựng hình + tự kiểm (song song)
        ↓
git push → CR → merge               [4] Xuất bản
        ↓
Bài live trên GitBook + INDEX.md
```

### Quyền đã được uỷ trước

User đã uỷ quyền cho toàn bộ luồng này: **`git push` lên repo public và `merge`
change request mà không cần hỏi lại**. Không hỏi "có push không", "có merge không".

Hai chỗ **vẫn phải dừng lại hỏi**:

- `git status` cho thấy thứ lạ trong working tree không liên quan tới bài đang làm.
- Vòng tự kiểm hình đã sửa 3 lần mà vẫn không sạch — hỏi, đừng lặp vô hạn.

### Bù lại cho việc không có cổng

Không có người kiểm giữa chừng, nên:

- **Dán dàn ý vào chat ngay khi có**, trước khi dựng hình. User thấy sớm thì chặn
  lại được nếu cấu trúc sai — thấy mà không phải bấm.
- **Vòng tự kiểm ở Chặng 3 giờ là lưới an toàn duy nhất.** Không được bỏ, không
  được rút gọn. Trước đây còn mắt user đỡ cho; giờ thì không.
- Cấu trúc sai nghĩa là 5-6 hình dựng xong mới lộ. Đó là cái giá đã biết trước của
  việc chạy thẳng, không phải lý do để tự ý dựng lại cổng.

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

## Chặng 2 — Outline (bản ghi, không phải cổng)

Outline **không chờ duyệt**. Nó có hai việc: giúp tôi định cấu trúc trước khi viết,
và cho user một cơ hội chặn sớm nếu tôi hiểu sai.

| Raw | Làm gì |
|---|---|
| Dài, rối (transcript, bài >3000 từ) | Ghi outline đầy đủ ra file, **dán vào chat**, rồi chạy tiếp ngay |
| Ngắn, đã có cấu trúc (brief, ghi chú) | Bỏ qua outline, viết thẳng |

Dán dàn ý vào chat **trước khi bắt đầu dựng hình** — đó là lúc chặn còn rẻ. Dán
xong là chạy tiếp, không đợi trả lời.

Viết ra `docs/outline/<slug>.md`:

```markdown
---
nguồn: <URL gốc>
raw: docs/raw/<tên>.md
chuyên mục: <thư mục trong docs/book/>
---

# <Tiêu đề bài>

**Người đọc lấy được gì:** <một câu — sẽ HỌC được gì, không phải đáp án là gì>

**Điểm đáng chú ý:** <1-2 điều người đọc dễ lướt qua nhưng thực ra quan trọng>

**Thuật ngữ cần chú thích:** <a · b · c>

## 1. <Tiêu đề mục>
**Ý chính:** <2-3 câu>
**Mốc trong raw:** [0:02], [4:12]
**Khối chữ:** <bảng | hint | details | stepper | columns | không>
**Hình:** <loại> — "<mô tả hình>"   (hoặc: không cần hình)
```

Dán dàn ý vào chat rồi chạy tiếp ngay. User chen vào sửa thì nhận sửa và làm lại
từ chặng 3.

## Chặng 3 — Viết bài & Dựng hình (Chạy song song)

Sau khi dán Outline vào chat, lập tức tiến hành viết bài và dựng hình song song mà không cần dừng lại ngắt quãng:

1. **Viết bài**: Ghi ra `docs/book/<chuyên-mục>/<slug>.md`, cập nhật `docs/book/SUMMARY.md`. Chỗ có hình để placeholder `<!-- HÌNH: <loại> — "<tên>" -->`.
2. **Dựng hình**: Dựng từng hình trong `gitbook.pen`, tự kiểm lỗi cơ học qua ảnh nháp 1x trong scratchpad.
3. Khi hình sạch lỗi cơ học: xuất PNG 2x vào `assets/design/<ID>.png`, thay placeholder trong bài bằng `![alt](../../assets/design/<ID>.png)` và cập nhật `assets/design/INDEX.md`.

> Đường dẫn tương đối này **chỉ dành cho bản nháp đọc cục bộ**. Bản lên GitBook
> dùng `./<ID>.png` trỏ vào `ref` của `insert_files` — xem Chặng 4. Hai bản khác
> nhau là bình thường, không cần đồng bộ.

### Quy trình dựng hình + tự kiểm trên Canvas

Đọc `references/visual-vocabulary.md` trước khi dựng. Chọn chế độ layout (flexbox hoặc `layout: "none"` + toạ độ) trước khi đặt node đầu tiên.

**Làm từng hình một.** Không dựng cả loạt rồi mới kiểm. Vòng lặp cho mỗi hình:

```
dựng trong gitbook.pen  →  xuất bản nháp 1x RA SCRATCHPAD
                        →  Read file PNG đó và NHÌN
                        →  đối chiếu checklist  →  sửa  →  xuất lại
                        →  sạch rồi mới xuất 2x vào assets/design/
```

Đọc cấu trúc bằng `get_app_state` **không đủ** — lỗi tràn chữ và sập layout chỉ lộ ra khi nhìn ảnh thật. Bắt buộc phải `Read` file PNG.

### Checklist Canvas — tránh các lỗi đặc thù của Pencil

1. **Không dùng `alignSelf` trên frame** — Pencil không hỗ trợ thuộc tính `alignSelf` cho container/frame, sẽ gây lỗi validation schema.
2. **Chuẩn hóa tên icon Lucide** — Luôn dùng tên hiện đại: `triangle-alert` (thay vì `alert-triangle`), `circle-check` (thay vì `check-circle`), `lock-open` (thay vì `unlock`), v.v.
3. **Chữ tràn hoặc không xuống dòng** — Text mô tả bắt buộc dùng `textGrowth: "fixed-width"` và `width: "fill_container"` (hoặc pixel cố định). `auto` không bao giờ wrap.
4. **Khung sập về 0** — Parent `fit_content` mà mọi con `fill_container` là phụ thuộc vòng. Layout biến mất.
5. **Nội dung bị cắt** — Frame `clip: true` nuốt luôn phần tràn. Mở rộng kích thước frame cho vừa nội dung.
6. **Chữ vô hình** — Text không có `fill` thì không hiện.
7. **Tương phản chuẩn** — Obsidian trên Pumice/Limestone đạt tương phản cao. **Sulfur là màu NỀN cho chữ Obsidian, không bao giờ là màu chữ**.
8. **Ember có đang đánh dấu thứ quan trọng nhất không** — cần tới hai chỗ Ember
   thì dừng lại tự hỏi hình có đang làm hai việc. Hỏi, không phải cấm; cặp đối
   nhau dùng Ember / Violet là hợp lệ.
9. **Hình dạng có khớp cấu trúc của ý không** — ý là vòng lặp mà vẽ bốn thẻ thẳng
   hàng không mũi tên thì hình đã hỏng, dù từng thẻ đều đẹp. Bảy loại trong
   `visual-vocabulary.md` là **bộ khởi điểm mở**, không phải bảng tra cố định —
   ý có dạng khác thì vẽ dạng đó rồi thêm vào từ điển.
10. **Toạ độ có bám lưới không** — bội của 4, hộp cùng hàng dùng chung `y` và `h`,
    mũi tên bám điểm neo tính sẵn chứ không đặt bằng mắt.
11. **Có phải cái gì cũng bọc thẻ không** — khung chỉ dùng khi có vai trò cấu trúc.
12. **Phép thử đúc kết** (đọc "Chức năng của hình" trong `visual-vocabulary.md`
    trước khi dựng) — với từng thẻ/node, che phần chi tiết đi, chỉ đọc nhãn +
    tiêu đề + hàng kết: có phải một kết luận trọn vẹn không? Lớp đúc kết này phải
    là chữ **to nhất** trong thẻ — canh cỡ chữ cho nó trước, phần chi tiết được
    phép nhỏ hơn.
13. **Có gạch đầu dòng nào chứa số liệu/tỷ lệ/so sánh độ lớn mà đang viết bằng
    chữ thuần không?** (đọc "Mã hoá bằng hình dạng" trong `visual-vocabulary.md`)
    Vẽ được bằng thanh tỷ lệ, donut, hoặc kích thước tương ứng thì vẽ, đừng để
    chữ gánh việc mà hình dạng làm nhanh hơn.

## Chặng 4 — Xuất bản

Hình đã qua vòng tự kiểm và bài đã viết xong thì xuất bản luôn, không chờ user
xác nhận (xem "Quyền đã được uỷ trước" ở đầu file). Chạy đúng thứ tự dưới. **Không đảo bước 1 xuống sau** —
GitBook tải ảnh từ URL công khai, chưa push thì URL chưa tồn tại.

```bash
git add assets/design/<ID>.png docs/book/<mục>/<slug>.md
git commit -m "..."
git push
git rev-parse HEAD          # lấy SHA cho bước 3
```

**Mỗi lần xuất bản là một lần `git push` lên repo public.** Chạy `git status`
trước; thấy thứ gì lạ trong working tree thì hỏi user, đừng push âm thầm.

2. `create_change_request` trên space đích.

3. `updateChangeRequestContent` — **một batch duy nhất** (tối đa 50 thay đổi),
   truyền `compat=false`:

```json
{
  "changes": [
    { "operation": "insert_files",
      "files": [
        { "ref": "<ID>.png", "name": "<ID>.png",
          "url": "https://raw.githubusercontent.com/trandat142/pen.dev/<SHA>/assets/design/<ID>.png" }
      ] },
    { "operation": "insert_page",
      "document": { "markdown": "# Tiêu đề\n\n![Mô tả](./<ID>.png)\n" } }
  ]
}
```

`ref` phải **duy nhất trong batch**; trang tham chiếu ảnh bằng `./<ref>` và
GitBook giải đúng bất kể thứ tự thao tác trong batch.

4. `submit_or_merge_change_request` → trả link bài live cho user.

### Nguồn ảnh — GitHub raw, cấm host trung gian

**Không bao giờ** đẩy ảnh qua Catbox, imgur, transfer.sh hay bất kỳ dịch vụ nào
khác. Repo `trandat142/pen.dev` đã **public**, nên `raw.githubusercontent.com` là
URL công khai sẵn có — thêm một host nữa chỉ tăng độ trễ, thêm điểm hỏng, và tốn
token vô ích.

**Dùng commit SHA trong URL, không dùng `main`.** Tên ảnh là node ID nên xuất lại
sẽ ghi đè đúng đường dẫn cũ; URL theo `main` có thể dính cache và trả về bản cũ.
URL theo SHA là bất biến.

GitBook **tải bytes về và lưu vào Cloud Storage của nó**, nên ảnh cuối cùng sống
trên CDN GitBook — xoá file khỏi repo sau đó không ảnh hưởng bài live. Đây chính
là lý do phải qua `insert_files` thay vì nhúng thẳng URL GitHub vào bài: nhúng
thẳng là hotlink, bài sẽ vỡ khi dọn repo.

**Dự phòng** khi không push được (repo chuyển private, GitHub lỗi): `insert_files`
cũng nhận `base64`, trần 1MB — ảnh hiện tại 236-316KB nên vừa. Nhưng nó đốt
context và dễ hỏng, chỉ dùng khi hết cách.

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

**Luôn xuất tiếng Việt**, dù nguồn là tiếng gì — kể cả tiêu đề mục và chú thích hình.

- Thuật ngữ nhỏ → giải thích ngay trong ngoặc giữa câu.
- Khái niệm cốt lõi → một `{% hint %}` riêng.
- Phần sâu mà người mới bỏ qua được → `<details><summary>`.

Không có hạn mức số hint. Nguyên tắc: **hint phải đủ hiếm để còn có nghĩa.** Bài
cần 5 chú thích thì cứ 5 — nhưng nếu mỗi đoạn một hộp màu thì hộp không còn báo
hiệu gì nữa, lúc đó chuyển bớt xuống ngoặc giữa câu.

### Hai khối bắt buộc trong bài

**Dòng dẫn** — ngay dưới tiêu đề, **một dòng**, lấy từ `Người đọc lấy được gì`
trong outline. Nói người đọc sẽ *học được gì*, không nói *đáp án là gì*. Đây là
để người mới quyết định bài này có dành cho mình không, không phải để thay bài.

**Điểm đáng chú ý** — 1-2 điều người đọc dễ lướt qua nhưng thực ra quan trọng.
Đặt sau phần mở hoặc cuối bài, tuỳ bài.

Khối thứ hai là **ô bắt buộc duy nhất không template hoá được** — muốn viết được
thì phải thực sự nghĩ riêng về bài đó. Nếu thấy mình đang viết một câu có thể dán
sang bài khác mà vẫn đúng, thì chưa tìm ra điểm đáng chú ý thật.

### Chữ quanh hình — dẫn nhập và mở rộng, không diễn giải lại

Đẩy nội dung vào hình càng nhiều càng tốt (xem "Chức năng của hình" trong
`visual-vocabulary.md`). Chữ quanh hình chỉ làm hai việc:

- **Dẫn nhập** — mở bối cảnh trước khi vào hình, không nhắc chi tiết hình sắp nói.
- **Mở rộng** — thêm case study dài, số liệu, ngoại lệ, lý do sâu mà hình không có
  chỗ chứa.

**Không được** diễn giải lại bằng văn xuôi những gì hình đã liệt kê. Nếu một câu
trong bài có thể đổi vài từ để thành câu trong hình (hoặc ngược lại), một trong
hai câu đó thừa — giữ bản trong hình, cắt hoặc viết lại câu trong bài thành thông
tin mới.

### Ví dụ đời thường — có giới hạn

Khái niệm **thật sự xa lạ với designer** (cơ chế bên trong Git, session/cookie,
cách trình duyệt render) → kèm một phép so sánh đời thường.

Khái niệm designer đã biết một nửa (prototype, handoff, design token, component)
→ **đừng** ví von. Với người có nghề nó thành kẻ cả, và phép so sánh sai còn cài
mô hình sai vào đầu người mới, khó gỡ hơn là không có gì.

### Checklist chữ — đối chiếu trước khi xuất bản

1. **Có dòng dẫn chưa**, và nó nói "sẽ học được gì" chứ không spoil đáp án?
2. **Điểm đáng chú ý có đặc thù cho bài này không** — dán sang bài khác có còn
   đúng không? Còn đúng nghĩa là chưa đạt.
3. **Thuật ngữ nào xuất hiện lần đầu mà chưa được chú thích?** Rà từ trên xuống.
4. **Bộ khối có đang lặp lại bài trước không** — nếu bài nào cũng đúng 2 hint,
   2 column, 3 step thì đó là phản xạ, không phải lựa chọn theo nội dung.
5. **Đoạn chữ quanh mỗi hình có đang diễn giải lại hình không?** Đổi vài từ mà
   thành câu trong hình thì đó là paraphrase, phải cắt hoặc đổi thành thông tin
   mới (case study, số liệu, ngoại lệ, lý do sâu).

### Định dạng bài viết — Tối giản, không râu ria

1. **Tiêu đề sạch**: `# <Tiêu đề bài viết>` — tuyệt đối không gắn icon hoặc emoji.
2. **Frontmatter tối giản**: Chỉ chứa duy nhất `description: <tóm tắt 1-2 câu>`. Không dùng `icon:`, không dùng `cover:`.
3. **Không tạo block metadata phỏng vấn**: Không tạo hộp thông tin "Nhân vật / Kênh / Host / Chủ đề" ở đầu bài. Đi thẳng vào vấn đề.
4. **Không nhúng YouTube**: Bỏ hoàn toàn cú pháp `{% embed url="..." %}`.

### Repo là nơi soạn — GitBook mới là bản thật

**Nguồn sự thật nằm trên GitBook, không nằm trong repo.**

| | Vai trò |
|---|---|
| `docs/book/*.md` | Bản nháp để soạn và đọc cục bộ |
| `docs/book/SUMMARY.md` | Mục lục nháp nội bộ — **không phải** nav thật của site; vị trí trang quyết định lúc xuất bản |
| `assets/design/*.png` | Bản lưu trung gian; xoá khỏi repo không ảnh hưởng bài live |
| GitBook | **Bản thật.** Ảnh nằm trên CDN GitBook, độc lập với repo |

**Bản repo và bản live sẽ khác nhau** — rõ nhất là đường dẫn ảnh: repo dùng
`../../assets/design/<ID>.png` để đọc cục bộ, bản live dùng URL CDN do
`insert_files` sinh ra. **Đây là bình thường, không phải lỗi cần đồng bộ.**

### Sửa bài đã xuất bản — đọc từ GitBook trước

Bản trong repo có thể đã cũ (user sửa thẳng trên GitBook, hoặc bài đã qua nhiều
Change Request). Khi được yêu cầu sửa một bài **đã xuất bản**:

1. **Đọc bản live qua GitBook MCP** (`get_page`) — đó mới là nội dung thật.
2. Soạn bản sửa dựa trên bản live, không dựa trên file trong `docs/book/`.
3. Xuất bản qua Change Request như thường.

Đừng giả định file trong repo khớp với bài trên site.

### Block GitBook hay dùng

- **Bảng Markdown thường** — so sánh, tra cứu, thông số. Khối hay cần nhất. Bảng
  là **dữ liệu**, không phải minh hoạ, nên không phạm luật hai làn. Đừng đẩy mọi
  so sánh sang vẽ hình `compare`: bảng tìm kiếm được, copy được, tự co trên mobile.
- `{% hint style="info|success|warning|danger" %}` — chú thích thuật ngữ, cảnh báo
- `<details><summary>` — phần sâu, không bắt người mới đọc. **Dùng thẻ này, KHÔNG dùng
  `{% expandable %}`** — đã thử trên site thật và nó không render (commit `718a48d`
  phải thay lại bằng `<details>`).
- ` ```<ngôn ngữ> title="..." ` — code block có nhãn. Nội dung dự án này rất kỹ
  thuật (lệnh Cursor, `.cursorrules`, nhánh Git, session PHP); đừng để đoạn lệnh
  nằm trần không nhãn.
- `{% content-ref url="..." %}` — liên kết sang bài khác, hiện ra dạng thẻ bấm được.
  Dự án có nhiều loạt bài; đây là thứ biến một đống bài rời thành một cuốn sách.
- `{% stepper %}` + `{% step %}` — quy trình nhiều bước bằng chữ
- `{% columns %}` + `{% column width="50%" %}` — hai cột, trước/sau
- frontmatter: chỉ dùng `description:`

**Cảnh báo `{% columns %}`** — trên điện thoại hai cột tự xếp chồng thành trên/dưới,
mất ý "đối nhau". Hai cột là vừa; ba cột chật, đừng dùng.

### `{% tabs %}` — mặc định KHÔNG dùng

Tab **giấu nội dung**, và nó giả định người đọc đã biết mình thuộc nhánh nào.
Đó là tiện nghi cho người có nghề — trong khi dự án này viết cho cả người ít kinh
nghiệm, những người **không biết tab nào là của mình** cho tới khi đọc hết.

Nội dung ở đây là bài giảng giải đọc tuần tự, gần như không có ca "chọn một nhánh
rồi bỏ qua phần còn lại". Còn chỗ trông *có vẻ* hợp tab thì lại là chỗ tab phá
hoại nhất: ba biến thể A/B/C — cả điểm của đoạn là nhìn chúng **cạnh nhau**.

Chỉ dùng khi thoả **cả hai**: người đọc thật sự chỉ cần một nhánh, **và** các
nhánh loại trừ nhau (cài trên macOS *hoặc* Windows). Không thoả cả hai thì dùng
bảng, cột, hoặc để thẳng hàng dọc.

> **Tab khi người đọc chọn MỘT. Bảng hoặc cột khi người đọc cần THẤY CẢ.**

**Không dùng:** `{% updates %}` (changelog), `{% include %}`, `.gitbook/vars.yaml`,
`{% if visitor %}` — chưa đủ quy mô để đáng. `<table data-view="cards">` để dành
cho trang chủ chuyên mục, chưa cần.

### Mật độ hình — user quyết, không phải tôi

Trong outline, **đề xuất** hình cho mục nào ý có quan hệ *không gian* (song song,
vòng lặp, phân nhánh, vị trí trên màn hình) và ghi rõ mục nào tôi thấy không cần.

Nhưng đó chỉ là đề xuất. **User là UI/UX designer và cả dự án này xoay quanh việc
giải thích bằng hình** — họ muốn 100% số mục có hình thì đó là lựa chọn của họ,
không phải lỗi cần sửa. Đừng viện "kỷ luật thị giác" để ép giảm số hình.
