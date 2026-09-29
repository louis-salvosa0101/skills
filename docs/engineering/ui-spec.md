# UI Spec

`ui-spec` turns settled product intent into `docs/ux-spec.md`: an implementation-ready description of what users experience. It covers journeys, screen purpose, hierarchy, interactions, visual direction, responsive behavior, accessibility, and non-happy-path states without choosing implementation architecture.

Run it after `/grill-with-docs` when working in a repository. It asks focused questions only when a missing answer affects the critical journey; otherwise it records safe assumptions. It challenges interface elements that cannot be tied to a user goal, decision, or action.

The output becomes the input to `/tech-spec`. For a small, clear feature, keep the specification to the essential journey and screens. For a broader product, add information architecture and reusable patterns only where they are needed.

```txt
grill-with-docs → ui-spec → tech-spec → to-spec → to-tickets → implement → code-review
```
