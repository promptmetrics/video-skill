---
name: video-skill
description: Plan Kurzgesagt-style explainer videos: write the narration script, build a frame-level storyboard, and produce a visual design spec. Use when scripting or storyboarding an explainer video.
allowed-tools: Read, Write, WebSearch
---

# video-skill — Kurzgesagt-style explainer video design

You are a video design producer. This skill plans an educational explainer video in a Kurzgesagt-style flat-geometric aesthetic and produces a **design package** — a written narration script, a frame-level storyboard, and a visual design spec — that a developer (or another tool) implements later in Remotion or any renderer.

This skill does **not** generate audio, render video, or write Remotion animation code. It stops at the design package. Hand the package off to a Remotion developer or a rendering skill to produce the final video.

## Prerequisites

None. This is a writing/design skill with no runtime dependencies. It works identically on Claude Code, Claude Cowork, and Claude.ai.

## Project setup

Create a working folder for the project and a `PROGRESS.md` to track state across sessions:

```
<project-name>/
├── PROGRESS.md          # progress tracker (see assets/progress-template.md)
├── script.md            # Phase 1.5 output — the narration script
├── storyboard.md        # Phase 2 output — frame-level storyboard
└── design-spec.md       # Phase 3 output — visual design spec
```

Initialize `PROGRESS.md` from `assets/progress-template.md`.

## Quick start

1. Set up the project folder + `PROGRESS.md`.
2. Gather requirements (Phase 1).
3. Write the narration script; get user approval (Phase 1.5).
4. Build the storyboard (Phase 2).
5. Produce the visual design spec (Phase 3).
6. Run the design review (Phase 4).
7. Hand off the design package.

## Context recovery protocol

When resuming a project mid-flight, **before doing anything else**, read:
1. `PROGRESS.md` — current phase, completed checkboxes, blockers.
2. The most recent output file (`script.md`, `storyboard.md`, or `design-spec.md`).
3. Any decision-log entries in `PROGRESS.md`.

State the current phase and the next concrete action to the user before proceeding.

## Progress tracking protocol

Maintain `PROGRESS.md` throughout. Rules:
- **Checkpoint rule:** every time you complete a checkbox item in `PROGRESS.md`, immediately update the file before moving on.
- **Phase-transition gate:** do not start the next phase until the current phase's checklist is complete and (for Phase 1.5) the user has approved.
- Record decisions, files created, and blockers in the corresponding sections.

## Phase workflow

### Phase 1 — Requirements gathering
Confirm with the user: topic, audience, target duration, key learning points, tone. Use `references/requirements-guide.md`. Write the agreed requirements into `PROGRESS.md`.

### Phase 1.5 — Script writing  ⚠ user approval gate
Write the full word-for-word narration script to `script.md`, following `references/script-and-narration.md`: structure (Hook → Intro → Content → Summary → Outro), pacing, narrative strategy. **Stop and ask the user to approve the script before designing the storyboard.** This is the text deliverable the user cares about most.

### Phase 2 — Storyboard design
Convert the approved script into a frame-level storyboard in `storyboard.md`, using `references/storyboard-template.md`: one row per scene, visual layers, animation intent (what moves, when, easing), frame timing, narration sync points, asset inventory. Keep animation at the *intent* level (describe motion), not Remotion code.

### Phase 3 — Visual design
Produce the visual design spec in `design-spec.md`, applying the Kurzgesagt-style aesthetic: color palette (from `assets/design-tokens.ts`), typography, SVG components (from `references/svg-components.md` and `assets/common-icons.tsx`), scene layouts. Follow `references/style-guide.md` and `references/visual-principles.md`.

### Phase 4 — Design review
Review the complete package against `references/quality-checklist.md`: does the script + storyboard + design satisfy the style guide and visual principles? Fix issues, then mark the package complete in `PROGRESS.md`.

### Output
The design package is complete: `script.md` + `storyboard.md` + `design-spec.md` + `PROGRESS.md`. Tell the user it is ready to hand to a Remotion developer or a rendering skill for animation and render.

## Key principles
- **Content clarity first.** Every visual serves the explanation; cut anything decorative that doesn't teach.
- **Visual simplicity.** Flat geometric shapes, limited palette, one focus per scene.
- **Animation has purpose.** Motion explains, reveals, or connects — never decorates.

## Video structure
Standard 5-part structure (approximate share of total duration):
- **Hook** (~10%) — a question or surprising fact.
- **Intro** (~10%) — frame the problem.
- **Content** (~60%) — the explanation, broken into scenes.
- **Summary** (~15%) — recap key points.
- **Outro** (~5%) — close.

## Reference files

Load each reference only at the phase that needs it.

| File | When to load |
|---|---|
| `references/requirements-guide.md` | Phase 1 — requirements interview |
| `references/script-and-narration.md` | Phase 1.5 — writing the script |
| `references/storyboard-template.md` | Phase 2 — building the storyboard |
| `references/style-guide.md` | Phase 3 — Kurzgesagt visual style |
| `references/visual-principles.md` | Phase 3 — composition, focus, layout |
| `references/svg-components.md` | Phase 3 — SVG component design patterns |
| `references/quality-checklist.md` | Phase 4 — design review |
| `assets/design-tokens.ts` | Phase 3 — color palettes + typography |
| `assets/common-icons.tsx` | Phase 3 — reusable SVG icon library |
| `assets/progress-template.md` | Project setup — PROGRESS.md template |