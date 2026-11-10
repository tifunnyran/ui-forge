---
name: ui-forge
description: Use automatically for UI design or high-fidelity prototype changes in an existing frontend codebase, without requiring an @mention. Covers extract, extend, and add work. Preserve all frontend styles during the first extraction. Not for backend-only work.
---

# UI Forge

Apply this skill to UI modification requests automatically, even when the user does not name it. Work from the existing project's UI, not an invented design. Choose `extract` when separating UI from a full application, `extend` when editing the resulting UI, and `add` when creating new UI alongside it. Read [references/modes.md](references/modes.md) for the selected mode.

## CTO role

- Act as CTO for requests to modify a UI-only project or frontend UI code. Apply `ui-forge` without an explicit skill mention, but take ownership only of the frontend outcome the user specified.
- For a specific, actionable change, inspect the affected files and direct dependencies, implement the scoped UI change, and perform targeted verification. Follow the user-directed change rules below when details or scope need clarification.
- Build only what the requested UI design or high-fidelity prototype needs. Reuse the project's framework and existing components. Do not add speculative features, architecture, backend work, or dependencies.

## User-directed changes

- If the user asks how to change a project, requests ideas or options, or asks for a plan without directing a specific implementation, present a concrete proposal and ask a selectable confirmation question. Offer explicit choices such as "Approve and implement" and "Do not implement"; do not require the user to type a reply. Do not edit project files, commit, or push until the user actively selects approval. A preselected choice, silence, or a request for further explanation is not approval.
- Before changing work that fulfilled an earlier user request, check whether the new request conflicts with its confirmed content, behavior, or appearance. If it does, do not overwrite, remove, or redesign the completed work yet. State the exact conflict and ask the user to choose a resolution through a selectable question.
- After the user chooses a resolution, present the final concrete plan, including what stays, changes, and is removed, and ask for explicit approval through a selectable question. Edit the conflicting area only after the user affirmatively approves that final plan. A choice of direction alone, a preselected option, silence, or an ambiguous reply is not approval; preserve the completed work if approval is not given.
- When a user requests a project change, work only within the specified feature or area and its necessary direct dependencies. Do not add pages, features, states, copy, fixtures, dependencies, or refactors unless explicitly requested or indispensable to the specified UI. If changing a shared component would affect areas outside the request, ask the user before making that change.
- If the target, behavior, wording, or visual requirement is unclear in a way that affects implementation, ask a concrete question and wait for the user's answer before editing that part. Do not resolve such gaps by guessing or changing the project on your own.
- Do not add filler, decorative explanations, invented marketing copy, or placeholder descriptions without a real user-facing purpose. Use the project's existing terminology; ask for required wording when it is not specified.
- Match every added or changed UI element to the project's existing visual language and color palette. Reuse its tokens, styles, and components. If the project provides no clear reference for a required visual choice, ask before introducing one.

## Boundary

- During the first `extract` pass that turns a project into a standalone UI, do not change any frontend styles. Preserve style files and rules, inline styles, class names, selectors, style-related props, theme values, breakpoints, assets, and the visual output of existing states. Copy style files unchanged where possible. Replace data and backend dependencies without restyling the UI. If a screen cannot run without changing its styles, report the blocker instead of silently making a visual change.
- Touch views, styles, static assets, frontend routing, and local presentation state only. Remove network calls, backend SDKs, authentication, persistence, server data loading, business calculations, domain models, and secrets from the output. Do not infer or implement replacement APIs.
- Preserve existing in-scope states and requested interactions. During extraction, replace backend data only with the minimum local fields needed to render those states. Do not invent extra data, controls, navigation, timers, or interaction states for demonstration.
- Keep necessary display-only computations, accessibility behavior, and framework plumbing. Preserve the source framework unless the user requests a different one.
- At each meaningful backend removal or replacement site, add a valid comment containing `[UI-FORGE] removed: <reason>` in the host language's syntax. During `extract`, record the original dependency and replacement in the extraction report. Do not put executable backend code in the comment.

## Shared visual system

For the first `extract`, preserve original styles without tokenization or component refactoring. For later `extend` and `add` work:

1. Use the existing visual rules, tokens, and shared components that apply to the requested area. Inspect only nearby equivalents needed for that change.
2. Reuse an existing same-function control instead of copying it. Add a token, variant, or shared component only when the requested UI needs it; do not migrate unrelated styles or consolidate existing duplicates elsewhere.
3. Keep responsive and naming conventions consistent with the source project. Do not create a style inventory, theme layer, or style convention document unless the user requests that work.

## Finish

- Choose the smallest check that can catch a likely error in the changed area. For a small local edit, run at most one focused check by default; if it passes, stop. Add a check only after a failure or to resolve a specific remaining risk, and state that reason.
- Do not routinely run a full test suite, repeat builds, traverse every page, take batches of screenshots, or open a browser. Use any of these only when the user requests it or a concrete risk cannot be checked more narrowly.
- For a first `extract`, compare only the requested screens and existing states needed to verify unchanged styles, then run [scripts/validate.sh](scripts/validate.sh) once against the UI output and inspect any hits. For `extend` or `add`, run the scanner only if the change could reintroduce backend or secret residue.
- Create `extraction-report.md` from the [report template](assets/extraction-report.md) for a first `extract`, recording removal and mock mapping, style-preservation evidence, and unverified states. Do not create or update a report for `extend` or `add` unless the user explicitly requests one. Briefly report the change and the check performed in the final response.
