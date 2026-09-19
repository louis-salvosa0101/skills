# Ship the skill set as a native Claude Code plugin; defer a native Codex plugin

These skills have always been installable via [skills.sh](https://skills.sh/louis-salvosa0101/agentic-coding-skills) (`npx skills add louis-salvosa0101/agentic-coding-skills`), which copies editable skill files into a user's project across Claude Code, Codex, and other Agent-Skills-standard harnesses. A recurring request is a **plug-and-play** distribution: subscribe to the set as a read-only, always-current bundle you don't edit, rather than a fork you own. That is exactly what native plugin systems provide.

We ship a native **Claude Code plugin** and, for now, **defer** a native **Codex plugin**. The split is forced by how each ecosystem's plugin manifest selects skills, against this repo's bucketed layout.

## The constraint: bucketed skills vs. single-path selection

Skills live in two bucket folders under `skills/`: `engineering/` and `productivity/`. The plugin exposes both buckets.

- **Claude Code**: `.claude-plugin/plugin.json` accepts `skills` as an **array of explicit skill-directory paths**. We list the promoted skills one by one, exclude everything else with zero ambiguity, and add `.claude-plugin/marketplace.json` so the repo is its own single-plugin marketplace. Verified end to end: `claude plugin validate . --strict` passes, and `marketplace add` → `install` resolves all promoted skills.

- **Codex**: `.codex-plugin/plugin.json` accepts `skills` only as a **single path string** (arrays are rejected with `missing or invalid plugin.json`), and Codex discovers `SKILL.md` files recursively under it. There is no way to name two bucket folders, or to curate a subset, from one path. Two escape hatches were tested and rejected:
  - Pointing at `./skills/` ships the two maintained skill buckets.
  - A curated flat directory of **symlinks** into the buckets does not survive install: Codex copies the plugin tree into its cache and **drops symlinks**, so the skills arrive empty.

The repository now contains only the two shipped buckets, so a single recursive skill path is sufficient for harnesses that need one.

## Decision

- Ship the **Claude Code plugin** now (`.claude-plugin/plugin.json` + `.claude-plugin/marketplace.json`), curated to the promoted set, as the headline v1.2 deliverable.
- Keep **skills.sh** as the universal installer: it already serves Codex and other harnesses today, so no Codex user is left without an install path.
- **Defer** the native Codex plugin until we decide between restructuring `skills/` to promoted-only vs. committing a generated flat copy. Revisit when Codex either supports a `skills` array / include-list or preserves symlinks on install.

## Invariants this creates

- Every promoted skill has an entry in `.claude-plugin/plugin.json`'s `skills` array (this already stood as a `CLAUDE.md` rule; it now also gates the plugin's contents).
- `.claude-plugin/plugin.json`'s `version` tracks `package.json`'s version: bump both together on release. Claude uses the plugin `version` to decide when installed users see an update.

## Update, 2026-08-05

`agentic-coding-skills` was accepted into **Claude Code's official marketplace** (configured name `claude-plugins-official`, source repo `anthropics/claude-plugins-official`), which every Claude Code install has by default. `claude plugins install agentic-coding-skills` is now the documented route, and the `marketplace add` → `install` path above is superseded. The install wording lives in [.agents/install-block.md](../install-block.md).

The official listing points at this repo's git URL and reads `.claude-plugin/plugin.json` directly, so it does not depend on `.claude-plugin/marketplace.json`. That file is retained only as a fallback for installing the repo directly (an unreleased commit, or a fork).

Verified 2026-08-05, on Claude Code 2.1.222, against the live listing:

- `claude plugins install agentic-coding-skills` resolves with no marketplace added first, and reports `agentic-coding-skills@claude-plugins-official`.
- `claude plugin details agentic-coding-skills` then reports version 1.2.0 and loads the promoted skills.
- The listing's `source` is `{"source": "url", "url": "https://github.com/louis-salvosa0101/agentic-coding-skills.git", "sha": …}`: the **sha is pinned**, so a release reaches installed users when that pin moves, not the moment we tag. At the time of writing the pin sits two commits behind `main`, which is why it lists 22 skills rather than the 24 in `plugin.json`.
- The in-session `/plugin install agentic-coding-skills` was **not** exercised: `/plugin` is unavailable in headless (`claude -p`) sessions. It runs the same resolver as the CLI, and the documented example form is `/plugin install <name>@claude-plugins-official`.
