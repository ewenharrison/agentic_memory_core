# Session Initialisation Contract

Use this file to standardize how a new agent session should re-enter the memory system.

## Canonical Initialisation Command

`Initialise project <project-slug>`

Example:

`Initialise project healthcare_memory`

## Expected Agent Behavior

When the user gives the initialisation command, the agent should:

1. Open `memories/projects/<project-slug>/memory.md` first.
2. Open `memories/projects/<project-slug>/project.md` second.
3. Open `memories/projects/<project-slug>/approved/source-index.md` for evidence navigation.
4. Open `memories/projects/<project-slug>/auto/source-index.md` if Tier 2 is enabled or recent exploratory work matters.
5. Check `memories/projects/<project-slug>/logs/activity.md` for the latest operational changes.
6. Return a short rehydration summary covering:
   - current objective
   - key carried-forward claims
   - open loops
   - next actions
   - any important guardrails

## Purpose

This command means: "We are starting again. Reload the project context from the memory system before doing new work."

## Notes

- `memory.md` remains the primary quick-start file.
- `project.md` remains the slower-changing governance and structure file.
- `approved/` is canonical.
- `auto/` is provisional unless promoted.
- Prefer British English spelling in repo documentation and memory files where practical.
