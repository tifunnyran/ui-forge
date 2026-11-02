---
name: ui-forge
description: Extract, extend, or add UI in an existing frontend codebase while removing backend dependencies and keeping styles consistent through shared tokens and components. Use for UI-only prototypes and frontend refactors based on source code; not for backend or business-logic work.
---

# UI Forge

Work from the existing project's UI, not an invented design. Choose `extract` when separating UI from a full application, `extend` when editing the resulting UI, and `add` when creating new UI alongside it. Read [references/modes.md](references/modes.md) for the selected mode.

## Boundary

- Touch views, styles, static assets, frontend routing, and local presentation state only. Remove network calls, backend SDKs, authentication, persistence, server data loading, business calculations, domain models, and secrets from the output. Do not infer or implement replacement APIs.
- Keep visible states and useful interactions runnable with shape-compatible mock data. Simulate loading only when its UI matters. Use local navigation or another working frontend interaction; do not leave dead controls merely to preserve appearance.
- Keep necessary display-only computations, accessibility behavior, and framework plumbing. Preserve the source framework unless the user requests a different one.
- At each meaningful removal or replacement site, add a valid comment containing `[UI-FORGE] removed: <reason>` in the host language's syntax. Record the original dependency and replacement in the report. Do not put executable backend code in the comment.

## Shared visual system

1. Inventory the source UI's colors, type, spacing, radii, shadows, breakpoints, and interaction states. Centralize recurring values in `tokens.css`, a theme file, or the framework's equivalent. The [token example](assets/tokens.css) shows the expected categories, not prescribed values.
2. Use tokens for color, type, spacing, radii, shadow, and motion in component styles; do not scatter literal design values through components. Consolidate repeated visual rules into shared classes, mixins, or utilities. Structural CSS values such as `100%`, `auto`, and grid fractions may remain local.
3. Find controls with the same interaction and visual rules. Keep one implementation in the project's shared component location and import it everywhere; use props or variants for size, tone, content, and state. Do not merge controls whose behavior is materially different.
4. Keep responsive behavior and naming conventions consistent with the source project. Put theme overrides in the token layer so a theme change does not require editing components. Produce a short style convention explaining token location, naming, variants, and breakpoints.

## Finish

- Verify the UI builds and can be previewed without a backend. Exercise the affected controls and representative states.
- Run [scripts/validate.sh](scripts/validate.sh) against the output, then inspect any hits. The scanner catches common residues but cannot prove full separation.
- Create or update `extraction-report.md` using the [report template](assets/extraction-report.md). Include removal and mock mapping, a token inventory, common components and their reuse sites, and any remaining UI limitations. For `extend` or `add`, update only the sections affected by that work.
