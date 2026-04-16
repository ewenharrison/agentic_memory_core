# Agentic Memory Core

`agentic_memory_core` is a reusable file-system framework for running project-based human-and-agent memory safely.

It also supports an optional top-level personal-context layer at `profile/` for durable user-level preferences, writing style, and other cross-project context.

It is designed for people who want:

- one folder per project
- a clear split between trusted memory and provisional agent output
- lightweight session rehydration
- reusable templates for notes, source summaries, and project state

## What This Repo Is

This repo contains the reusable structure only.

It is intended to be copied, forked, or adapted into a private working repo where real projects live.

The design centres on three ideas:

- `memory.md` is the fast briefing file for resuming work
- `project.md` holds slower-changing goals, decisions, and governance
- `approved/` and `auto/` stay separate so reviewed knowledge and exploratory agent output do not get mixed together

## Folder Layout

```text
profile/
  init.md
  context.md
  identity.md
  preferences.md
  writing_style.md
  relationships.md
  active_notes.md
  approved/
    source-index.md
  auto/
    source-index.md
  logs/
    activity.md
  sources/
    files/
    links/
memories/
  _templates/
  projects/
    sample-project/
  registry/
  repo/
  workflows/
scripts/
README.md
```

## Core Concepts

### `memory.md`

The first file to open when resuming a project.
It should stay compact and answer:

- what are we doing?
- what claims are we carrying forward?
- what is still open?
- what should happen next?

### `profile/context.md`

The first file to open when loading user-level personal context.
Use it for:

- durable cross-project facts
- writing or collaboration preferences
- active notes that matter across current work
- guardrails around how personal context should be used

### `project.md`

The slower-moving project record.
Use it for:

- overview
- scope
- goals
- active tasks
- decisions
- open questions
- important sources

### `approved/`

The trusted layer.
Use it for reviewed source notes and durable project knowledge.

### `auto/`

The exploratory lane.
Use it for agent-generated summaries, rough synthesis, and provisional material that has not yet been promoted.

## Recommended Workflow

1. Create a new project from the sample structure.
2. Add material to the project.
3. Summarise or structure it into `inbox/`, `approved/`, or `auto/` depending on trust level.
4. Keep `memory.md` current so future sessions can restart quickly.
5. Promote only reviewed material into the canonical layer.

## Included in Core

- reusable templates
- shared repo procedures
- workflow notes
- a sample project
- utility scripts that are generic enough to reuse

## Not Included in Core

- real project folders
- private notes or source material
- local configuration and secrets
- project-specific operational details that are not general defaults

## Suggested Use

- keep this repo as the clean framework
- maintain your real work in a separate private repo
- promote framework improvements back into core only when they are reusable

## Session Initialisation

Use:

`Initialise project <project-slug>`

The standard read order is:

1. `profile/context.md` if present
2. `memory.md`
3. `project.md`
4. `approved/source-index.md`
5. `auto/source-index.md`
6. `logs/activity.md`

To load only the personal-context layer, use:

`Initialise personal context`

When the `profile/` layer is in use, you can also say:

- `Save this to personal context`
- `Save this to personal context as approved`
- `Do not use personal context for this task`

## Writing Convention

Prefer British English spelling in repo documentation where practical.

## Current Status

This repo is the reusable scaffold for the broader Agentic Memory approach.
It is meant to stay small, clear, and safe to share.
