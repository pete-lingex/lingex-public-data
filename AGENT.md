# Repository Agent Notes

## Repository System

All LingEx repositories live on the production server under:

```text
$HOME/lingex/repositories
```

If a repository deploys something live, it should provide a deploy script that publishes into:

```text
$HOME/lingex/live
```

The expected pattern is:

- repo source lives under `$HOME/lingex/repositories/<repo-name>`
- live output, if any, lives under `$HOME/lingex/live/<target>`

## Mac Development Layout

The source repositories are managed from a Mac at:

```text
~/Dropbox/Lingex Ltd/apps/lingex/repositories
```

Within that root, repositories are grouped by category:

- `repos—web/`
- `repos—mobile apps/`
- `repos—desktop apps/`
- `repos—general/`

Agents should preserve this grouped local layout and should not assume a flat local repository directory.

## Deployment Guidance

No repository-local live deploy script is currently identified in this checkout.

When working in this repository:

- do not assume this repo publishes directly into `$HOME/lingex/live`
- avoid hardcoding Mac-local paths into runtime code
- prefer environment-based or repo-relative path resolution over machine-specific assumptions

## Change Safety

- keep server layout assumptions explicit
- keep deploy behavior documented in-repo
- avoid introducing coupling to unrelated repositories unless it is part of a documented contract

## ChatGPT Project-Source Policy

This repo should record its ChatGPT project-source manifest or manifest policy in-repo.

Placeholder for this repo:

- canonical manifest file: `TODO`
- pack contract doc: `TODO`
- include rules: `TODO`
- exclusion rules: `TODO`
- refresh or generation command: `TODO`
