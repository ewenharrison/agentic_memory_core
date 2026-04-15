# Project Registry

Use this file as the top-level directory of all projects in the memory system.

## Projects

- [sample-project](../projects/sample-project/project.md): Example project showing the two-tier structure.

Add real projects here in your private working repo.

## Project Creation Pattern

For each new project, create:

- `memories/projects/<project-slug>/init.md`
- `memories/projects/<project-slug>/memory.md`
- `memories/projects/<project-slug>/project.md`
- `memories/projects/<project-slug>/approved/source-index.md`
- `memories/projects/<project-slug>/auto/source-index.md`
- `memories/projects/<project-slug>/auto/autonomous-lane-policy.md` when Tier 2 is enabled proactively
- `memories/projects/<project-slug>/logs/activity.md`
- `memories/projects/<project-slug>/collab/teams-update.md` when Teams sharing is used
- `memories/projects/<project-slug>/sources/files/`
- `memories/projects/<project-slug>/sources/links/`
- `memories/projects/<project-slug>/inbox/`

## Standard Resume Flow

1. Open `memory.md`.
2. Check `project.md` if you need broader project structure or governance context.
3. Use `approved/source-index.md` to navigate to supporting evidence.

## Shared Procedure Rule

Repo-wide procedures should be updated in `memories/repo/shared-procedures.md` rather than copied into individual projects unless a project needs a local exception.
