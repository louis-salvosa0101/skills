---
name: tech-spec
description: Create an implementation-ready technical specification that preserves an approved UX specification.
disable-model-invocation: true
---

# Technical Specification

Translate approved product and UX decisions into the simplest technically sound plan. This skill answers: **how should we implement the experience?** It does not redesign the product or UX, create tickets, or write implementation code.

Read `docs/ux-spec.md` before proposing a solution. If it is missing, ask the user to run `/ui-spec` first or provide an approved equivalent. When a UX requirement is costly, preserve it where practical, identify the tradeoff, and ask for a decision rather than silently removing it.

## Process

1. Inspect the UX specification, product requirements, `AGENTS.md` or `CLAUDE.md`, package configuration, current routes, components, data model, APIs, authentication, styling, dependencies, and tests. For existing products, the codebase is a major source of truth. Reuse working architecture and components unless a concrete constraint requires change.

2. Trace each material UX requirement to an implementation boundary: route, component, state, interface, data, authorization rule, or test. Prefer the smallest architecture that preserves the experience. Avoid new layers, services, state stores, repositories, dependencies, caches, or background jobs without a requirement that justifies them.

3. Define only the data, interfaces, security controls, performance work, and tests the product requires. Record assumptions, open decisions, and deliberate exclusions. For AI features, specify purpose and safe operational behavior rather than adding AI because it is available.

4. Write `docs/technical-spec.md`. Create `docs/` if it does not exist. Use project vocabulary. Do not turn the document into an implementation ticket list or prescribe stale file-by-file edits.

5. Verify that every critical UX journey and state has an implementation path, and that the plan does not alter the UX without an explicit decision. Present material tradeoffs and questions for approval.

## Technical specification template

```markdown
# <Feature or product> Technical Specification

## Inputs and constraints

<Product requirements, UX specification, relevant existing architecture, project instructions, dependencies, and assumptions.>

## Scope and implementation approach

<The smallest approach that preserves the UX, plus explicit non-goals and important tradeoffs.>

## UX traceability

| UX requirement or journey | Implementation boundary | Preservation note |
| --- | --- | --- |
| <requirement> | <route, component, service, or state boundary> | <how it remains intact> |

## Architecture and data flow

<Frontend and backend responsibilities, server/client boundaries, data flow, state ownership, external services, storage, caching, and background work only where justified.>

## Data model

<Entities, fields/types, relationships, ownership, validation, constraints, lifecycle, deletion behavior, and justified indexes. Omit if no data changes are needed.>

## Interfaces

### <API, server action, RPC, or equivalent>

- **Purpose and caller:**
- **Authentication and authorization:**
- **Input and validation:**
- **Processing and side effects:**
- **Output and error cases:**

## Frontend boundaries

<Routes, pages, component responsibilities, shared patterns, form behavior, state, fetching, mutations, validation, and the loading, empty, error, success, permission, and responsive behavior required by the UX spec.>

## AI implementation

<Only if needed: product purpose, model responsibility, input/context, structured output, validation, hallucination mitigation, timeout/retry/fallback, cost, privacy, prompt injection, and unsafe-output controls.>

## Security and privacy

<Authentication, authorization, validation, secrets, sensitive data, access controls, and proportionate abuse or rate controls.>

## Performance

<Meaningful risks and the simplest mitigation, such as request count, payload size, query shape, rendering, assets, or AI latency.>

## Testing strategy

<Critical journeys and seams, observable behavior, integration/API/UI tests where valuable, authorization and error cases, and relevant AI validation.>

## Open decisions and risks

<Items that need approval before ticketing or implementation. Omit empty sections.>
```

## Quality bar

- Preserve the approved UX. Explain any required compromise and its user impact.
- Model only product data and interfaces that are necessary. Keep contracts minimal and validate input and output at trust boundaries.
- Use existing architecture, dependencies, and components before proposing additions or refactors.
- Keep security and performance proportional to actual risk. Do not mistake a checklist for an architecture.
- Define tests around critical, externally observable behavior, including important failure and authorization paths.
- Treat AI output as untrusted: validate structured results, bound context and costs, protect sensitive data, and provide a user-safe failure path.

## Handoff

Once the technical specification is approved, the human can invoke `/to-spec` to publish the settled decisions to the configured tracker, then `/to-tickets` to derive tracer-bullet implementation work. Pass `docs/technical-spec.md` as source material when the current conversation does not already contain it.
