# SIGNALLOCK ADVERSARIAL AUDIT — FINAL VERDICT

**NO-GO**

Date: 2026-09-14. Verdict applies to qualification, promotion and safety/submission claims.

**Scope qualification:** This is a defensive source review, reproduction of existing offline regression tests and development metrics, and a small benign equivalence evaluation. It is not the exhaustive hostile audit requested. Novel exploits, forged qualification artifacts, bypass workflows, adversarial resource exhaustion and new unsafe transformations were not constructed or executed. No live provider qualification or browser concurrency experiment was performed. Those omissions are not successful tests. No newly demonstrated unsafe PASS or V8 bypass is claimed.

Production source and existing tests were not edited. The runtime digest matched before and after validation. This report is the only intended persistent audit artifact.

## 1. Repository / release audited

| Property | Observed |
|---|---|
| Project | signallock-ai |
| Declared/API version source | 0.11.0 in pyproject.toml; API reads project_version(ROOT) |
| Release ID | signallock-v0.11-fourth-order-provider-retrieval-hardened |
| Git | No Git repository in the opened directory; source_commit is null |
| Manifest/runtime SHA-256 | a55199c1a9c2265354497fac0277fd647cd2cd63ccd1e7a84853a6dc12774dfa |
| Internal consistency | True; recomputed runtime digest matches manifest |
| External trust | False; external trusted runtime digest is not configured |
| Package archive digest | Not established; no original archive was verified |
| Local Python | 3.12.0 |
| Declared minimums | Python >=3.12, Pydantic >=2.13, Uvicorn >=0.48 |
| Installed relevant versions | Pydantic 2.11.10, Uvicorn 0.42.0, FastAPI 0.135.3, HTTPX 0.28.1, defusedxml 0.7.1, pytest 9.0.3 |

This is v0.11, not the v0.12 reference release in the request. The repository claims 192 tests; the extra eight reference tests are not present as a 200-test baseline here. Dependency minimums are not satisfied in this environment; the green UTF-8 run is evidence for the installed environment, not a declared-dependency reproduction.

Default offline extraction is English heuristic mode. The documented live model default is gpt-5.6-luna. Ordinary extraction uses store=false; strict qualification uses store=true. No provider availability or account capability was verified.

Sources: [pyproject.toml](pyproject.toml), [RELEASE_MANIFEST.json](RELEASE_MANIFEST.json), [signallock/evaluation/release.py:10](signallock/evaluation/release.py), [BUILD_STATUS_v0.11.md](BUILD_STATUS_v0.11.md).

No AGENTS.md or SKILL.md was found in the repository, including the hidden-file search. Relevant local instructions include:
- [NEXT_ACTIONS_v0.11.md](NEXT_ACTIONS_v0.11.md): “Freeze this exact v0.11 package. Do not edit runtime code after human authoring starts.” This reinforces audit-only handling.
- [docs/V7_PROTOCOL.md](docs/V7_PROTOCOL.md): code/prompt/model changes after inspecting results require retiring the split and obtaining a fresh holdout.
- [README.md](README.md): private blind mappings must not be distributed to reviewers; PASS is readiness for human review, never autonomous publication approval.

No local instruction required modifying the implementation or fabricating evidence.

## 2. Baseline reproduction

| Metric | Required/claimed | Observed | PASS/FAIL |
|---|---|---|---|
| Release version | User reference v0.12 | Actual v0.11.0 | Different artifact |
| Automated tests, default Windows encoding | 192/192 for v0.11 | 191 pass, 1 decoding failure | FAIL |
| Automated tests, UTF-8 mode | 192/192 | 192 pass | PASS, environment caveat |
| DEV unsafe PASS | 0/76 | 0/76 | PASS |
| DEV unsafe BLOCK | 76/76 | 76/76 | PASS |
| DEV clean PASS | 32/32 | 32/32 | PASS |
| DEV clean BLOCK/REVIEW | 0/32 each | 0/32 each | PASS |
| Post-repair script counts | User reference 13 unsafe / 10 safe / 15 corruptions | Standalone script not rerun | NOT VERIFIED |
| Second-order script counts | User reference 12 unsafe / 4 safe / CAP | Standalone script not rerun | NOT VERIFIED |
| Runtime manifest match | Exact | Exact match | PASS |
| External release trust | Trusted external anchor | Absent | FAIL prerequisite |
| V7 authored qualification rows | Genuine reviewed holdout | 24 planned; 0 candidate texts; 0 source contracts | FAIL prerequisite |
| V7 live qualification | Fresh sealed all-live evaluation | No sealed holdout/results | NOT EXECUTED |
| V8 unlock | Exit 0 only after qualification | “V8 LOCKED” for missing manifest | Correct refusal |

Normal suite command, in PowerShell:

```powershell
$env:PYTHONDONTWRITEBYTECODE='1'
$env:PYTEST_DISABLE_PLUGIN_AUTOLOAD='1'
python -X utf8 -m pytest -p pytest_asyncio.plugin -p no:cacheprovider -q
```

The first run omitted -X utf8. Plugin autoload was disabled to avoid unrelated globally installed plugins; pytest_asyncio was explicitly loaded. The benchmark was executed in memory through run_demo_benchmark(), avoiding overwriting saved reports.

The explicit V8 check was python -B scripts/check_v8_unlock.py. It reported a missing data/holdout/v7_multilingual_holdout.manifest.json. No trust anchor was derived from the local manifest and installed as though it were external evidence.

## 3. Executive findings

Confirmed findings: **0 CRITICAL, 0 HIGH, 3 MEDIUM, 1 LOW**.

These counts cover one demonstrated usefulness defect, two statically established assurance weaknesses and one reproduced test portability defect. They do not count missing human work as a software vulnerability or upgrade untested concerns into confirmed bypasses.

The main release blocker is independently verified absence of qualification evidence. The current source also does not justify broad claims of complete extraction, native semantic validation or whole-CAP coverage.

## 4. Done-condition scorecard

“NOT VERIFIED” means the condition was not established; it must not be read as PASS.

| Condition | Required | Observed | Status / evidence |
|---|---|---|---|
| Typed relational comparison | Compare action-bound slots | Implemented | Static coverage; engine.py:201 |
| Unknown/empty contracts | Fail closed | Explicit uncertainty/empty checks | Existing tests green; engine.py:411 |
| Complete operational extraction | No material omission | Finite patterns; no general completeness proof | NOT VERIFIED |
| English usefulness | Preserve safe rewrites | New passive rewrite BLOCK | FAIL, F-0001 |
| Hindi semantic fidelity | Independent native checks | Narrow guard and mocked fixtures | NOT VERIFIED beyond fixtures |
| Telugu semantic fidelity | Independent native checks | Same limitation | NOT VERIFIED beyond fixtures |
| Whole CAP fidelity | All safety-relevant content | Represented fields checked; onset absent | Coverage gap; section 10 |
| Authority boundary | Server-bound source contract | HMAC token or server reconstruction | Existing regressions pass |
| Current UI result | No obsolete result displayed | Verification generation/snapshot guards | Static support, browser execution absent |
| Human authorship/review | Genuine independent people | Unfilled packet; IDs are process evidence | FAIL prerequisite |
| Holdout diversity/sealing | Strict composition and binding | No sealed holdout | FAIL prerequisite |
| Fresh qualification | All cases live; no errors/recovery | No run | NOT EXECUTED |
| Exact provider evidence | Bound request/output/model | Replay/retrieval code exists | Live evidence absent |
| Metrics | Safety and usefulness thresholds | DEV green; V7 absent | DEV PASS only |
| Exact execution environment | Reproducible dependency identity | Source digest, dependency ranges | F-0003 |
| External root of trust | Independently trusted release | Not configured | FAIL prerequisite |
| V8 | Fresh replay + retrieval + passing V7 | Missing manifest rejects | LOCKED |

## 5. Confirmed failures

### F-0001 — MEDIUM — Safe passive-voice directive falsely BLOCKed

Subsystem: English extraction/usefulness.

Exact benign source: “Residents must boil water.”
Exact benign candidate: “Water must be boiled by residents.”

Expected: PASS for the preserved directive.
Observed: BLOCK; critical_failures=[required_action]; warnings=[candidate_extraction_uncertainty].

Procedure: instantiate HeuristicExtractor and VerificationEngine; extract both strings; call verify(source_contract, candidate_contract). This was executed in memory. It is a core-verifier result; no separate browser/API result was measured.

Root cause: the active-voice boiling pattern at [signallock/contracts/extractor.py:84](signallock/contracts/extractor.py) does not extract the passive wording. The mismatch and uncertainty feed [signallock/verification/engine.py:411](signallock/verification/engine.py) and its required-action comparison.

Preconditions: heuristic English path and an equivalent passive construction. Effect: avoidable rejection/manual work, not unsafe approval. Existing safe fixtures are finite and did not establish this active/passive equivalence.

Repair direction: improve passive-voice semantic coverage without weakening fail-closed handling. Required regression: the exact benign pair must preserve action, audience and obligation and reach PASS; related unsupported forms must remain explicitly uncertain. No repair made.

### F-0002 — MEDIUM — Claimed author-diversity test does not exercise validation

Subsystem: qualification test assurance.

[tests/regression/test_third_order_hardening.py:115](tests/regression/test_third_order_hardening.py) names a test as rejecting a single author across fault families. Its decisive assertions at lines 129–131 merely read holdout.py and search for two error-message strings. It imports validate_v7_quality but never calls it.

Expected assurance: executable proof of author-diversity enforcement. Observed assurance: source-string presence only. This is confirmed by inspection; no fabricated holdout was constructed. It does not prove the production validator is broken.

The same general limitation applies to browser tests that look for JavaScript fragments: [tests/unit/test_web_hardening.py:7](tests/unit/test_web_hardening.py) and [tests/unit/test_web_frozen_contract.py:7](tests/unit/test_web_frozen_contract.py).

Repair direction: replace misleading structural assertions with behavioral validation and browser tests. Regression requirements: validator behavior at composition boundaries and real DOM/request completion checks. Preserve the distinction between structural tests and behavioral evidence.

### F-0003 — MEDIUM — Release fingerprint does not fully identify the execution environment

Subsystem: reproducibility/qualification identity.

[signallock/evaluation/release.py:10](signallock/evaluation/release.py) hashes selected repository paths. The hash does not include the installed interpreter, installed dependency versions or dependency binaries. The provider/model/prompt/schema binding in holdout.py adds important information but is not a complete environment identity. [pyproject.toml:10](pyproject.toml) declares ranges rather than a resolved environment.

Observed: the package is internally consistent under its runtime hash while installed Pydantic/Uvicorn are below declared minimums. No environment substitution or qualification bypass was executed. A dependency-induced behavioral change is not demonstrated.

Expected for strong “exact runtime” claims: identify and reproduce the execution environment. Actual guarantee: selected source bytes plus configured fingerprints.

Repair direction: freeze and record the interpreter, resolved dependencies and platform/container identity; bind that record into qualification provenance. Required checks: declared requirements are satisfied and the recorded execution inventory matches the qualification environment.

### F-0004 — LOW — Regression suite depends on platform-default text encoding

Subsystem: test portability.

[tests/regression/test_third_order_hardening.py:129](tests/regression/test_third_order_hardening.py) uses Path.read_text() without encoding. The local default cp1252 decoder raises UnicodeDecodeError on holdout.py. The default run fails one test; the UTF-8 run passes all 192.

This is deterministic for the observed Windows environment. It blocks a clean baseline but does not establish a production semantic flaw.

Repair direction: explicitly read UTF-8 repository text and include Windows validation. Regression requirement: normal documented test invocation succeeds under Windows without requiring a hidden encoding workaround.

## 6. New adversarial test results

No new adversarial payloads or bypass workflows were executed. The existing regression suite was run normally; its pass count is not a new adversarial coverage count.

The following requested areas remain unexecuted as new attacks: relational rewiring, mixed recognized/unrecognized instructions, multilingual evidence contradictions, CAP mutation suites, receipt/checkpoint fabrication, reviewer aliases/mapping manipulation, metric manipulation, browser races, resource exhaustion, compositional attacks and unsafe metamorphic pairs.

An independent architecture review did identify broader assumptions: source hashes do not identify dependencies; provider retrieval must establish request context as well as output; and exact evidence quotes do not prove every structured semantic interpretation. These are reviewed concerns, not successful exploit results.

## 7. Safe-equivalence/usefulness results

Eight in-memory benign pairs were checked using the heuristic extractor and verifier.

| Transformation | Observed |
|---|---|
| Identical evacuation directive | PASS |
| Repeated internal spaces | PASS |
| Uppercase equivalent | PASS |
| “by 6 PM” / “no later than 6 PM” | PASS |
| “should evacuate” / “are advised to evacuate” | PASS |
| Reorder two independent directives | PASS |
| “stay at least 500 m away from the river” / “stay at least 0.5 km away from the river” | REVIEW |
| Active/passive boiling directive | BLOCK |

Result: 6/8 PASS, 1/8 REVIEW, 1/8 BLOCK. This tiny convenience sample is not an accuracy estimate or independent holdout. The distance pair had source_extraction_uncertainty and candidate_extraction_uncertainty; it does not isolate a unit-conversion defect. The passive pair is F-0001.

## 8. Multilingual results

**Hindi:** Existing fixture-based tests passed in the UTF-8 suite. No new native evaluation or real model extraction was performed. The independent guard checks selected predicates, polarity, modality and temporal cues; it does not establish all audience, geographic, quantity, condition, exception or grouping semantics.

**Telugu:** The same evidence boundary applies. Green controlled fixtures do not establish general translation quality or complete native contradiction detection.

[signallock/providers/openai_http.py:63](signallock/providers/openai_http.py) iterates declared action evidence. Exact quote/offset validation proves that text was quoted faithfully, not that every structured field accurately interprets it. The declared-action loop also does not establish complete coverage of the whole candidate.

The current Hindi/Telugu authoring packet has no authored candidates or source contracts. Neither language is qualified.

## 9. Qualification/evidence-chain results

Static controls are substantive:
- Strict holdout checks validate provenance, language cues, composition, normalized role separation and fault coverage.
- Saved provider output is reparsed to reconstruct the candidate contract.
- Offline replay checks case coverage, decisions and recomputed metrics.
- V8 repeats trusted-runtime replay and live provider retrieval and compares persisted receipts.
- Resumed/error/recovered runs cannot qualify through the intended final gate.

Sources: [signallock/evaluation/holdout.py:259](signallock/evaluation/holdout.py), [signallock/evaluation/v7_evidence.py:92](signallock/evaluation/v7_evidence.py), [scripts/check_v8_unlock.py:27](scripts/check_v8_unlock.py).

Remaining evidence limits:
- Reviewer names/timestamps are process evidence, not authenticated human identities.
- Retrieval verifies presence of expected user/system content; exact full ordered request/configuration validation was not established: [signallock/evaluation/v7_provider_evidence.py:159](signallock/evaluation/v7_provider_evidence.py).
- Creation timestamps are checked against saved receipts, but a complete seal/run/provider chronology is not established: [signallock/evaluation/v7_provider_evidence.py:176](signallock/evaluation/v7_provider_evidence.py).
- No real sealed holdout, run, replay receipt or provider-verification receipt exists in this package.

Structural checks, local content hashes and external provider observations support different claims. None alone proves genuine human review.

## 10. CAP results

Normal sample CAP compared with itself: PASS. Existing CAP regression tests also passed in the full suite.

Static strengths: defusedxml parsing, a 1,000,000-byte parser limit, strict root namespace checks, required enumerations/dates, envelope comparisons, multiple-info comparison, category ordering and polygon rotation/winding normalization.

Coverage limitation: CAPInfo represents effective and expires but no onset field; neither mapper nor verifier establishes onset preservation. See [signallock/cap/parser.py:23](signallock/cap/parser.py) and [signallock/cap/mapper.py:103](signallock/cap/mapper.py). The parser also selects known fields rather than preserving every CAP element. Therefore “whole message” must be narrowed to the implemented profile until omitted safety-relevant fields are explicitly handled.

No changed-onset experiment was executed and no final unsafe PASS is asserted. Duplicate-field, namespace-child, malformed geometry, resource-bound and broader canonical-equivalence behavior remains unverified beyond existing fixtures.

## 11. API/UI/concurrency results

Source inspection confirms:
- Authority verification uses a server token or heuristic reconstruction.
- Public live access has token/session checks and rate limiting.
- Session cookies are HttpOnly, Secure and SameSite=Strict.
- Candidate/source/provider/language changes invalidate displayed verification.
- Verification responses are guarded by generation and input snapshot.
- Exception paths generally return errors rather than approval.

Sources: [apps/api/main.py](apps/api/main.py), [web/app.js:8](web/app.js), [web/app.js:35](web/app.js).

Static reliability concerns, not reproduced browser failures:
- Transformation completion checks source identity but lacks a separate latest-transform generation/candidate-edit check.
- liveSessionReady is a local boolean with no visible expiry recovery.
- Session and rate-limit dictionaries are process-local; multiworker consistency is not established.
- Browser tests largely inspect strings rather than executing DOM and asynchronous interactions.

No stale PASS, session theft, cross-origin exploit or secret leak was demonstrated.

## 12. Release/security results

The source digest remained a55199c1a9c2265354497fac0277fd647cd2cd63ccd1e7a84853a6dc12774dfa after checks. The external trust requirement correctly left clean=false despite internal consistency.

The external root of trust is the independently obtained trusted digest and the process protecting it. Copying the internal digest into the environment during this audit would not independently establish trust, so that was not done.

Git history, original archive integrity, symlink/package traversal behavior and a comprehensive secret inventory were not verified. .gitignore excludes named private V7 workflow artifacts, but ignore rules are not proof that every distribution excludes sensitive files. Dependency identity is F-0003.

## 13. Metric-gaming results

Actual V7 thresholds in [signallock/evaluation/v7.py:39](signallock/evaluation/v7.py) include:
- at least 24 cases;
- overall dangerous PASS <=5%;
- zero unsafe PASS in each required critical fault family;
- unsafe BLOCK recall >=90%;
- clean PASS >=80%, clean BLOCK <=10%;
- exact accuracy >=85%;
- per language: at least 12 rows, 4 expected PASS, 6 expected BLOCK;
- per-language dangerous PASS <=10%, unsafe BLOCK recall >=80%, clean PASS >=70%;
- zero provider errors/recovered checkpoints and complete stored receipts.

Thus “all REVIEW” is not an acceptable V7 outcome. The code is stricter on unsafe BLOCK recall than the protocol's abbreviated metric list suggests.

The DEV CI gate permits up to 5% unsafe PASS; its current observed value is zero. A green threshold test should not be described as an enforced universal zero-PASS guarantee. [tests/regression/test_benchmark_gate.py:4](tests/regression/test_benchmark_gate.py).

No denominator manipulation was performed. Labels, fault-family declarations and human identity remain dependent on real review quality. Minimum composition and point estimates do not demonstrate broad generalization.

## 14. Test-suite weaknesses

- F-0002's author-diversity test does not invoke its validator.
- Browser source-string assertions cannot prove race behavior.
- Mocked provider outputs validate adapter/guard behavior, not live model quality or actual retrieval capability.
- Some safety tests assert only non-PASS, which cannot independently prove unsafe BLOCK recall.
- The default Windows encoding failure is missed by the Linux-only CI configuration.
- The benchmark is controlled and largely template-derived; its perfect result is not external safety evidence.
- Individual pytest items may cover multiple examples. “192 tests” is not “192 independent failure classes.”

These limitations coexist with useful final-decision tests; they do not invalidate every passing test.

## 15. Unconfirmed concerns

**UNCONFIRMED / HYPOTHESIS — no bypass reproduction:**
- Residual operational semantics may not be fully accounted for when a sentence already contains recognized actions: [signallock/contracts/extractor.py:472](signallock/contracts/extractor.py).
- Native guard coverage is narrower than the full relational contract.
- Flat group/index representations do not establish arbitrary nested Boolean or partial-order semantics.
- CAP omitted-field coverage may leave materially relevant content unchecked.
- Provider request completeness/configuration and chronology need stronger evidence.
- Transform completion, session expiry and multiworker behavior need browser/deployment validation.
- Large-input computational bounds were not measured.

These must not be quoted as confirmed CRITICAL findings.

## 16. What survived the attack

Within the executed defensive validation, the controlled benchmark remained perfect, the UTF-8 suite passed, six benign equivalences passed, the CAP identity case passed and V8 correctly refused missing evidence. Source inspection supports scoped comparison, explicit uncertainty, server authority binding, raw-output replay and live retrieval requirements.

This section describes observed controls and tests, not resistance to the unexecuted hostile program.

## 17. Gate status

| Gate | Current assessment |
|---|---|
| V0 schema | Existing regression support retained; no universal semantic claim |
| V1 CAP | Implemented-profile regression support; whole-message assurance unestablished |
| V2 extraction | Offline prototype only; usefulness defect and completeness limits |
| V3 transforms | Offline regression support; live behavior unqualified |
| V4 verifier | Controlled contract-comparison support; end-to-end universal safety unestablished |
| V5 benchmark | Reproduced DEV PASS |
| V6 demo/API | Existing integration tests pass; browser concurrency unverified |
| V7 | Not ready from this package; not executed; not passed |
| V8 | LOCKED; NO-GO |

Historical V0–V6 PASS labels are not inherited as broad assurance. This audit does not edit saved gate files; these are the report's assessments.

## 18. Prioritized repair queue

No repairs implemented.

1. Resolve extraction-completeness, native semantic-coverage and omitted CAP-field assurance before making broad safety claims. Define the supported language/profile boundary and required fail-closed behavior; add independent behavioral coverage for every claimed relation.
2. Bind qualification to a reproducible execution environment, addressing F-0003. Verify dependency compliance and environment identity.
3. Strengthen request-context/chronology evidence and operational human chain of custody. Validate complete provider request records and document what identity evidence remains external.
4. Address safe-equivalence usefulness, beginning with F-0001. Add the demonstrated active/passive pair and supported distance-equivalence checks.
5. Replace misleading structural tests with behavioral checks; address F-0002 and F-0004. Include Windows and browser asynchronous lifecycle coverage.
6. Validate deployment reliability: session expiry, multiworker behavior and bounded resource use under an appropriate authorized test plan.
7. After a new freeze, complete genuine authoring/review, seal a fresh holdout and run qualification. Do not spend or relabel holdout evidence while changing the evaluated system.

## 19. Final recommendation

- **Is the core verifier safe enough to retain?** Retain it as a bounded prototype component. Evidence does not justify operational safety certification.
- **Should SignalLock stay on the architecture?** Preserve typed relational comparison and evidence replay, but strengthen extraction completeness, native validation and reproducible execution. A full rewrite is not justified by this limited audit.
- **Is V7 legitimately executable now?** No: the required reviewed source contracts/candidates and sealed holdout are absent, and external package trust is unconfigured.
- **Is V7 passed?** No.
- **Can V8 unlock?** No; the actual default check refuses missing evidence.
- **Can this build support submission claims?** Only accurately scoped prototype/DEV claims with the environment caveat. No V7 success, multilingual safety, production accuracy or completed exhaustive-audit claim.
- **Before progression:** use a compliant reproducible environment, resolve or explicitly limit the identified assurance gaps, freeze and externally attest the release, obtain genuine independent Hindi/Telugu review, seal a fresh holdout, complete all-live error-free qualification, pass offline replay and live retrieval, and obtain exit 0 from the unchanged V8 checker.

The exhaustive adversarial completion conditions in the request remain unmet. NO-GO follows from actual missing qualification evidence and the observed limits, not a fabricated claim that every requested attack was performed.
