
# LingEx Public Data

`lingex-public-data` is the distribution repository for reviewed LingEx open-data and
ShareAlike release packages.

It is a publication/distribution boundary, not the canonical source-ingestion database, not a
general data-processing runtime and not a substitute for Data Platform provenance/rights
records.

## Package contract

Every published package has its own explicit identity, release version, source keys, material
type, licence, attribution, changes, included-file checksums, exclusions and review evidence.
There is no repository-wide data licence.

The machine-readable package contract is
`schemas/public-data-package-manifest.schema.json`. Package-local `manifest.json`,
`LICENSE.txt`, `ATTRIBUTION.md` and `CHANGES.md` carry the release-specific contract.

Only material that has passed rights, proprietary-exclusion, privacy, security and technical
review may be published. Rights are package/source specific and fail closed.

## Ownership boundary

Data Platform and other producing domains own canonical source data, provenance, processing and
release preparation. Public Data owns the reviewed public package artefact and distribution
metadata once approved for this repository.

Large release archives belong on GitHub Releases rather than in ordinary Git history. This
repository has no request-time database/runtime role and no live server deployment requirement
unless a future explicit distribution adapter is separately defined.
