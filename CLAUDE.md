# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A static, dependency-free Chinese-language site teaching options mechanics and pricing. Each page is a single self-contained `.html` file with inline `<style>` and `<script>`. No build step, no package manager. The only external runtime dependency is Google Fonts.

## Run

Open any `.html` directly in a browser. Or serve locally:

```powershell
python -m http.server 8000   # then visit http://localhost:8000/
```

There are no tests, no lint, no build.

## Architecture

Two distinct page families — know which you're editing before changing anything:

1. **Core modules + index** (`index.html`, `01-call-put.html` … `08-strategies.html`, `strategy-system.html`) share a common foundation that is **copy-pasted inline into each file**:
   - A `:root` CSS design-token block (colors, fonts, shadows) plus a full shared stylesheet.
   - A `window.OA` JavaScript library (IIFE) providing:
     - Math: `OA.bs(type,S,K,T,r,sig,q)` Black-Scholes price + Greeks (theta/day, vega/rho per 1%), `OA.impliedVol(...)` via bisection, `OA.ncdf`/`OA.ndf`, `OA.fmt`.
     - Rendering: `OA.chart(canvas,opts)` a canvas line-chart engine, `OA.sample(a,b,n,fn)`.
     - UI helpers: `OA.slider`, `OA.seg` (segmented control), `OA.quiz`, `OA.classify` (pointer-based drag-to-bucket).
   - Per-page logic lives in a second `<script>` block near the end of the file.

2. **Standalone pages** (`delta.html`, `gamma.html`, `theta.html`, `vega.html`, `rho.html`, `iv-hv-vega-theta.html`) do **not** use `OA`. Each is fully independent with its own inline styles and scripts.

### The duplication rule (most important)

The design tokens, shared CSS, and `OA` library are **duplicated**, not imported, across the 10 core/index files. There is no shared `.css` or `.js`. A change to a design token, a shared component style, or any `OA` function must be **propagated by hand to every file that contains a copy** (the 9 files matching `window.OA =`). Don't assume editing one file updates the others.

## Conventions

- **Color semantics (A-share 红涨绿跌):** `--up` red = profit / price up; `--down` green = loss / price down; `--call` blue = Call; `--put` orange = Put. Use these CSS vars rather than literal hex values.
- **Language:** UI copy is Simplified Chinese; option terminology and Greek letters stay in English (Delta, Theta, Call, Put, ITM/ATM/OTM, Black-Scholes).
- **Self-contained pages:** keep everything inline. Don't introduce external scripts, bundlers, or a shared asset file — the offline-openable single-file model is intentional.
- Pricing is the idealized Black-Scholes model; content is educational only, not investment advice.
