# Quality Checklist

Design review workflow for Phase 4: verify the script + storyboard + visual design spec satisfy the style guide and visual principles. This skill produces no audio and no rendered video — review is performed against the written design documents, not by running code or rendering frames.

## Table of Contents

- [Quality Checklist](#quality-checklist)
  - [Table of Contents](#table-of-contents)
  - [Step 1: Spec Compliance Review](#step-1-spec-compliance-review)
  - [Step 2: Visual Principle Review](#step-2-visual-principle-review)
  - [Step 3: Revise](#step-3-revise)
  - [Step 4: Sign-Off](#step-4-sign-off)
  - [Report Format](#report-format)
  - [Appendix: Style Check Rules](#appendix-style-check-rules)

---

Execute the following review workflow during SKILL.md Phase 4. All checks are performed by reading the design documents (script, storyboard, `constants.ts`/`theme.ts` tokens, component sketches, and any spec illustrations) — no scripts are run and no frames are rendered.

## Step 1: Spec Compliance Review

Read the visual design spec and verify every declared value against the [Style Check Rules](#appendix-style-check-rules) below. Work through the spec file by file:

- Extract the project color palette from `style-guide.md` and `constants.ts`/`theme.ts` (hex colors + black/white exemptions)
- Read each component sketch / scene spec and check its declared values against the rules
- Record findings by severity (🔴Critical / 🟡Important / 🟢Minor)
- Fail the review if any 🔴Critical issues are found

**Check Items:**

| Check Item | What to Verify in the Spec | Rule Source |
|------------|----------------------------|-------------|
| Font size | `fontSize: N` values in text components | [§1 Font Size Rules](#1-font-size-rules-1920×1080-canvas) |
| Colors | Hex values against the approved palette | [§2 Palette (Dynamic Extraction)](#2-palette-dynamic-extraction) |
| Safe zones | left/top/right/bottom values | [§3 Safe Zones](#3-safe-zones-1920×1080-canvas) |
| Spacing | padding/margin/gap values | [§4 Spacing Rules](#4-spacing-rules) |
| Element size | `size` prop and composite element heights | [§5 Element Sizing](#5-element-sizing) |
| Stroke/radius | strokeWidth, borderRadius | [§5](#5-element-sizing)-[§6](#6-corner-radius) |
| Animation patterns | Animation declared via useCurrentFrame/spring/interpolate, not CSS/keyframes | [§7 Animation Patterns](#7-animation-patterns-remotion-projects) |
| Layout conflicts | Non-subtitle text with bottom ≥ 850 | [§8 Layout Regions](#8-layout-regions-1920×1080-canvas) |

> ✅ **Checkpoint**: Update PROGRESS.md — mark `[x] Round 1: spec compliance review` and record Critical/Important/Minor counts.

## Step 2: Visual Principle Review

Review the storyboard and any spec illustrations against the visual principles. This step catches issues that value-by-value spec review cannot: composition, hierarchy, illustration quality, and content fill. Read each storyboard frame description (and any embedded SVG/illustration sketches) and evaluate against the table below.

**Steps:**

1. **Enumerate storyboard frames**: List every frame described in the storyboard, keyed by scene and beat (e.g., `scene-hook-f0`, `scene-hook-f1`). For each, note the intended visual content, layout, and the script beat it illustrates.

2. **Analyze each frame against the visual principles**:

   Read the storyboard entry and any referenced SVG/illustration sketch for each frame and evaluate:

   | Check Item | What to Check | Severity |
   |------------|---------------|----------|
   | Overall aesthetics | Is the frame clean, professional, visually appealing, matching the Kurzgesagt-style flat-geometric aesthetic | 🔴Critical |
   | Visual balance | Is the composition balanced, whitespace reasonable, elements well-distributed | 🔴Critical |
   | Color harmony | Is the color scheme coordinated, colors pleasing to the eye, no jarring combinations | 🔴Critical |
   | Visual hierarchy | Is the main subject prominent, information hierarchy clear, focus guided properly | 🔴Critical |
   | Text readability | Is text clear and readable, font size adequate, contrast sufficient | 🔴Critical |
   | Element overlap | Is text obscured, elements improperly overlapping | 🔴Critical |
   | **Visual richness** | **Does the scene have non-text visual content (SVG illustrations, charts, animated graphics)? Scenes with only text labels in colored boxes are PPT-like and must be redesigned** | 🔴Critical |
   | **Illustration quality** | **Do SVG illustrations use gradients, rounded corners, and layered shapes (Kurzgesagt style)? Plain solid-fill rectangles with text are not acceptable** | 🔴Critical |
   | Safe zones | Is key content cropped or too close to edges | 🟡Important |
   | Icon appropriateness | Do icons match content, appropriate size, consistent style | 🟡Important |
   | Animation reasonableness | Is the declared animation smooth, rhythm matches content, aids understanding | 🟡Important |
   | **Ambient atmosphere** | **Does the scene have ambient effects (particles, glow, grain, subtle motion)? Completely static backgrounds feel flat** | 🟡Important |
   | **Element sizing adequacy** | **Are icons, flow nodes, charts, and other key visual elements large enough on screen? Content occupying ≤30% of the canvas = "Thumbnail Syndrome"** | 🔴Critical |
   | **Visual-script sync** | **Do visual elements (arrows, diagrams, icons) appear on the same beat as their corresponding script line? Elements appearing more than ~10 frames (0.33s) before the script beat = desync** | 🔴Critical |

3. **Generate visual report**: For each issue found, include:
   - Storyboard frame key and beat number
   - Problem area description (e.g., "text in bottom-left obscured by arrow")
   - Corresponding spec file / component sketch and likely fix location
   - Specific fix suggestions

> ✅ **Checkpoint**: Update PROGRESS.md — mark `[x] Round 1: visual principle review completed`.

## Step 3: Revise

Based on issues from the Step 1/2 reports, revise the design documents (script, storyboard, component sketches, `constants.ts`/`theme.ts` tokens):

1. **Process by priority**: Fix 🔴Critical first, then 🟡Important; 🟢Minor can be skipped
2. **Fix each issue**: Open the relevant spec file, apply the fix strategy from the corresponding [Style Check Rule](#appendix-style-check-rules) section
3. **Special handling for animation patterns**: [§7](#7-animation-patterns-remotion-projects) issues require rewriting the declared animation to use the Remotion frame-driven API (`useCurrentFrame()` + `interpolate()` / `spring()`); verify each rewrite preserves the intended motion
4. **Visual principle fixes**: [Step 2](#step-2-visual-principle-review) findings require editing the storyboard / illustration sketches per the specific fix suggestions in the report
5. **Regression verification**: After fixes complete, re-run Step 1 and Step 2 reviews to confirm issues are resolved and no new issues are introduced
6. **Loop condition**: If regression check still has 🔴Critical issues, continue fix→review loop, maximum 3 rounds

> ✅ **Checkpoint**: Update PROGRESS.md — mark `[x] Round 1: fixes applied`. If Round 2 is needed, mark those items too.

## Step 4: Sign-Off

After all checks pass (no 🔴Critical issues remain), mark the design package complete and hand off the finalized script + storyboard + visual design spec.

## Report Format

Output a Markdown report; each issue contains:
- Severity: 🔴Critical / 🟡Important / 🟢Minor
- Source: [Spec Review] or [Visual Principle Review]
- Spec file:line or Storyboard frame:beat
- Current value/phenomenon vs rule requirement
- Specific fix suggestion

---

## Appendix: Style Check Rules

> This rule set applies to all video-skill projects. When performing a review, first extract project-specific values (such as the palette) from the current project's `style-guide.md` and `constants.ts`/`theme.ts`.

### 1. Font Size Rules (1920×1080 canvas)
| Element type | Minimum | Recommended | How to judge |
|---------------|---------|-------------|--------------|
| Main title | 72px | 96px | Read `fontSize`, combined with variable name / context |
| Section title | 48px | 64px | Same as above |
| Body / label | 40px | 48px | Same as above |
| Subtitle | 32px | 36px | `fontSize` of the Subtitle component (should not be too large) |
| Small caption | 32px | 36px | caption-related context |
| **Absolute minimum** | **32px** | — | Any `fontSize < 32` is 🔴Critical |

**Fix strategy**: `fontSize < 36` → set to 36; `fontSize` below the element type's minimum → set to that type's recommended value (see table above).

Source: `style-guide.md` Typography section.

### 2. Palette (Dynamic Extraction)

**At review time**, extract the approved colors from the current project:
1. Read every hex value from the Color System section of `style-guide.md`
2. Read the color constants defined in `constants.ts` / `theme.ts`
3. Aggregate them into the approved palette for this review

General exemptions:
- `rgba()` semi-transparent colors (e.g., `rgba(0,0,0,0.3)` used for shadows / masks)
- `#000000`, `#ffffff` base black/white
- Gradient intermediate colors (both endpoint colors must be in the palette)

Judgment: Extract every hex color value from the spec and compare against the approved palette. Any color not in the list is flagged 🟡Important.

**Fix strategy**: For a non-approved color, replace it with the nearest color in the palette by hue distance.

### 3. Safe Zones (1920×1080 canvas)
- left ≥ 100, right ≤ 1820 (i.e., left + width ≤ 1820)
- top ≥ 60, bottom ≤ 1020 (i.e., top + height ≤ 1020)
- Element outside the safe zone: 🔴Critical
- Position value exemptions: `left: 0`, `top: 0`, `right: 0`, `bottom: 0` are exempt (standard pattern for `AbsoluteFill` / full-size containers)
- Subtitle region special case: y 880–1000 is the standard subtitle position

**Fix strategy**: `left < 100` → set to 100; `top < 60` → set to 60; `left + width > 1820` → adjust left so it is ≤ 1820 − width; `top + height > 1020` → adjust top so it is ≤ 1020 − height. In short, clamp to the safe-zone boundary.

### 4. Spacing Rules
Legal values (8px multiple system): 8, 16, 24, 32, 48, 64

Judgment: Read padding / margin / gap values
- Not in the legal list but a multiple of 8 (e.g., 40, 56): 🟢Minor
- Not a multiple of 8 (e.g., 14, 15, 25): 🟡Important

**Fix strategy**: Non-8px-multiple → round to the nearest 8px multiple (e.g., 14→16, 25→24).

### 5. Element Sizing
- Icon / arrow minimum size: ≥ 96px (72px is still too small in a full-screen video); < 96px is 🟡Important
- Centered subject width: ≥ 25% of canvas width (≥ 480px), otherwise 🟡Important
- **Composite element** (flow node = icon + label + container): overall height ≥ 160px, otherwise 🟡Important
- **Content fill rate**: the core content area (flowchart, chart, illustration) should occupy ≥ 60% of the safe zone. Content occupying ≤ 30% of the canvas = 🔴Critical ("Thumbnail Syndrome")
- **In-component text**: `fontSize` ≥ 40px (32px is the absolute floor, but component labels are recommended at 40px+); < 40px is 🟡Important
- SVG strokeWidth standard values: 2, 4, 6; non-standard values are 🟢Minor

**Fix strategy**: Icon/arrow < 96px → set to 120; centered subject < 480px → scale up to 480px+; composite element < 160px → scale up the whole composition; content occupying ≤ 30% of canvas → scale the layout so content fills 60%+. See the "Content Area Utilization" section of `visual-principles.md`.

### 6. Corner Radius
Standard `borderRadius` values: 4, 8, 16 (px) or "50%" (circle)
Non-standard values: 🟢Minor

**Fix strategy**: Non-standard value → round to the nearest standard value (4/8/16). If the value is > 16 and not "50%", set it to 16.

### 7. Animation Patterns (Remotion projects)
| Forbidden pattern | How to detect | Severity |
|-------------------|---------------|----------|
| CSS transition | `transition:` in style | 🔴Critical |
| Tailwind animate-* | `animate-` class | 🔴Critical |
| setTimeout for animation | `setTimeout` + context | 🔴Critical |
| setInterval for animation | `setInterval` + context | 🔴Critical |
| CSS @keyframes | `@keyframes` | 🔴Critical |
| requestAnimationFrame | `requestAnimationFrame` | 🔴Critical |

Correct approach: all animation must be driven by `useCurrentFrame()` + `interpolate()` or `spring()`.

**Fix strategy**: Remove CSS transition / @keyframes / setTimeout / setInterval / requestAnimationFrame / Tailwind animate-* patterns and rewrite them as equivalent `useCurrentFrame()` + `interpolate()` (or `spring()`) animation code. Each animation must be rewritten to preserve its original effect.

### 8. Layout Regions (1920×1080 canvas)
| Region | Y range | Use |
|--------|---------|-----|
| Title zone | 60–200 | Scene title |
| Content zone | 200–700 | Core content |
| Info-card zone | 650–850 | Supplementary notes |
| Subtitle zone | 880–1000 | Subtitles |

Coordinate normalization:
- `top: N` → Y start = N
- `bottom: N` → Y end = 1080 − N, Y start = 1080 − N − estimated element height
- During review, convert all positioning to top values before comparing

Overlap checks:
- Text overlapping text such that it is unreadable: 🔴Critical
- A non-subtitle component (not SubtitleSequence / Subtitle) whose bottom edge enters the subtitle zone (Y ≥ 850): 🔴Critical
- **Any absolutely-positioned text/card element** whose bottom is < 30px from the top of the subtitle zone (Y = 880): 🟡Important

Subtitle positioning check:
- The `bottom` value of a subtitle component (SubtitleSequence / Subtitle) must be **20**
- `bottom < 10`: 🔴Critical (beyond the bottom safe edge, subtitle may be clipped)
- `bottom > 30`: 🟡Important (subtitle too high; use the standard value `bottom: 20`)
- `bottom ≠ 20`: 🟢Minor (use the standard value `bottom: 20`)

**Fix strategy**: Element bottom intrudes on the subtitle zone or is < 30px from it → move the element up (decrease top, or increase bottom) so its bottom ≤ 850 (i.e., keep ≥ 30px from the subtitle zone). Non-standard subtitle position → set `bottom` to 20.

### 9. Visual–Script Alignment

Check that visual elements in a scene spec align with the script beat they illustrate, using the storyboard's frame timing:

- A visual element whose timing is hardcoded (e.g., `delay={30}`, `startFrame={50}`) when it corresponds to a specific script beat: 🔴Critical
- A visual element that references the storyboard beat but leads it by more than 10 frames: 🟡Important
- Purely decorative elements (background particles, ambient atmosphere) with hardcoded timing: ✅ Exempt

**Fix strategy**: Replace hardcoded `startFrame` / `delay` with the corresponding storyboard beat's frame (allowing a 1–5 frame lead). See the "Narration-Synced Animation" section of `animation-guide.md`.

### Severity Summary
- 🔴Critical (must fix): `fontSize < 32px`, outside safe zone, forbidden animation patterns, overlapping unreadable text, content fill rate ≤ 30% (Thumbnail Syndrome), visual–script desync from hardcoded timing
- 🟡Important (should fix): color not in palette, spacing not a multiple of 8, centered element < 25% canvas width, icon < 96px, composite element < 160px, in-component text < 40px, visually unbalanced frame
- 🟢Minor (optional): minor spacing drift, non-standard corner radius, non-standard strokeWidth, minor aesthetic tweaks