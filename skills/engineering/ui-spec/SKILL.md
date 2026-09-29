---
name: ui-spec
description: Create an implementation-ready UI and UX specification for a product or feature.
disable-model-invocation: true
---

# UI Specification

Turn a settled product idea into the user experience another agent can implement without inventing the design. This skill answers: **what should the user experience?** It does not choose implementation architecture or write code.

Use this after the product has been sharpened, normally with `/grill-with-docs` in a working directory. If essential product facts remain unknown, ask only the focused questions that affect the critical journey. For a small, clear request, state reasonable assumptions and continue.

## Process

1. Inspect the available product requirements, project vocabulary, brand material, and existing interface. When modifying a product, preserve established patterns unless they fail the user goal. Identify the target users, their context, their goals, and their highest-value journey.

2. Challenge unsupported UI requests before treating them as requirements. For each proposed navigation area, card, chart, icon, badge, AI surface, or decorative treatment, name the user goal, decision, or action it serves. Remove or replace elements that have no answer. Derive the interface from **user → goal → decision → action → feedback**, not from a familiar dashboard template.

3. Define the experience at the detail the project needs. Start with the critical journey, then cover secondary journeys only when they materially affect it. Specify navigation only when it solves a navigation problem. Scale the document: a small feature may need one journey and a few screens; a larger product may need information architecture and reusable patterns.

4. Write `docs/ux-spec.md`. Create `docs/` if it does not exist. Clearly mark assumptions and open decisions so `/tech-spec` does not mistake them for approved requirements. Do not write code, component file paths, APIs, database design, or technical architecture.

5. Review the document against the checks below. Present the decisions and any questions that still need human approval.

## UX specification template

```markdown
# <Feature or product> UX Specification

## Purpose and scope

<The user problem, product goal, in-scope experience, and explicit exclusions.>

## Assumptions and open decisions

<Assumptions made to keep moving and decisions that require confirmation. Omit empty sections.>

## Target users and context

<For each important user: role, goals, needs, pain points, relevant technical familiarity, and context of use.>

## Critical user journey

1. **Entry point:** <where and why the user arrives>
2. **First important action:** <what they do>
3. **Information and decision:** <what they need to learn and decide>
4. **Action and feedback:** <what changes and how they know>
5. **Completion and next action:** <the outcome and sensible continuation>

## Information architecture and navigation

<Page hierarchy, navigation labels, contextual navigation, and explicit desktop/mobile behavior. Include only navigation that supports a journey.>

## Screen specifications

### <Screen name>

- **Purpose, user, and entry points:**
- **Primary action and secondary actions:**
- **Information and layout hierarchy:**
- **Components and interaction behavior:**
- **States:** initial, loading, empty, error, retry, success, disabled, and permission states that apply.
- **Responsive behavior:** desktop, tablet, and mobile changes.
- **Accessibility:** semantics, keyboard path, focus, labels, feedback, contrast, touch targets, and reduced motion as applicable.

## Visual direction

<Product-appropriate personality, tone, color roles, typography hierarchy, density, spacing, surfaces, borders, elevation, imagery, iconography, data visualization, and motion. Explain the purpose of notable choices.>

## Reusable interaction patterns

<Only patterns justified by multiple screens, such as forms, filters, dialogs, lists, tables, feedback, or navigation. Define their states and behavior.>

## AI experience

<Only when AI is part of the product: purpose, invocation, processing feedback, presentation, uncertainty, correction/override, incomplete and failed output, and confirmation before consequential actions.>

## Acceptance signals

<Observable signs that the critical journey, hierarchy, responsive behavior, and essential states preserve this specification.>
```

## Quality bar

- Give every major element a job in a user journey. Prefer clarity, hierarchy, consistency, and simplicity over decoration, density, novelty, or quantity.
- Establish visual direction from the product, audience, brand, platform, emotional tone, and usability needs. Do not prescribe a fashionable aesthetic by default.
- Specify responsive behavior as changes in priority, layout, navigation, visibility, and interaction, not as "make it responsive."
- Cover asynchronous and consequential interactions beyond the happy path.
- Make AI a workflow capability, not a decorative chatbot. Distinguish generated output from verified information when that distinction matters.
- Reuse existing product patterns where they serve the experience. Do not redesign a working product merely to make the document look comprehensive.

## Handoff

After the UX specification is reviewed, the human invokes `/tech-spec` with `docs/ux-spec.md` available. That skill preserves this experience while deciding the simplest viable implementation. `/to-spec` can then capture the settled product and technical decisions in the configured issue tracker for `/to-tickets`.
