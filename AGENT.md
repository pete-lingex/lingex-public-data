
# Repository Agent Notes

## Role

`lingex-public-data` is the public distribution boundary for reviewed open-data/ShareAlike
packages.

## Rules

- each package carries its own explicit licence, attribution, source identity and review
  evidence;
- never infer one repository-wide licence;
- only reviewed material may be published;
- package manifests must conform to
  `schemas/public-data-package-manifest.schema.json`;
- large archives belong in GitHub Releases;
- canonical ingestion/provenance/processing remains with Data Platform or the producing domain;
- this repository is not a request-time database/runtime service;
- credentials, private payloads, runtime output and unreviewed source bytes do not belong here;
- mutable work belongs in Work Tracker.

## Verification

Validate JSON/schema/catalogue inputs, inspect Git diff, and run `git diff --check`.
Before completion apply the current Work Tracker change-completion contract.
