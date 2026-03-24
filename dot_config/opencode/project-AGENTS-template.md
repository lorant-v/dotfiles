# AGENTS.md

## Purpose

- Keep changes minimal, safe, and easy to review.
- Follow the conventions already established in this repository.
- Prefer targeted fixes over unrelated cleanup.

## Working Style

- Start by understanding the goal, constraints, and acceptance criteria.
- Inspect existing code and docs before introducing new patterns.
- Ask only when blocked by ambiguity, missing credentials, or a risky irreversible action.
- Do not make destructive changes unless explicitly requested.

## Editing Rules

- Make the smallest safe change that solves the problem.
- Preserve local style, structure, and naming conventions.
- Avoid unrelated refactors in the same change.
- Prefer reviewable diffs over full-file rewrites.
- Add comments only when they clarify non-obvious logic.

## Validation

Run the smallest relevant checks after changes:

1. Repo-specific quick diff or dry-run checks
2. Lint or format checks for touched files when applicable
3. Tests, typecheck, or build only when relevant to the change

- If a check cannot run in the current environment, report that clearly and give a manual verification step.

## Continuity

For multi-step or long-running tasks, maintain a single continuity file for this workspace: `.opencode/CONTINUITY.md`.
`.opencode/CONTINUITY.md` is the canonical briefing for current task state; do not rely on earlier chat or tool output unless it is reflected there.

### Operating rule
- At the start of each assistant turn for an active multi-step task, read `.opencode/CONTINUITY.md` before acting.
- Update `.opencode/CONTINUITY.md` only when there is a meaningful delta in goals, constraints, decisions, current state, open questions, working set, or important tool outcomes.
- Keep it factual, brief, and high-signal.
- Do not store raw logs or long transcripts there.

### Suggested sections
- `Goal`
- `Constraints`
- `Decisions`
- `Current State`
- `Next Steps`
- `Open Questions`

### Anti-drift rules
- Facts only, no transcripts.
- Every entry must include:
  - a date or ISO timestamp (e.g., `2026-01-13` or `2026-01-13T09:42Z`)
  - a provenance tag: `[USER]`, `[CODE]`, `[TOOL]`, `[ASSUMPTION]`
- If unknown, write `UNCONFIRMED` (never guess). If something changes, supersede it explicitly (don't silently rewrite history).

### Plan tool vs ledger
- Use the available planning or task-tracking tool for short-term execution scaffolding (3-7 steps).
- Use `.opencode/CONTINUITY.md` for long-running continuity ("what/why/current state"), not micro task lists.
- Keep them consistent at the intent/progress level.

## Secrets and Safety

- Never print secrets, tokens, private keys, or credentials.
- Do not ask users to paste secrets unless strictly necessary.
- Avoid commands that may expose sensitive local data.
- Prefer existing authenticated tooling where available.

## Git Guidance

- Do not revert user changes you did not make unless explicitly asked.
- Avoid destructive git commands unless explicitly requested.
- Keep commits focused and scoped to the task.
- Follow this repository's commit message conventions; if none are documented, use Conventional Commits.

## Repo-Specific Notes

- Add project structure, important commands, environment notes, or validation steps here.
- Add language or framework-specific guidance here.
- Add deployment, container, or release workflow notes here only if they are actually used in this repository.
