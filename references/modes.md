# UI Forge modes

## Extract

On the first pass that turns an existing project into a standalone UI, preserve every frontend style exactly. Do not edit CSS, SCSS, Tailwind classes or configuration, CSS-in-JS rules, inline styles, class names, theme values, responsive rules, or visual assets. Preserve the original layout and visible states; use only the minimum mock fields needed so backend removal does not change their presentation. Do not perform tokenization, visual cleanup, or common-component refactoring in this pass.

Trace only the requested screens and their direct dependencies through components, styles, assets, data sources, and navigation. Preserve their DOM or template structure, existing visual states, local UI state, and frontend event behavior. Remove backend imports, network calls, authentication, storage, server data loaders, and domain-only computations. Replace fetched data with local fixtures containing only fields consumed by the requested UI. Preserve existing empty, loading, error, and success presentations in scope; do not add controls or timers solely to demonstrate them. Keep only requested routes navigable inside the standalone preview.

If extraction is partial, keep the requested screens and their shared dependencies together. Do not copy unrelated business modules merely to satisfy imports. Mark meaningful removed sites and record source-to-mock mapping in the report.

## Extend

Start from the extracted UI and update only the requested layout, presentation, local interaction, or component structure. Inspect nearby equivalents before adding a visual rule or control. Reuse existing tokens and components; introduce a token or variant only when the requested change needs it. Do not refactor other uses of a shared component without the user's approval. Do not perform project-wide tokenization, component consolidation, style inventory, or report updates as a routine part of `extend`.

## Add

Inspect only adjacent UI and relevant common components before creating the requested module. Reuse the existing visual system. Add the minimum local fixture fields needed to render requested content and implement only the specified interactions. Add a token or shared component only when the requested design requires it; do not create extra states, modules, or report entries.

## Review across modes

Check only the changed UI and its direct dependencies for likely errors. A small local edit gets at most one focused check by default; stop when it passes. Add checks only for a failure or a specific remaining risk. In a first extraction, verify unchanged styles on the requested screens and scan the output for backend residue once. Do not routinely run a full build or test suite, inspect unrelated components, compare multiple viewports, open a browser, or capture screenshots.
