---
name: ui-forge
description: For UI design or high-fidelity prototype changes in an existing frontend codebase. On first use in a project, ask whether to enable automatic use for future UI changes. Covers extract, extend, and add work. Preserve all frontend styles during the first extraction. Not for backend-only work.
---

# UI Forge

When a UI modification request matches this skill, check project opt-in before applying it. Work from the existing project's UI, not an invented design. Choose `extract` when separating UI from a full application, `extend` when editing the resulting UI, and `add` when creating new UI alongside it. Read [references/modes.md](references/modes.md) for the selected mode.

## Project opt-in

- A skill file cannot prompt at installation time. At the first applicable UI or high-fidelity prototype task in a project, check for an existing project execution rule or clear prior user authorization for automatic `ui-forge` use in that specific project. If neither exists, show the proposed rule and ask through a selectable question whether to enable automatic use for future UI and prototype modifications in that project. Do this before applying the skill to the task.
- At that first use, also ask one short, selectable question about confirmation style unless the user has already chosen one for the project: either show a complete proposal for one review, or confirm the broad direction first and ask only the necessary details in later, small rounds. Ask this alongside project opt-in when both are missing; do not bundle implementation details into these onboarding questions. Follow the chosen style for later UI clarification and plan approvals without waiving any required approval.
- Only after affirmative opt-in approval, add a concise rule to the project's `AGENTS.md` requiring `ui-forge` for UI and prototype modifications, together with the user's chosen confirmation style, while preserving all existing instructions. If automatic use was already approved but the style was missing, record the newly chosen style there. If opt-in is declined, do not add the rule or apply this skill to an implicit request; honor the chosen style for explicitly requested one-off use in the current conversation. Respect that decline for the current conversation. Silence or a preselected option is not approval. Do not repeat questions already answered for that project.
- Project opt-in does not approve a particular implementation, conflicting change, or demo dataset. Follow the separate approval rules below for those actions. Backend-only work remains outside this skill.

## CTO role

- Act as CTO for requests to modify a UI-only project or frontend UI code. After project opt-in, apply `ui-forge` without an explicit skill mention, but take ownership only of the frontend outcome the user specified.
- For a specific, actionable change, inspect the affected files and direct dependencies, implement the scoped UI change, and perform targeted verification. Follow the user-directed change rules below when details or scope need clarification.
- Build only what the requested UI design or high-fidelity prototype needs. Reuse the project's framework and existing components. Do not add speculative features, architecture, backend work, or dependencies.

## User-directed changes

- When a confirmation or clarification needs substantial context, organize the background in short, scannable points before the selectable question. Keep the question itself to one concise decision and its options short and distinct; do not paste a dense specification into the question prompt. Ask independent decisions in separate rounds, following the user's chosen confirmation style, and include only the details needed for the next decision.
- If the user asks how to change a project, requests ideas or options, or asks for a plan without directing a specific implementation, present a concrete proposal and ask a selectable confirmation question. Offer explicit choices such as "Approve and implement" and "Do not implement"; do not require the user to type a reply. Do not edit project files, commit, or push until the user actively selects approval. A preselected choice, silence, or a request for further explanation is not approval.
- If the user asks to modify previously built UI, rejects or revises a confirmed UI plan, or questions a UI plan, assumption, implementation, or result, pause edits to the affected area. Briefly summarize the existing behavior or plan, the requested change or concern, and the affected scope. Ask a concrete, selectable question to confirm the intended outcome, even if the new request seems explicit. The request, rejection, or challenge alone is not confirmation; read-only investigation may continue while waiting.
- After the user confirms the intended outcome, check whether it conflicts with an earlier confirmed requirement. If it does, state the exact conflict, ask the user to choose a resolution, then present a final concrete plan stating what stays, changes, and is removed. Edit the conflicting area only after the user affirmatively approves that final plan. A choice of direction alone, a preselected option, silence, or an ambiguous reply is not approval. If there is no conflict, implement only the confirmed change.
- When a user requests a project change, work only within the specified feature or area and its necessary direct dependencies. Do not add pages, features, states, copy, fixtures, dependencies, or refactors unless explicitly requested or indispensable to the specified UI. Demo data always requires the separate approval below. If changing a shared component would affect areas outside the request, ask the user before making that change.
- Before any UI change, identify the user-specified page or view, relevant section or component, and insertion or replacement point as applicable. If the request does not uniquely locate the change, ask a concrete, selectable question naming the verified candidate locations and wait for the user's choice. Do not select a location from similar pages, file names, the current route, or presumed intent. A clear feature request does not authorize an unconfirmed placement. If implementation reveals another plausible location, stop before editing that area and reconfirm.
- If behavior, wording, or a visual requirement remains unclear in a way that affects implementation, ask a concrete question and wait for the user's answer before editing that part. Do not resolve such gaps by guessing or changing the project on your own.
- Treat images, screenshots, documents, pasted material, and other references supplied in the conversation as sources for functional requirements and fields only. Do not copy or infer CSS, colors, typography, spacing, component placement, or page layout from them; follow this skill's style-preservation and existing-project visual rules instead. If the user explicitly requests a reference's visual design and it conflicts with those rules, use the selectable conflict-resolution and final-approval process above before changing the visuals.
- Do not add filler, decorative explanations, invented marketing copy, or placeholder descriptions without a real user-facing purpose. Use the project's existing terminology; ask for required wording when it is not specified.
- Match every added or changed UI element to the project's existing visual language and color palette. Reuse its tokens, styles, and components. If the project provides no clear reference for a required visual choice, ask before introducing one.

## Read-only and edit states

- In newly added or modified UI, make read-only content look like display content using the project's existing visual language. Do not leave visible input or textarea borders, editable focus treatment, placeholders, resize handles, or other obvious editor cues in the read-only state. Show editing controls only in the edit state. Keep read-only text readable, selectable, and accessible, and preserve viewing and navigation.
- Check the affected read-only and edit states when changing this behavior. During a first `extract`, preserve the source styles exactly even if its read-only state looks editable; record the issue and change it only in a later, explicitly requested edit.

## Prototype confirmation and locks

- Before implementing a confirmation or approval action that limits editing, identify the affected screens and fields, what remains viewable and navigable, whether the state survives refresh or a later visit, and whether that requires browser storage. "Not editable" does not mean hidden or inaccessible; preserve viewing and navigation unless the user explicitly requests otherwise.
- For a prototype, ask how the designer can inspect or reset a locked state if the proposed lock would obstruct review. Present concrete, selectable choices for its lifetime and recovery behavior; do not silently add a reset control or make the lock persistent. Do not recommend an option that conflicts with an earlier confirmed requirement.
- Compare the selected behavior with earlier limits on storage and editability. If it conflicts, state the exact tradeoff and follow the conflict-resolution and final-approval process above before editing. A choice about refresh behavior alone does not authorize adding browser persistence or overriding an earlier restriction.

## Demo data approval

- Before adding any demonstration data, including the minimum mock data for `extract`, local fixtures, sample names or SKUs, search results, or a preselected record, state its exact fields, values, record count, display location, and effect on the initial UI state. Ask the user to approve that concrete data through a selectable question. A screenshot, a request for a prototype, or data already supplied in the conversation does not replace this approval.
- Add only the data the user affirmatively approves. Do not write it after silence, a preselected option, or an ambiguous reply. If the approved data is insufficient to render the requested UI without backend access, explain the blocker and ask for a revised choice; do not invent a substitute or change the original styles to work around it.

## Boundary

- During the first `extract` pass that turns a project into a standalone UI, do not change any frontend styles. Preserve style files and rules, inline styles, class names, selectors, style-related props, theme values, breakpoints, assets, and the visual output of existing states. Copy style files unchanged where possible. Remove backend dependencies; replace their data only after demo-data approval. If a screen cannot run without changing its styles, report the blocker instead of silently making a visual change.
- Touch views, styles, static assets, frontend routing, and local presentation state only. Remove network calls, backend SDKs, authentication, persistence, server data loading, business calculations, domain models, and secrets from the output. Do not infer or implement replacement APIs.
- Preserve existing in-scope states and requested interactions. During extraction, use only approved local data and fields needed to render those states. Do not invent extra data, controls, navigation, timers, or interaction states for demonstration.
- Keep necessary display-only computations, accessibility behavior, and framework plumbing. Preserve the source framework unless the user requests a different one.
- At each meaningful backend removal or replacement site, add a valid comment containing `[UI-FORGE] removed: <reason>` in the host language's syntax. During `extract`, record the original dependency and replacement in the extraction report. Do not put executable backend code in the comment.

## Shared visual system

For the first `extract`, preserve original styles without tokenization or component refactoring. For later `extend` and `add` work:

1. Use the existing visual rules, tokens, and shared components that apply to the requested area. Inspect only nearby equivalents needed for that change.
2. Reuse an existing same-function control instead of copying it. Add a token, variant, or shared component only when the requested UI needs it; do not migrate unrelated styles or consolidate existing duplicates elsewhere.
3. Keep responsive and naming conventions consistent with the source project. Do not create a style inventory, theme layer, or style convention document unless the user requests that work.

## Finish

- For the same frontend app in one project, all conversations share one dev-server process and URL. Before starting a preview, check for a server already serving that app and reuse it. Do not start a per-conversation server or accept an automatically incremented port when the project's server already exists. If none exists, use one fixed port for the project and share its URL; do not stop or reconfigure a server belonging to another project.
- Choose the smallest check that can catch a likely error in the changed area. For a small local edit, run at most one focused check by default; if it passes, stop. Add a check only after a failure or to resolve a specific remaining risk, and state that reason.
- Do not routinely run a full test suite, repeat builds, traverse every page, take batches of screenshots, or open a browser. Use any of these only when the user requests it or a concrete risk cannot be checked more narrowly.
- For a first `extract`, compare only the requested screens and existing states needed to verify unchanged styles, then run [scripts/validate.sh](scripts/validate.sh) once against the UI output and inspect any hits. For `extend` or `add`, run the scanner only if the change could reintroduce backend or secret residue.
- Create `extraction-report.md` from the [report template](assets/extraction-report.md) for a first `extract`, recording removal and mock mapping, style-preservation evidence, and unverified states. Do not create or update a report for `extend` or `add` unless the user explicitly requests one. Briefly report the change and the check performed in the final response.
