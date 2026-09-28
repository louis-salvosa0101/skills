---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

Before modifying project files, read the repository's `AGENTS.md` or `CLAUDE.md` instructions and run this Git preflight:

```text
git status
git branch --show-current
git log -1 --oneline
```

Also inspect `git branch` and `git remote -v` when branch selection or the task's issue reference makes them relevant. Show the user a concise summary of the current branch, working-tree state, task, and branch decision before changing branches.

For meaningful implementation work, use a dedicated branch unless the project instructions or the user explicitly say otherwise. Follow any repository-specific branch convention first. Otherwise derive a concise lowercase kebab-case name from the task:

- `feature/<task-name>` for features
- `fix/<task-name>` for bugs
- `refactor/<task-name>` for refactors
- `docs/<task-name>` for documentation work

Include the issue number when that is the repository's convention, for example `feature/42-user-authentication`. Avoid generic names such as `branch1`, `test`, `new-feature`, `my-branch`, or `changes`.

Do not require a dedicated branch for an extremely small typo or documentation correction when project instructions do not require one. Meaningful features, bug fixes, UI, database, API, authentication, dependency, refactoring, and multi-file changes should use one. Keep one implementation task per branch and avoid having multiple agents share a feature branch unless the project explicitly requires it.

### Safe branch decision

- If the current branch already matches the task, continue there. Do not switch or recreate it unnecessarily.
- If the current branch is `main` and the task is meaningful, stop before code changes and recommend a branch. Ask for approval before creating or switching to it. Do not silently create a branch.
- If an appropriate local branch already exists, recommend switching to it rather than inventing a suffixed duplicate. If only the remote branch exists, explain the tracking checkout you propose and ask for approval.
- If the working tree has uncommitted changes, show the affected paths and do not discard, reset, clean, stash, overwrite, or switch branches automatically. Ask the user to commit, stash, or otherwise resolve the changes first, unless the current branch is already the clearly appropriate branch and no switch is needed.
- When a new branch should start from `main`, verify the working tree is clean, verify the remote exists, and then show the exact safe plan before running it. After approval, use the repository's convention, normally:

  ```text
  git switch main
  git pull --ff-only origin main
  git switch -c feature/<task-name>
  ```

  Do not pull blindly when there is no `origin`, the remote state is unclear, or local work would be affected.
- Never automatically run `git push --force`, `git push -f`, `git reset --hard`, or `git clean -fd`. Do not use destructive Git operations as part of normal branch setup.

For a GitHub Issue or ticket, keep the issue, branch, commit, and eventual Pull Request visibly connected. Warn when the task will touch files likely to be shared with another active task, and keep changes scoped to the assigned task.

Use /tdd where possible, at pre-agreed seams.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, use /code-review to review the work.

Commit your work to the approved task branch, or to the current branch when the task is explicitly allowed there.
