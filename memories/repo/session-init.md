# Session Initialisation Contract

Use this file to standardize how a new agent session should re-enter the memory system.

## Canonical Initialisation Command

`Initialise project <project-slug>`

Example:

`Initialise project healthcare_memory`

## Personal Context Command

`Initialise personal context`

## Expected Agent Behavior

When the user gives the initialisation command, the agent should:

1. If `profile/context.md` exists, open it first.
2. Open `memories/projects/<project-slug>/memory.md`.
3. Open `memories/projects/<project-slug>/project.md`.
4. Open `memories/projects/<project-slug>/approved/source-index.md` for evidence navigation.
5. Open `memories/projects/<project-slug>/auto/source-index.md` if Tier 2 is enabled or recent exploratory work matters.
6. Check `memories/projects/<project-slug>/logs/activity.md` for the latest operational changes.
7. Return a short rehydration summary covering:
   - current objective
   - key carried-forward claims
   - open loops
   - next actions
   - any important guardrails

When the user gives `Initialise personal context`, the agent should:

1. Open `profile/context.md` first.
2. Open the remaining files listed in `profile/init.md`.
3. Return a short rehydration summary covering the most relevant personal-context facts, preferences, active notes, and privacy guardrails.

## Purpose

This command means: "We are starting again. Reload the project context from the memory system before doing new work."

## Notes

- `profile/context.md` is the optional global pre-project briefing file.
- `memory.md` remains the primary quick-start file.
- `project.md` remains the slower-changing governance and structure file.
- `approved/` is canonical.
- `auto/` is provisional unless promoted.
- Prefer British English spelling in repo documentation and memory files where practical.
