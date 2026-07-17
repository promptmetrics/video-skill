# video-skill

A Claude skill that plans **Kurzgesagt-style educational explainer videos** and produces a complete **design package** — a written narration script, a frame-level storyboard, and a visual design spec — ready to hand to a Remotion developer or any renderer.

It does **not** generate audio or render video. It stops at the design package.

## What it is

`video-skill` walks a producer through phases:

1. **Requirements** — topic, audience, duration, key points.
2. **Script** — the full word-for-word narration script (user approves before continuing).
3. **Storyboard** — frame-level visual scenes with animation intent and timing.
4. **Visual design** — Kurzgesagt-style palette, typography, and SVG components.
5. **Design review** — the package is checked against the style guide and visual principles.

Output: `script.md` + `storyboard.md` + `design-spec.md` + `PROGRESS.md`.

## Who it's for

Founders, educators, and content teams who want a structured plan for an explainer video before committing to animation and render. Anyone who wants the **script** and a clear visual blueprint — not the final rendered file.

## Install

### Claude Code (plugin marketplace)

```text
/plugin marketplace add promptmetrics/video-skill
/plugin install promptmetrics-video@promptmetrics-video
/reload-plugins
```

Then invoke with `/promptmetrics-video:video-skill`, or just ask Claude to "make an explainer video about X" and it loads automatically.

### Claude Code (local clone)

```bash
git clone https://github.com/promptmetrics/video-skill
/plugin marketplace add /absolute/path/to/video-skill
/plugin install promptmetrics-video@promptmetrics-video
/reload-plugins
```

### Claude.ai

1. Run `bash scripts/build-zip.sh` to produce `dist/video-skill.zip`.
2. Open Claude.ai → Settings → Capabilities → Skills → Upload skill.
3. Select `dist/video-skill.zip`.

### Claude Cowork

Upload `dist/video-skill.zip` as a skill in your Cowork workspace.

## Getting the zip

```bash
git clone https://github.com/promptmetrics/video-skill
cd video-skill
bash scripts/build-zip.sh
# → dist/video-skill.zip
```

The build script asserts the skill folder name matches the `SKILL.md` `name:` field and that the description is ≤200 characters (the Claude.ai/Cowork upload limit), then zips the skill folder at the archive root.

## Repository contents

```
video-skill/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── LICENSE
├── NOTICE.md
├── README.md
├── scripts/
│   └── build-zip.sh
└── skills/
    └── video-skill/
        ├── SKILL.md
        ├── README.md
        ├── evals/evals.json
        ├── references/   (7 design references)
        └── assets/       (design-tokens, SVG icons, progress template)
```

## Compatibility / portability

This is a **writing and design skill** with no runtime dependencies. It loads and runs identically on Claude Code, Claude Cowork, and Claude.ai. No Node, ffmpeg, or TTS tooling is required to use it — the design package it produces is handed off to a separate rendering step.

## License

MIT — see `LICENSE`.

## Acknowledgments

This skill adapts portions of the `educational-video-creator` skill from [`skindhu/skind-skills`](https://github.com/skindhu/skind-skills) (MIT, Copyright (c) 2026 `long_long_ago`). See `NOTICE.md`. The audio and Remotion render steps from the original were removed; this port focuses on script, storyboard, and visual design.