# Core Promotion Workflow

Use this file to manage what should move from the private live repo into `agentic_memory_core`.

## Purpose

The private repo is the proving ground.
The core repo is the reusable public-safe framework.

Changes should usually be developed and tested here first, then promoted only once they feel stable across real project use.

## Promotion Rule

Promote a change to `agentic_memory_core` when it:

- improves the workflow for more than one project
- is not tied to a specific domain, source, collaborator, or institution
- does not expose private project content
- is stable enough that you would want it in a starter version of the system

Keep a change private when it:

- only helps one project
- includes real project notes, sources, or sensitive context
- is still experimental or likely to change again soon
- reflects a personal preference that should not become a default

## Working Rhythm

1. Prototype a change in the private repo.
2. Let it survive at least one real use case where possible.
3. Record it in [core-candidate-changes.md](./core-candidate-changes.md).
4. Mark it as:
   - `Promote now`
   - `Watch`
   - `Keep private`
5. When ready, export the framework-only subset with:

`powershell -ExecutionPolicy Bypass -File .\scripts\export-agentic-memory-core.ps1`

## Agent Behaviour

When making repo-level improvements, the agent should:

- decide whether the change looks `core-worthy`
- add or update an entry in [core-candidate-changes.md](./core-candidate-changes.md)
- include a short recommendation on whether to promote now or wait
- avoid marking project-specific content as a core candidate

## Suggested Commit Prefixes

- `core:` reusable framework change that is a likely promotion candidate
- `repo:` private operational change for this live repo
- `project:` change tied to one specific project

Examples:

- `core: add project init bootstrap file`
- `core: refine memory snapshot structure`
- `repo: add export script for public-safe core bundle`
- `project: add awaab_law landscape note`

## Export Scope

The export script currently treats these as core material:

- `README.md`
- `memories/_templates/`
- `memories/repo/`
- `memories/workflows/`
- `memories/registry/`
- `memories/projects/sample-project/`
- selected generic scripts

Real project folders under `memories/projects/` are not exported unless explicitly added to the allowlist.
