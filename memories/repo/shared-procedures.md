# Shared Project Procedures

Use this file as the canonical source for repo-wide project procedures.

If a procedure changes, update it here first and then only add project-specific exceptions inside the relevant project folder.

## Procedure Rule

- Shared operational procedures should live in this file or another repo-level procedure file under `memories/repo/`.
- Projects should link to shared procedures rather than duplicating them where possible.
- Project files should only contain local exceptions, project-specific permissions, or project-specific context.

## Session Re-entry

- Use `Initialise project <project-slug>` to restart a project cleanly in a new session.
- Follow the read order defined in [session-init.md](./session-init.md).
- Return a short rehydration summary covering objective, carried-forward claims, open loops, next actions, and guardrails.

## Working Memory Rule

- `memory.md` is the primary quick-start briefing for every project.
- `project.md` is for slower-changing structure, goals, decisions, and governance.
- `approved/` is canonical.
- `auto/` is provisional unless promoted.

## Tier 2 Rule

- If Tier 2 is enabled proactively, record its permission and limits in `auto/autonomous-lane-policy.md`.
- Tier 2 may support `memory.md`, but its outputs must remain clearly provisional until reviewed or promoted.

## Teams Posting Rule

- Collaborator-facing Teams updates should live in `collab/teams-update.md`.
- Default to the adaptive-card webhook workflow supported by `scripts/post-teams-update.ps1`.
- Do not switch to plain text unless there is a clear endpoint-specific reason.

## Writing Convention

- Prefer British English spelling in repo documentation and project memory files where practical.
- Use project-specific language only when needed for fidelity.

## Core Promotion Rule

- Treat this private repo as the proving ground for framework ideas.
- Record reusable framework improvements in [core-candidate-changes.md](./core-candidate-changes.md).
- Use [core-promotion.md](./core-promotion.md) as the decision rule for what should move into `agentic_memory_core`.
- Do not promote real project content, private operational details, or unstable experiments by default.
