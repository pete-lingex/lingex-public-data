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

## Mac SSH Access

To reach the LingEx Krystal server from the Mac:

- use the SSH alias `lingex-krystal`
- rely on the existing macOS SSH agent and Keychain
- do not enable SSH agent forwarding
- do not read, print, copy, or modify private keys, and do not ask for any passphrase
- from `~/Dropbox/Lingex Ltd/apps/lingex/`, the LingEx SSH notes live at `../../SSH Details/`

Preferred command forms:

```bash
ssh lingex-krystal
ssh -o BatchMode=yes lingex-krystal '...'
```

## Command Assumptions

When giving LingEx commands to Pete, or when executing them directly, AIs can rely on:

- local Mac repo root: `~/Dropbox/Lingex Ltd/apps/lingex/repositories`
- server LingEx root: `$HOME/lingex`
- server repo root: `$HOME/lingex/repositories`
- server live root: `$HOME/lingex/live`
- server logs root: `$HOME/lingex/logs`
- server runtime root: `$HOME/lingex/runtime`
- server releases root: `$HOME/lingex/releases`
- server backups root: `$HOME/lingex/backups`

Most deploy scripts follow:

```bash
LINGEX_ROOT="${LINGEX_ROOT:-$HOME/lingex}"
```

Useful override variables when a documented script supports them:

- `LINGEX_ROOT`
- `LINGEX_LOG_ROOT`
- `LINGEX_RUNTIME_ROOT`
- `LINGEX_RELEASES_ROOT`
- `LINGEX_BACKUPS_ROOT`

## Server SSH Rules

- inspect before changing anything
- use the workflow: edit locally -> test locally -> commit -> push -> inspect server -> `git pull --ff-only` -> deploy or migrate only when required -> verify with curl
- avoid `git reset`, `git clean`, forced checkout, forced push, automatic stash, or automatic conflict resolution
- prefer non-interactive commands and `BatchMode=yes` when practical
- on the Krystal host, do not assume PHP can launch subprocesses; `proc_open` is unavailable
- when a workflow needs shell orchestration, prefer the documented Bash wrapper instead of a PHP wrapper
- keep runtime writes out of repository working trees

## ChatGPT Project-Source Policy

This repo should record its ChatGPT project-source manifest or manifest policy in-repo.

Placeholder for this repo:

- manifest item 1: this file, `AGENT.md`
- canonical manifest file: `TODO`
- pack contract doc: `TODO`
- include rules: `TODO`
- exclusion rules: `TODO`
- refresh or generation command: `TODO`
