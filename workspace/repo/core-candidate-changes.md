# Core Candidate Changes

Use this file as the running shortlist of framework improvements that may be promoted to `agentic_memory_core`.

## Status Key

- `Promote now`: mature and reusable
- `Watch`: promising, but should prove itself further
- `Keep private`: useful locally, but not suitable for core

## Current Candidates

### 2026-04-15: `init.md` as a standard project bootstrap
- Status: `Promote now`
- Why: this improves project rehydration for any project and is already reusable.
- Evidence: used successfully across multiple projects.

### 2026-04-15: `memory.md` as the default first-stop briefing file
- Status: `Promote now`
- Why: the split between fast briefing and slower project governance is one of the strongest framework decisions so far.
- Evidence: now embedded consistently across the repo structure.

### 2026-04-15: shared repo procedures centralised in `workspace/repo/shared-procedures.md`
- Status: `Promote now`
- Why: this reduces duplication and makes framework evolution easier.
- Evidence: already supports multiple projects cleanly.

### 2026-04-15: explicit `auto/autonomous-lane-policy.md` for proactive Tier 2 use
- Status: `Promote now`
- Why: it creates a clear boundary around autonomous behaviour and permissions.
- Evidence: reusable across any project that enables Tier 2.

### 2026-04-15: collaborator updates stored at `collab/teams-update.md`
- Status: `Watch`
- Why: the location is sensible, but the Teams-specific wording may later broaden into a more general collaborator update pattern.
- Evidence: useful in practice, but not yet proven outside the current setup.

### 2026-04-15: adaptive-card Teams webhook default
- Status: `Keep private`
- Why: this is an environment-specific operational detail rather than a universal framework default.
- Evidence: valuable here, but too implementation-specific for the core repo unless the public repo is explicitly Teams-oriented.

### 2026-04-15: GitHub helper script
- Status: `Watch`
- Why: useful operationally, but may need cleanup and clearer scope before inclusion in a public core repo.
- Evidence: could be useful, but should mature before promotion.

### 2026-04-16: top-level `profile/` layer for personal context
- Status: `Promote now`
- Why: the separation between user-level context and project memory is now considered a core-worthy framework feature rather than a local experiment.
- Evidence: implemented with explicit session-init rules, privacy guardrails, and reusable command/documentation support across the live repo.

## How To Use This File

- Add one short entry when a new repo-level pattern emerges.
- Prefer decisions based on repeated use, not first impressions.
- Remove or downgrade entries if later experience suggests they were too local or too fragile.
