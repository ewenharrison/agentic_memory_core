# Publishing `agentic_memory_core`

This folder is intended to become a clean standalone repo for the reusable Agentic Memory framework.

## Before Publishing

Check that the export contains only framework material:

- templates
- repo procedures
- workflows
- sample project
- generic scripts

Check that it does not contain:

- real project folders
- private notes
- local secrets
- institution-specific operational details you do not want to publish

## Recommended First Commit Scope

The first public commit should include:

- `README.md`
- `.gitignore`
- `memories/`
- `scripts/`
- this publishing guide

Keep the first commit simple and framework-focused.

## Local Git Setup

From inside the exported folder:

```powershell
git init -b main
git add .
git commit -m "Initial commit: agentic memory core framework"
```

## Create GitHub Repo

If you use GitHub CLI:

```powershell
gh repo create agentic_memory_core --public --source . --remote origin --push
```

If you prefer to create the repo on GitHub first:

```powershell
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

## Recommended Early Follow-Up

- add a licence
- add a short changelog or release notes file if you expect frequent framework updates
- document how changes are promoted from your private live repo into core

## Suggested Ongoing Workflow

1. Improve the framework in the private live repo.
2. Mark promising changes in `memories/repo/core-candidate-changes.md`.
3. Export a fresh core bundle.
4. Review the diff in the standalone core repo.
5. Commit only the reusable improvements.
