# Agentic Coding Skills

A complete, project-neutral collection of engineering and productivity skills for coding agents.

## Engineering

### User-invoked

- [workflow-router](./skills/engineering/workflow-router/SKILL.md): route a request to the right flow.
- [grill-with-docs](./skills/engineering/grill-with-docs/SKILL.md): clarify a change while updating project language and decisions.
- [triage](./skills/engineering/triage/SKILL.md): turn incoming issues into agent-ready work.
- [wayfinder](./skills/engineering/wayfinder/SKILL.md): plan a large, multi-session effort.
- [setup-skills](./skills/engineering/setup-skills/SKILL.md): configure the project tracker and documentation layout.
- [to-spec](./skills/engineering/to-spec/SKILL.md): turn conversation into a specification.
- [to-tickets](./skills/engineering/to-tickets/SKILL.md): split a specification into blocking implementation tickets.
- [implement](./skills/engineering/implement/SKILL.md): implement tickets through vertical slices and review.
- [improve-codebase-architecture](./skills/engineering/improve-codebase-architecture/SKILL.md): find high-leverage architecture improvements.
- [v0-app-prompt](./skills/engineering/v0-app-prompt/SKILL.md): create structured v0 implementation prompts.

### Model-invoked

- [prototype](./skills/engineering/prototype/SKILL.md): answer design questions with throwaway code.
- [diagnosing-bugs](./skills/engineering/diagnosing-bugs/SKILL.md): diagnose hard bugs through tight feedback loops.
- [research](./skills/engineering/research/SKILL.md): investigate questions against primary sources.
- [tdd](./skills/engineering/tdd/SKILL.md): build vertical slices with red-green-refactor.
- [domain-modeling](./skills/engineering/domain-modeling/SKILL.md): sharpen domain language and ADRs.
- [codebase-design](./skills/engineering/codebase-design/SKILL.md): design deep modules and clean seams.
- [code-review](./skills/engineering/code-review/SKILL.md): review standards and specification compliance.
- [resolving-merge-conflicts](./skills/engineering/resolving-merge-conflicts/SKILL.md): resolve conflicts by intent.
- [wizard](./skills/engineering/wizard/SKILL.md): generate interactive procedures for human-only steps.

## Productivity

### User-invoked

- [grill-me](./skills/productivity/grill-me/SKILL.md): interview a plan without writing repository docs.
- [handoff](./skills/productivity/handoff/SKILL.md): write a portable handoff for another session.
- [teach](./skills/productivity/teach/SKILL.md): learn a concept over multiple sessions.
- [to-questionnaire](./skills/productivity/to-questionnaire/SKILL.md): prepare questions for another decision-maker.
- [wait-what](./skills/productivity/wait-what/SKILL.md): re-explain a message that did not land.

### Model-invoked

- [grilling](./skills/productivity/grilling/SKILL.md): stress-test a plan, decision, or idea.
- [writing-for-agents](./skills/productivity/writing-for-agents/SKILL.md): write skills and other agent-facing documents.

## Installation

```bash
npx skills@latest add louis-salvosa0101/agentic-coding-skills
```

Run `/setup-skills` once per project before using the engineering workflow.
