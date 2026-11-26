# Page PRD mode

Page PRD mode is an optional extension of `ui-prototype-studio`. Load this index only when the project has enabled PRD mode or the user explicitly requests PRD work. Then read the documents relevant to the requested operation; together they are the detailed PRD-mode contract.

- [Scope and mappings](scope.md): page and component coverage, independent files, shared-file approval, empty files, and component PRD disablement.
- [Panel and layout](panel.md): activation, selection, headers, tabs, prototype/PRD regions, and local versus deployed visibility.
- [Editor interactions](editor.md): supported Markdown blocks, conversion, selection/copying, drag reorder, undo, and scrolling.
- [Storage and synchronization](storage.md): local file access, autosave, durable refresh behavior, first-extract sequencing, and frontend-to-PRD synchronization.

Use only the documents needed for the task after reading this index. Keep the actual project PRD files under that project's `src/prd/` directory; this skill documentation directory is not a project PRD store. Preserve the approval and minimal-scope rules in the main `SKILL.md`.
