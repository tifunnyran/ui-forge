# UI Forge modes

## Extract

On the first pass that turns an existing project into a standalone UI, preserve every frontend style exactly. Do not edit CSS, SCSS, Tailwind classes or configuration, CSS-in-JS rules, inline styles, class names, theme values, responsive rules, or visual assets. Preserve the original layout and visible states; use mock data with the same presentation shape so backend removal does not change styling. Do not perform tokenization, visual cleanup, or common-component refactoring in this pass. Record those opportunities for a later `extend` task.

Trace each target screen from its entrypoint through components, styles, assets, data sources, and navigation. Preserve DOM or template structure, visual states, local UI state, and frontend event behavior that a user can see or operate. Remove backend imports, network calls, authentication, storage, server data loaders, and domain-only computations. Replace fetched data with local fixtures matching the fields the UI actually consumes. Preserve empty, loading, error, and success presentations when they are part of the screen; use local controls or a short timer only when needed to reach those states. Make routes navigable inside the standalone preview.

If extraction is partial, keep the requested screens and their shared dependencies together. Do not copy unrelated business modules merely to satisfy imports. Mark meaningful removed sites and record source-to-mock mapping in the report.

## Extend

Start from the extracted UI and its recorded style inventory. This is the stage for requested style changes, tokenization, and shared-component refactoring. Update layout, presentation, local interactions, or component structure within the requested area. Before adding a new visual rule or control, inspect existing equivalents. Change a shared component when the intended behavior applies to all its uses; add a variant when only one context differs. Keep the UI runnable and update the style convention and report when tokens or shared components change.

## Add

Inspect adjacent screens and common components before creating a page, dialog, form, list, card, or navigation element. Compose the new module from the existing visual system. Use representative local fixtures for data-dependent states and wire controls to local UI behavior. Add only the shared components or tokens that the new design genuinely needs. Record new reuse sites and token additions in the report.

## Review across modes

Check both behavior and source structure: no backend imports or secrets, no missing imports, and usable UI states. In a first extraction, verify unchanged styles against the source and document token or reuse work for later. In subsequent work, check centralized recurring values, no duplicate same-function controls, and no copied style blocks. Compare representative screens at narrow and wide widths.
