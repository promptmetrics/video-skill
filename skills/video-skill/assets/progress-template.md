# Video Production Progress

## Current State
- **Current Phase**: [Prerequisites / 1 / 1.5 / 2 / 3 / 4 / Done]
- **Current Step**: [briefly describe what you are doing now]
- **Last Updated**: [timestamp]

## Project Info
- **Topic**: [fill in]
- **Composition**: [fill in]
- **Created**: [date]

## Phase Checklist

### Prerequisites (⚠️ Complete BEFORE Phase 1)
- [ ] Remotion project scaffold exists (or confirm path to existing project)
- [ ] Target output scope confirmed: script + storyboard + visual design spec only (no audio, no rendered video)

### Phase 1: Requirements Gathering
- [ ] Confirmed topic and key learning points
- [ ] Confirmed audience (age, knowledge level)
- [ ] Confirmed language
- [ ] Confirmed target duration
- **Notes**: [summary of the user's specific requirements]

### Phase 1.5: Script Writing (⚠️ User approval required before Phase 2)
- [ ] Core message defined
- [ ] Narrative strategy designed
- [ ] Full script text written
- [ ] Pacing notes added
- [ ] User approved script
- **Output**: `remotion_video/script.md`

### Phase 2: Storyboard Design
- [ ] Script broken into scenes (count: __)
- [ ] Script text assigned to each scene
- [ ] Visual layers designed per scene
- [ ] Animation specs added (spring, easing, timing)
- [ ] Visual-script sync points defined
- [ ] Asset inventory planned
- [ ] User approved storyboard
- **Output**: `remotion_video/storyboard.md`
- **Scene list**: [list scene key names, e.g. hook, intro, concept1, concept2, summary, outro]

### Phase 3: Visual Design
- [ ] Color palette defined → see `constants.ts` COLORS object
- [ ] Scene-level background variants defined (COLORS.sceneBg) if needed
- [ ] Typography configured (`@remotion/google-fonts` loadFont())
- [ ] COLORS object created with all project colors
- **Palette choice**: [palette name or rationale for custom palette]
- **Output**: `src/<Composition>/constants.ts` (COLORS section)

### Phase 4: Design Review
- [ ] Visual design spec reviewed against storyboard
- [ ] Color palette consistency checked across scenes
- [ ] Typography tokens verified (font loads, weights, sizes)
- [ ] SVG geometry / flat-geometric (Kurzgesagt-style) aesthetic confirmed
- [ ] Spring / easing / timing presets reviewed for consistency
- [ ] All colors sourced from COLORS object (no hardcoded hex in design spec)
- [ ] User approved visual design
- **Report**: [summary of design review findings]

## Files Created
<!-- Add one line per file created. Used during context recovery to verify files exist -->
- `remotion_video/script.md`
- `remotion_video/storyboard.md`
- `src/<Composition>/constants.ts` (COLORS section)
<!-- - `src/<Composition>/scenes/SceneHook.tsx` -->

## Decisions Log
<!-- Record key design decisions so they survive context compaction -->
| Decision | Chosen | Why |
|----------|--------|-----|

## Blockers / Errors
<!-- Record script failures or blocking issues, with recovery commands -->
| Error | Phase | Status | Recovery Command |
|-------|-------|--------|-----------------|
| (none) | — | — | — |

---