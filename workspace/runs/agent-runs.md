# Agent Run Register

Use this register as the cross-project control surface for cloud and local agent runs.

GitHub Actions and pull requests are the execution/audit layer. This file records the working state: what ran, why, what it produced, what depends on it, and what human decision is still needed.

## Status Key

- `running`
- `pr_open`
- `merged`
- `closed`
- `needs_synthesis`
- `needs_review`
- `promoted`
- `superseded`

## Template

```text
### YYYY-MM-DD: Short Run Title

- Project:
- Agent mode:
- Trigger: manual / scheduled / local
- Input:
- GitHub Actions run:
- PR:
- Output note:
- Status:
- Depends on:
- Follow-up required:
- Final decision:
- Lesson:
```

## Runs

Add new runs below this line.
