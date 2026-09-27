# SIGNALLOCK REPAIR + FIFTH-ORDER ADVERSARIAL REGRESSION REPORT

## Final engineering verdict

**CONDITIONAL — MORE ENGINEERING REQUIRED.**

The repaired v0.12.0 development artifact passes its automated and controlled
adversarial gates. It is not V7 qualified: no genuine reviewed holdout or live
provider evidence exists, the local qualification environment is intentionally
rejected, and V8 remains locked.

## Release identity

- Version: `0.12.0`
- Release ID: `signallock-v0.12.0-fifth-order-hardening`
- Runtime tree SHA-256: `ebb11ad3734a4f9ab6804e7584b23f47f2f15ef3928eb962ac460cef7cfcb18a`

## Findings addressed

| Finding | Root cause | Repair | Evidence |
|---|---|---|---|
| F-0001 passive equivalence | Active-only heuristic extraction | Bounded explicit-agent passive grammar, reusing normal slot extraction and preserving original-clause provenance | `test_passive_voice.py`; safe forms PASS, changed/unsupported forms never PASS |
| F-0002 test assurance | Source-string test did not call the validator | In-memory behavioral V7 quality fixtures test acceptance, author/reviewer independence, Unicode aliases, diversity, duplicate padding, coverage and second-reviewer rules | `test_v7_review_workflow.py` |
| F-0003 environment identity | Runtime hash omitted interpreter/dependency identity | Deterministic strict-qualification environment descriptor/fingerprint, declared-constraint checking, manifest/replay binding, preflight reporting | `environment.py`, `test_execution_environment.py` |
| F-0004 Windows portability | Implicit repository encodings and Unicode console output | Explicit UTF-8 text I/O check and UTF-8 second-order script output | ordinary Python test and second-order runs pass |

## New confirmed fifth-order findings

1. A supported directive plus an unrecognized emergency command could previously
   drop the latter and PASS. The heuristic now marks the documented unsupported
   command family unresolved, yielding REVIEW/BLOCK rather than PASS.
2. CAP `onset` was parsed nowhere and a material onset change could PASS. It is
   now represented and compared.
3. Mixed AND/OR relations exceeded the flat relation graph and a rewiring could
   PASS. Such topology now becomes unresolved and cannot PASS.
4. Strict CAP parsing previously selected the first duplicate singleton field.
   Duplicate envelope or safety-relevant info fields are now rejected.

## Investigations that did not produce an unsafe PASS

- Hindi/Telugu structured audience, area and condition contradictions reached
  REVIEW or BLOCK in focused tests; no native guard weakening was made.
- Multiple sequence-chain changes were BLOCKed by the existing graph check.
- Provider response ID, model, metadata, output and request input tampering
  stayed rejected. Retrieval now additionally requires exactly the expected,
  non-paginated two-item system/user transcript.

Native evidence spans remain only a bounded deterministic guard, not proof of
general Hindi/Telugu semantic understanding. Unsupported operational vocabulary
outside the explicit fail-closed set remains a limitation.

## Validation

- Automated suite: **247 passed** under ordinary Windows Python.
- DEV benchmark: **0/76 unsafe PASS; 76/76 unsafe BLOCK; 32/32 clean PASS; 0/32 clean BLOCK**.
- Post-repair audit: **13/13 unsafe BLOCK; 10/10 safe PASS; 0/15 corruptions PASS**.
- Second-order audit: **12/12 unsafe BLOCK; 4/4 safe PASS; CAP unsafe PASS 0**.
- New fifth-order tests cover residual directives, onset, equivalent CAP ordering
  and winding, duplicate fields, Boolean topology, native scopes, passive
  interactions and environment fingerprints.

## Qualification status

- V7 passed: **NO**
- V8 unlocked: **NO**
- Human evidence fabricated: **NO**
- Provider evidence fabricated: **NO**

Preflight correctly refuses this machine because Pydantic 2.11.10 and Uvicorn
0.42.0 do not satisfy the declared qualification requirements, in addition to
the absent credentials, sealed reviewed holdout and external runtime anchor.

## Remaining limitations

The verifier remains a bounded typed-contract prototype. It does not establish
general natural-language completeness, arbitrary nested logic/partial orders,
authenticated human identity, provider cryptographic attestation, or real
multilingual model quality. Mixed Boolean syntax is deliberately REVIEW rather
than normalized. Deployment-level browser/session/multiworker behavior still
requires separate end-to-end validation.
