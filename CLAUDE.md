# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository is dedicated to visual design workflows, assets generation, and sync pipelines between **pen.dev** (Pencil MCP design canvas) and **GitBook** documentation.

## Architecture & Workflow

- **Design Canvas (`*.pen`)**: Encrypted `.pen` files (such as `gitbook.pen`) managed via Pencil MCP tools (`mcp__pencil__execute`, `mcp__pencil__get_app_state`, etc.). Never read or edit `.pen` files directly with text tools.
- **Exported Visual Assets (`assets/design/`)**: PNG exported graphics and infographics generated from the canvas (default format: PNG at 2x scale). Kept strictly intact for backwards-compatibility with existing documentation links.
- **Documentation (`docs/`)**:
  - `docs/raw/`: Raw input notes, briefs, and source materials provided by user.
  - `docs/book/`: Published Markdown content structured for GitBook (including `SUMMARY.md` navigation).

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
- **Standard Artboard Dimensions**: `1200 x 675 px` (16:9 ratio, exported at 2x scale, default format: PNG).
