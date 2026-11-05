---
name: ui-forge
description: Extract, extend, or add UI in an existing frontend codebase. Preserve all frontend styles during the first extraction; use shared tokens and components for later UI work. Not for backend or business-logic work.
---

# UI Forge

Work from the existing project's UI, not an invented design. Choose `extract` when separating UI from a full application, `extend` when editing the resulting UI, and `add` when creating new UI alongside it. Read [references/modes.md](references/modes.md) for the selected mode.

## User-directed changes

- If the user asks how to change a project, requests ideas or options, or asks for a plan without directing a specific implementation, present a concrete proposal and ask for explicit approval. Do not edit project files, commit, or push until the user approves that proposal. Silence or a request for further explanation is not approval.
- When a user requests a project change, work only within the specified feature or area and its necessary direct dependencies. Do not add adjacent features, redesign other areas, or make discretionary improvements. If changing a shared component would affect areas outside the request, ask the user before making that change.
- If the target, behavior, wording, or visual requirement is unclear in a way that affects implementation, ask a concrete question and wait for the user's answer before editing that part. Do not resolve such gaps by guessing or changing the project on your own.
- Do not add filler, decorative explanations, invented marketing copy, or placeholder descriptions without a real user-facing purpose. Use the project's existing terminology; ask for required wording when it is not specified.
- Match every added or changed UI element to the project's existing visual language and color palette. Reuse its tokens, styles, and components. If the project provides no clear reference for a required visual choice, ask before introducing one.

## Boundary

- During the first `extract` pass that turns a project into a standalone UI, do not change any frontend styles. Preserve style files and rules, inline styles, class names, selectors, style-related props, theme values, breakpoints, assets, and the visual output of existing states. Copy style files unchanged where possible. Replace data and backend dependencies without restyling the UI. If a screen cannot run without changing its styles, report the blocker instead of silently making a visual change.
- Touch views, styles, static assets, frontend routing, and local presentation state only. Remove network calls, backend SDKs, authentication, persistence, server data loading, business calculations, domain models, and secrets from the output. Do not infer or implement replacement APIs.
- Keep visible states and useful interactions runnable with shape-compatible mock data. Simulate loading only when its UI matters. Use local navigation or another working frontend interaction; do not leave dead controls merely to preserve appearance.
- Keep necessary display-only computations, accessibility behavior, and framework plumbing. Preserve the source framework unless the user requests a different one.
- At each meaningful removal or replacement site, add a valid comment containing `[UI-FORGE] removed: <reason>` in the host language's syntax. Record the original dependency and replacement in the report. Do not put executable backend code in the comment.

## Shared visual system

The rules below apply to subsequent `extend` and `add` work. For the first `extract`, inventory the original values and duplicate components in the report, but do not rewrite styles, introduce an active token layer, or consolidate components. The first-pass style-preservation rule takes precedence over token and reuse requirements.

1. Inventory the source UI's colors, type, spacing, radii, shadows, breakpoints, and interaction states. Centralize recurring values in `tokens.css`, a theme file, or the framework's equivalent. The [token example](assets/tokens.css) shows the expected categories, not prescribed values.
2. Use tokens for color, type, spacing, radii, shadow, and motion in component styles; do not scatter literal design values through components. Consolidate repeated visual rules into shared classes, mixins, or utilities. Structural CSS values such as `100%`, `auto`, and grid fractions may remain local.
3. Find controls with the same interaction and visual rules. Keep one implementation in the project's shared component location and import it everywhere; use props or variants for size, tone, content, and state. Do not merge controls whose behavior is materially different.
4. Keep responsive behavior and naming conventions consistent with the source project. Put theme overrides in the token layer so a theme change does not require editing components. Produce a short style convention explaining token location, naming, variants, and breakpoints.

## Finish

- Verify the UI builds and can be previewed without a backend. Exercise the affected controls and representative states.
- For a first `extract`, compare representative screens and states with the source at matching viewport sizes. Record the comparison and any unverified states; do not call a changed style an acceptable extraction.
- Run [scripts/validate.sh](scripts/validate.sh) against the output, then inspect any hits. The scanner catches common residues but cannot prove full separation.
- Create or update `extraction-report.md` using the [report template](assets/extraction-report.md). Include removal and mock mapping, a token inventory, common components and their reuse sites, and any remaining UI limitations. In a first `extract`, record style-preservation evidence and defer token or component refactors. For `extend` or `add`, update only the sections affected by that work.
