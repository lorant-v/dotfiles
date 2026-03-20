---
description: Draft a Conventional Commit message for current changes
agent: reviewer
subtask: true
---
Review the current repository changes and draft the best Conventional Commit message.

Use git status, diff, and recent commit history if helpful.
Return:
- one recommended commit subject
- an optional longer body only if it adds real value
- one or two fallback subject lines if the change could be categorized differently

Extra context: $ARGUMENTS
