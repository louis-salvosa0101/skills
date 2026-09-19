Skills are organized into two bucket folders under `skills/`:

- `engineering/`: daily code work
- `productivity/`: daily non-code workflow tools

Every skill in either bucket must be listed in the top-level `README.md`, its bucket `README.md`, and `.claude-plugin/plugin.json` when it is promoted for plugin distribution. Every skill has a human-facing page under `docs/<bucket>/<skill-name>.md`.

Install commands are copied verbatim from [.agents/install-block.md](./.agents/install-block.md). `.claude-plugin/marketplace.json` makes the repo its own single-plugin marketplace. Run `claude plugin validate . --strict` after touching either manifest.

Every `SKILL.md` is either user-invoked (`disable-model-invocation: true` plus `policy.allow_implicit_invocation: false` in `agents/openai.yaml`) or model-invoked. See [.agents/invocation.md](./.agents/invocation.md).

[`workflow-router`](./skills/engineering/workflow-router/SKILL.md) is the router that maps every user-reachable skill and how they relate. Whenever a user-reachable skill is added, renamed, removed, or moved in the flow, update the router and its docs page.

To link every skill into the local harness skill directories, run `scripts/link-skills.sh`.

No em-dashes anywhere in this repo's prose. Rewrite them with punctuation or conjunctions instead.
