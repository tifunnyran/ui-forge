---
name: ui-prototype-studio
description: For UI design or high-fidelity prototype changes in an existing frontend codebase, with an optional mode for writing and editing page-aligned PRDs inside the prototype. Ask for project opt-in on first use. Preserve all frontend styles during the first extraction. Not for backend-only work.
---

# UI Prototype Studio

Use this skill for UI or high-fidelity prototype work in an existing frontend. Work from the existing UI and framework; choose `extract`, `extend`, or `add` and read [references/modes.md](references/modes.md). This skill is UI-only and does not implement backend APIs or business logic.

## Project opt-in

- At the first applicable UI, prototype, or PRD task, verify a project-specific opt-in for automatic `ui-prototype-studio` use and whether PRD mode is enabled. If either choice is missing, ask with short selectable questions before editing; installation itself cannot prompt, and silence or a preselected option is not approval.
- After affirmative opt-in, add the concise rule requiring `ui-prototype-studio` for that project's UI and prototype modifications to its `AGENTS.md` without removing existing instructions. Do not ask again when recorded; a declined PRD choice stays off until the user explicitly enables it. Opt-in does not approve a particular implementation, conflict resolution, or demo data; backend-only work remains outside this skill.

## CTO role

- Own the requested UI and, when enabled, its corresponding PRD. Inspect the specified view, section, and direct dependencies; implement only the requested outcome and perform the smallest relevant check.
- Reuse the project's framework, visual language, tokens, and same-function components. Do not add speculative features, pages, states, copy, fixtures, dependencies, architecture, backend work, or unrelated refactors.

## User-directed changes

- For a plan, idea, ambiguity, or unclear placement, summarize substantial context in short points, confirm the broad direction first with a short selectable question, then ask only necessary details, then present the concrete final plan for selectable approval. Do not ask the user to choose a confirmation style, and do not edit, commit, or push before affirmative final approval; never require a typed reply.
- If the user questions, rejects, revises, or conflicts with an existing UI or confirmed plan, pause the affected area, summarize the current/requested behavior and scope, and ask for confirmation. State exact conflicts and obtain approval for the final resolution before changing it.
- Work only in the user-specified area and necessary direct dependencies. If a location is not unique, name the verified candidates and ask; never choose from presumed intent. If a shared component would affect other areas, ask first. Unclear behavior, wording, or visual requirements require a question, not a guess.
- Treat screenshots, images, documents, and pasted material as functional or field references only. Do not infer their CSS, colors, typography, spacing, layout, or copy; follow the existing project's visual rules. Add no filler or invented descriptions, and match the existing palette and components.
- When repeated corrections or an explicit future preference may require a reusable rule, inspect current rules first, show the exact existing/proposed wording and whether the target is project-specific or global, then request approval before writing. Do not generalize a one-off correction, inspect unrelated conversations, or modify the prototype as part of learning; report the rule files actually changed.

## Read-only and edit states

- In newly added or modified UI, read-only content must look like display content: no visible input borders, editor focus cues, placeholders, resize handles, or other edit affordances. Show controls only in edit mode while preserving readable selection, accessibility, viewing, and navigation. During the first `extract`, preserve the source styles exactly and defer later state cleanup.

## Prototype confirmation and locks

- Before adding a confirmation or lock, identify affected screens/fields, viewability, navigation, lifetime, refresh behavior, and any storage needed. Ask the user to choose recovery/reset behavior when a lock could obstruct review; do not silently add persistence or controls. Resolve conflicts with the final approval process above.

## Demo data approval

- Before adding any demonstration data, including minimum extraction mocks, fixtures, names, SKUs, search results, or default selections, list exact fields, values, count, display location, and initial-state effect in a readable grouped message, then ask one short selectable approval question. Screenshots or prior examples do not replace this approval.
- Add only affirmatively approved data. If it cannot render the requested UI without backend access, explain the blocker and ask how to proceed; do not invent a substitute or alter the original styles to hide it.

## Page PRD mode

- PRD mode is optional and conditional. Before PRD work, read the [PRD mode index](references/prd/README.md) and the linked documents it routes to; they are the detailed contract for scope, panel behavior, editing, storage, layout isolation, and synchronization.
- Keep skill rules in `references/prd/`; keep each target project's actual page/component PRDs in its own `src/prd/`. These locations are separate, and reorganizing one must not change the other.
- PRD documents inherit this file's approval, scope, style-preservation, demo-data, and minimal-validation rules. Do not duplicate their detailed clauses or invent a second PRD workflow.

## Boundary

- During the first `extract`, preserve all frontend styles, layout, DOM/template structure, states, assets, theme values, breakpoints, class names, and visual output exactly. Remove backend dependencies only within the requested scope; replace data only after demo-data approval, mark meaningful removals with `[UI-FORGE] removed: <reason>`, and record the mapping in `extraction-report.md`. Do not tokenize or refactor styles/components in this pass; report a blocker instead of making a visual change.
- Frontend work is limited to views, styles, static assets, routing, local presentation state, and explicitly authorized project PRD-file operations. Preserve requested states and interactions; do not infer replacement APIs, domain models, secrets, or extra demo content.
- After `extract`, reuse nearby existing visual rules, tokens, and shared components. Add a token, variant, or shared component only when the requested UI requires it; do not globally consolidate styles or components.

## Finish

- For one frontend app, reuse its existing dev server and URL; if none exists, use one fixed project port. Do not start duplicate per-conversation servers or accept an incremented port for the same app.
- Verify only the changed area with the smallest relevant check; a small edit gets one focused check by default and stops when it passes. Do not routinely run full suites, repeat builds, traverse pages, open browsers, or batch screenshots.
- For first `extract`, verify requested unchanged styles and run [scripts/validate.sh](scripts/validate.sh) once. For `extend`/`add`, run the scanner only for a concrete backend or secret-residue risk. Create `extraction-report.md` from the [report template](assets/extraction-report.md) only for first `extract`, unless the user explicitly requests a report.
