# Literature Search Protocol

Use this protocol when a task requires real external literature retrieval.

The current Tier 2 cloud runner does not search PubMed, Crossref, Semantic Scholar, journal websites, or the open web. It can only reason over supplied repo context. A search strategy file is therefore not enough: an executed search must produce a separate search-results file.

## Required Separation

Keep search planning and search execution separate.

Recommended filenames:

- `working/search-strategy-<topic>.md`
- `working/search-results-<topic>.md`

## Search Strategy File

The strategy file should include:

- research question or review aim
- databases or venues to search
- exact Boolean strings
- MeSH or controlled-vocabulary terms where relevant
- inclusion and exclusion criteria
- priority venues or journals
- planned screening categories

## Search Results File

The results file should include:

- search date
- person or agent who ran the search
- database or source searched
- exact query used
- hit count where available
- filters used
- candidate records with title, authors, year, venue, DOI/PMID/URL where available
- short inclusion rationale
- exclusion rationale for near-misses
- whether each source is directly on-point, adjacent but useful, or background only

## Agent Handoff

Only after a search-results file exists should the material be passed to a `Synthesis Agent`.

The Synthesis Agent should be asked to integrate a named results file, not merely a search strategy.

Example:

```text
Act as Synthesis Agent. Use workspace/projects/<project>/working/search-results-<topic>.md as the input evidence. Integrate the findings with memory.md, project.md, approved notes, and current open questions. Do not promote anything directly to approved memory.
```

## Capability Boundary

- `context_scout`: scans existing repo context only.
- `synthesis_agent`: integrates supplied context and search results.
- `literature_scout`: reserved for a future workflow that can actually retrieve external literature.

Until an external-search workflow exists, do not trigger `literature_scout` as a cloud mode.

## Guardrail

If a note claims to have run a literature search but lists only repo files as evidence, treat it as a context-scout note, not as search results.
