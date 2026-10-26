# Administration

This guide defines the maintainer responsibilities for reviewing and distributing
packages in `lingex-public-data`. The repository distributes reviewed open-data and
ShareAlike packages; producing domains and Data Platform retain ownership of canonical
source data, provenance, processing, rights records and release preparation. Public Data
owns the approved package artifact and its distribution metadata.

## Package acceptance

Treat each package as an independent release with its own source identity, licence and
attribution. Do not infer a repository-wide licence. Before distribution, confirm that
the package has completed rights, privacy, security and technical review, and that its
included material is approved for public release. Keep private payloads, credentials,
proprietary material and unreviewed source bytes out of the repository.

Validate each package's `manifest.json` against
[`schemas/public-data-package-manifest.schema.json`](schemas/public-data-package-manifest.schema.json).
The manifest and package-local `LICENSE.txt`, `ATTRIBUTION.md` and `CHANGES.md` must
identify the release, source material, licence, attribution, changes, included files and
checksums, exclusions, and review evidence. Verify the listed files and checksums against
the package contents. A valid manifest records package facts; it does not replace the
required review decision.

## Distribution boundary

Keep package metadata and catalogue changes in Git. Distribute large release archives
through GitHub Releases rather than ordinary Git history. The repository is not a
request-time database or processing service and has no live server deployment role.

See [`PUBLIC.md`](PUBLIC.md) for the public package contract and [`AGENT.md`](AGENT.md)
for repository-specific contributor rules.
