# Tier 2 Workflow: Agentic

Use this workflow when you want autonomous capture and organization.

## Default Behavior

- Raw source goes into `sources/`
- Agent writes notes into `auto/`
- Agent may update `memory.md` with clearly bounded current-state changes
- Agent may maintain indexes and activity logs automatically
- Approved memory remains untouched unless you explicitly ask for promotion

## Agent Responsibilities

1. Record source metadata.
2. Generate a structured source note.
3. Add tags, cross-links, and related project references where helpful.
4. Update `auto/source-index.md`.
5. Update `memory.md` when the project snapshot has meaningfully changed.
6. Log major actions in `logs/activity.md`.

When updating `memory.md`, always link source entries to the local note or downloaded file.

## Human Responsibilities

1. Periodically review `auto/`.
2. Promote useful material into `approved/` when appropriate.

## Promotion Rule

Autonomous memory is useful working memory, but it should not be treated as trusted canonical memory until you promote it.
