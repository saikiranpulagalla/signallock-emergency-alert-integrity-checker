# SignalLock Final Hackathon Release Report

## Artifact

- Filename: `signallock-ai-hackathon-final-v0.12.4.zip`
- Version: `0.12.4`
- Original ZIP SHA-256: `3ae6706b77ec306c3b1f010dd3e6a34ebad46a7c490739c3a3c92b49c173fc46`. This source-publication copy records the existing archive hash; the archive was not rebuilt for documentation changes.
- Runtime SHA-256: `f1fa4265d05486cbc3ede7076b13d9a991856016c279bf5b36f7be0f102ae39f`.

## Regression and DEV

- Full regression: 611 passed (all audited 610 plus one stylesheet/CSP regression).
- DEV: 108 total; 76 unsafe BLOCK; 0 unsafe PASS; 32 clean PASS.

## Previous semantic campaign (historical)

- 98 classified cases.
- 77 clear-critical cases; 0 PASS.
- 21 equivalent/control cases: 16 PASS, 4 REVIEW, 1 BLOCK.

## Demo

## Final independent audit (v0.12.3; preserved history)

147 fresh case/path executions, including 30 frozen-authority, mocked-provider,
and CAP comparisons. Clear-critical: 73 BLOCK, 46 REVIEW, 0 PASS. Equivalent:
16 PASS, 1 REVIEW, 3 BLOCK. Ambiguous: 6 BLOCK, 2 REVIEW, 0 PASS.
45 additional failure, tamper, input-boundary and isolation checks passed.
Two P0 roots repaired centrally in the extractor: unrepresented scope OR and
unrepresented geographic names. New regressions failed before each repair.
No verifier/provider/API/CAP semantics were changed. V7/V8 were not executed.

## Demo results

- after 6 PM → before 6 PM: BLOCK / UI display CRITICAL DRIFT.
- after 6 PM → after 18:00: PASS / UI display PRESERVED.
- only emergency personnel → emergency personnel: REVIEW.

## Architecture and scope

SignalLock extracts typed alert semantics, then applies deterministic, fail-closed comparison. It is CAP-aware and intended as a pre-publication human-review aid, not an emergency authority or safety certification system.

## Qualification status

- V7: UNQUALIFIED.
- V8: LOCKED.

## Known limitations

The prototype can conservatively REVIEW or BLOCK unsupported restrictive, sequence, and quantity-equivalence forms. Broader multilingual model-quality qualification remains future work. Human review remains required.

Version 0.12.4 externalizes the original CSS to /app.css. The HTTP security
headers retain style-src 'self'; no inline styling is required. Headless Chromium
rendered the styled page and the hero states. It emits an existing benign warning
that frame-ancestors in a meta policy is ignored; the HTTP header still enforces
frame-ancestors 'none'. Docker execution remains unverified because its daemon
was unavailable during the prior audit. Historical machine-local documentation links
were made repository-relative for source publication; audit findings are unchanged.

## Recovery note

The historical Gate-3T ZIP was unavailable. The available workspace was snapshotted and behaviorally revalidated; this final recovered release has its own independent hashes and must not be described as byte-identical to the lost artifact.

## Presentation-only patch (v0.12.4)

Files: web/index.html, new web/app.css, apps/api/main.py (one static CSS route),
new tests/integration/test_stylesheet_csp.py, version/manifest and release docs.
CSS content is preserved. All signallock semantic modules, benchmark source/data,
and existing test files are byte-identical to audited v0.12.3.
Focused UI/security/API suite: 19 passed. Full suite: 611 passed. DEV:
108 total / 76 unsafe BLOCK / 0 unsafe PASS / 32 clean PASS.
HTTP /health, /, /app.js and /app.css return 200. Hero results: BLOCK, PASS, REVIEW.
The previous 147-case Astra campaign is cited as historical evidence and was not rerun.
ZIP hash is supplied in the detached checksum receipt to avoid a self-referential archive.
