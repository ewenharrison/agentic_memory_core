# Agentic Memory Core

`agentic_workspace_core` is a reusable file-system framework for running project-based human-and-agent memory safely.

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
workspace/
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

### `working/`

The pre-approved Tier 1 workspace.
Use it for:

- draft source notes and summaries
- concept notes, search strategies, figures, and export-ready working documents
- material that has been structured but not yet promoted into canonical memory

Search strategies and executed search results should be stored as separate working files so it is clear whether a search has actually been run.

Example pattern:

- `working/search-strategy-<topic>.md`
- `working/search-results-<topic>.md`

First-pass search summaries and candidate bibliography notes should also stay in `working/` or `auto/` until explicitly promoted. Do not put search-derived summaries directly into `approved/` just because they are tidy or well cited.

### `workspace/runs/agent-runs.md`

The cross-project control surface for agent runs.
Use it to track:

- cloud or local agent runs
- input files or prompts
- generated pull requests or notes
- dependencies between scout, search, and synthesis steps
- final decisions such as merged, closed, superseded, or promoted

GitHub remains the audit layer, but the run register should be the human-readable workflow state.

### `approved/`

The trusted layer.
Use it for reviewed source notes and durable project knowledge.

`approved/` means human-reviewed canonical memory. Raw user-provided files can live in `sources/`, but an agent summary of them is not approved until reviewed or explicitly requested as an approved note.

### `auto/`

The exploratory lane.
Use it for agent-generated summaries, rough synthesis, and provisional material that has not yet been promoted.

## Recommended Workflow

1. Create a new project from the sample structure.
2. Add material to the project.
3. Summarise or structure it into `working/`, `approved/`, or `auto/` depending on trust level.
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

## Cloud Tier 2 Workflow

Core includes a manual-only GitHub Actions workflow for cloud-triggered Tier 2 maintenance:

- `.github/workflows/tier2-cloud-maintenance.yml`
- `scripts/run-tier2-cloud-task.ps1`

It is intentionally exported without a scheduled trigger.

To use it:

1. Add `OPENAI_API_KEY` as a repository secret.
2. Optionally add repository variables:
   - `OPENAI_MODEL`
   - `OPENAI_REASONING_EFFORT`
3. Trigger `Tier 2 Cloud Maintenance` manually from the Actions tab.

If you want automatic runs in your own private repo, add a `schedule:` block to the workflow after forking or copying the framework.

## Suggested Use

- keep this repo as the clean framework
- maintain your real work in a separate private repo
- promote framework improvements back into core only when they are reusable

## Session Initialisation

Use:

`Initialise project <project-slug>`

The standard read order is:

1. `profile/context.md` if present
2. `workspace/repo/shared-procedures.md`
3. task-relevant repo procedures, such as `workspace/repo/literature-search-protocol.md` for web, literature, journal, or URL access work
4. `memory.md`
5. `project.md`
6. `approved/source-index.md`
7. `auto/source-index.md`
8. `logs/activity.md`

The rehydration summary should state which repo-level procedures were loaded. If a public URL appears inaccessible, follow the literature-search protocol before concluding it is unavailable: try materially different access routes and distinguish content-level failures from sandbox, proxy, TLS, or client failures.

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
