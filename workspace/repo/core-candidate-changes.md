# Core Candidate Changes

Use this file as the running shortlist of framework improvements that may be promoted to `agentic_workspace_core`.

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

### 2026-04-22: use `working/` as the Tier 1 pre-approved workspace
- Status: `Promote now`
- Why: `working/` better captures the actual role of pre-approved drafts, concept notes, search strategies, figures, and structured notes, while `sources/` remains the raw intake layer.
- Evidence: migrated across all live project folders and repo-level docs.

### 2026-04-22: Context Scout and Synthesis Agent modes
- Status: `Promote now`
- Why: reusable agent roles make Tier 2 more explicit while avoiding overclaiming that repo-context scanning is external literature search.
- Evidence: prompt templates exist and `run-tier2-cloud-task.ps1` can resolve `general`, `context_scout`, and `synthesis_agent` modes.
- Evidence: the core manual workflow now exposes `agent_mode`.

### 2026-04-22: separate literature-search protocol from cloud agent modes
- Status: `Promote now`
- Why: real literature retrieval needs explicit search execution, search-result files, and source counts rather than prompt-only cloud synthesis.
- Evidence: the project exposed a failure mode where a PubMed search strategy was sent to a context-only agent mode.

### 2026-04-22: cross-project agent run register
- Status: `Promote now`
- Why: multi-agent PR workflows need a readable project-control surface beyond GitHub's PR list.
- Evidence: scheduled sample-project PRs and healthcare scout/synthesis handoffs became hard to track without an explicit register.

### 2026-04-22: Markdown-to-Word export routine
- Status: `Promote now`
- Why: a Pandoc-backed Word export rule is reusable for concept notes and collaborator-facing drafts.
- Evidence: the script and documentation are generic enough for core export.

### 2026-04-22: Tier 2 LLM-as-judge relevance control
- Status: `Watch`
- Why: potentially useful for literature-heavy projects, but not yet implemented or designed enough for a core feature.
- Evidence: captured as a future requirement in the Tier 2 workflow.

## How To Use This File

- Add one short entry when a new repo-level pattern emerges.
- Prefer decisions based on repeated use, not first impressions.
- Remove or downgrade entries if later experience suggests they were too local or too fragile.
