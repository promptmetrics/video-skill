# video-skill

A Claude skill for planning **Kurzgesagt-style educational explainer videos**.

`video-skill` produces a **design package** — not a rendered video. It walks the producer through requirements → script → storyboard → visual design → design review, and outputs:

- `script.md` — the full narration script (the text deliverable).
- `storyboard.md` — a frame-level visual storyboard with animation intent.
- `design-spec.md` — the Kurzgesagt-style visual design spec (palette, typography, SVG components).
- `PROGRESS.md` — session-spanning progress tracker.

Hand the package to a Remotion developer or a rendering skill to produce the final animated video.

## What it does not do

- No text-to-speech / narration audio.
- No video rendering.
- No Remotion animation code generation.

The skill stops at the design package by design.

## How to use

Ask Claude to plan an explainer video, e.g.:

> Make an explainer video about how rainbows form.

Or invoke directly:

> /promptmetrics-video:video-skill

Claude will gather requirements, write the script (and ask you to approve it), then build the storyboard and visual design spec.

## Files

- `SKILL.md` — the skill instructions (entrypoint).
- `references/` — seven design references loaded per phase.
- `assets/` — design tokens, an SVG icon library, and the progress template.
- `evals/evals.json` — trigger and functional test cases.

See the repository `README.md` for installation and the build/zip flow.