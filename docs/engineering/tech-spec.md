# Tech Spec

`tech-spec` reads `docs/ux-spec.md` and the existing project, then writes `docs/technical-spec.md`: an implementation-ready plan for preserving the approved experience. It maps UX requirements to routes, components, data, interfaces, state, authorization, and tests while choosing the smallest justified architecture.

It does not redesign the UX or replace `/to-spec`. Once its plan is approved, use `/to-spec` to publish the settled decisions to the configured tracker, `/to-tickets` to create vertical implementation slices, and `/implement` to build them.

```txt
ui-spec → tech-spec → to-spec → to-tickets → implement → code-review
```
