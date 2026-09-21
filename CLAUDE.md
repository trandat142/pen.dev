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
  - `docs/book/`: Published Markdown content structured for GitBook (including `SUMMARY.md` navigation).

Turning a raw file into a published article is the **`digest` skill** (`.claude/skills/digest/`). Invoke it whenever the user drops a file into `docs/raw/`, hands over a transcript, or asks for an article or an infographic.

## Two Lanes — never mixed

- **Illustrations** are always built in `gitbook.pen` via Pencil MCP. Never substitute Mermaid, ASCII art, or any charting library — they lose the brand tokens.
- **Text structure** uses GitBook's native blocks (`{% hint %}`, `{% expandable %}`, `{% stepper %}`, `{% tabs %}`, `{% columns %}`, `<table data-view="cards">`, `{% embed %}`).

## Asset Naming

Pencil exports by **node ID**, not frame name — `P9bWlk.png` is a direct address into the canvas. **Never rename an exported asset.** Meaning belongs in the frame name inside the canvas and in `assets/design/INDEX.md`.

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
- **Accent semantics**: Ember marks the single most important element (one per image only); Plasma Violet marks alternatives and secondary branches; Sulfur marks labels and numbered callouts.

See `.claude/skills/digest/references/visual-vocabulary.md` for the seven visual types and their dimensions.
