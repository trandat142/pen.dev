# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository is dedicated to visual design workflows, assets generation, and sync pipelines between **pen.dev** (Pencil MCP design canvas) and **GitBook** documentation.

## Architecture & Workflow

- **Design Canvas (`*.pen`)**: Encrypted `.pen` files (such as `gitbook.pen`) managed via Pencil MCP tools (`mcp__pencil__execute`, `mcp__pencil__get_app_state`, etc.). Never read or edit `.pen` files directly with text tools.
- **Exported Visual Assets (`assets/design/`)**: PNG exported graphics and infographics generated from the canvas (default format: PNG at 2x scale). Kept strictly intact for backwards-compatibility with existing documentation links.
- **Documentation (`docs/`)**:
  - `docs/raw/`: Raw input notes, briefs, and source materials provided by user.
  - `docs/outline/`: Approval gate between raw and published. Never write an article while an outline's `trạng thái` is not `đã duyệt`.
  - `docs/book/`: **Drafts only.** GitBook is the source of truth, not this repo — the published page and the local copy are expected to diverge (image URLs especially). `SUMMARY.md` is a local draft index, not the live navigation. To edit an already-published article, read the live version through the GitBook MCP first; never assume the repo copy is current.

Turning a raw file into a published article is the **`digest` skill** (`.claude/skills/digest/`). Invoke it whenever the user drops a file into `docs/raw/`, hands over a transcript, or asks for an article or an infographic.

## Two Lanes — never mixed

- **Illustrations** are always built in `gitbook.pen` via Pencil MCP. Never substitute Mermaid, ASCII art, or any charting library — they lose the brand tokens. Never use `alignSelf` on frames. Use modern Lucide icon names (`triangle-alert`, `circle-check`, `lock-open`). Always set `textGrowth: "fixed-width"` and `width: "fill_container"` on descriptive text.
- **Text structure** uses GitBook's native blocks (`{% hint %}`, `{% expandable %}`, `{% stepper %}`, `{% tabs %}`, `{% columns %}`). No title icons/emojis, no interview metadata box, no YouTube embeds. Frontmatter only contains `description:`. Images are uploaded to GitBook Cloud Storage independently.

## Asset Naming

Pencil exports by **node ID**, not frame name — `P9bWlk.png` is a direct address into the canvas. **Never rename an exported asset.** Meaning belongs in the frame name inside the canvas and in `assets/design/INDEX.md`.

## Publishing Images to GitBook

Commit and push the PNG first, then pass its **GitHub raw URL pinned to the commit SHA** (`raw.githubusercontent.com/trandat142/pen.dev/<sha>/assets/design/<ID>.png`) as the `url` of an `insert_files` change. GitBook fetches the bytes into its own Cloud Storage, so the published image survives any later cleanup of the repo.

**Never route images through a third-party host** (Catbox, imgur, transfer.sh, …). The repo is public, so a GitHub raw URL is already publicly reachable — an extra hop only adds latency and failure modes. Equally, never hotlink the GitHub raw URL from the article itself: that makes the published page depend on the repo forever.

## Design Tokens & Styling Conventions

When generating designs for the documentation:
- **Base Canvas**: Pumice (`#e2e2df`)
- **Card/Surface**: Limestone (`#f7f6f2`)
- **Primary Text & Borders**: Obsidian (`#070607`)
- **Primary Accent**: Ember (`#fc5000`)
- **Secondary Accent**: Plasma Violet (`#524ae9`)
- **Tag/Highlight**: Sulfur (`#f5f28e`)
- **Typography**: Momo Trust Sans for both Display Headings and Body/Controls.
- **Iconography**: Lucide Icons / Phosphor Icons (clean vector SVG paths or semantic SVG components).
- **Artboard Width**: always `1200 px` (fits the GitBook column). **Height varies by visual type** — do not force 16:9. Exported at 2x scale, default format: PNG.
- **Accent semantics**: Ember marks the most important element; Plasma Violet marks alternatives, secondary branches, and the opposing half of a pair; Sulfur is a **background** behind Obsidian text (tags, numbered callouts) — never a text colour.

See `.claude/skills/digest/references/visual-vocabulary.md` for the seven visual types and their dimensions.
