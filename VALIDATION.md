# SignalLock Safety Validation

## Recovered lineage

The historical Gate-3T ZIP was unavailable. The available workspace was first
snapshotted, then behaviorally revalidated; this release has its own identity
and must not be described as byte-identical to the lost historical package.

## Final evidence

| Check | Result |
| --- | --- |
| Full regression suite | 611 passed |
| Focused Gate-2R/Gate-2P/Gate-2M/Gate-3T/Gate-3O suites | 337 passed |
| DEV unsafe cases | 76 total; 76 BLOCK; 0 PASS |
| DEV clean cases | 32 total; 32 PASS |
| Final independent Astra audit | 147 case/path executions; 127 distinct pairs |
| Final clear-critical executions | 119: 73 BLOCK; 46 REVIEW; 0 PASS |
| Final equivalent controls | 20: 16 PASS; 1 REVIEW; 3 BLOCK |
| Final ambiguous cases | 8: 0 PASS; 2 REVIEW; 6 BLOCK |
| Boundary/isolation checks | 45 passed |
| Structured CAP checks | 5 passed |

Historical accelerated campaign: 98 classified cases; 77 clear-critical cases
with 0 PASS; 21 equivalent/control cases with 16 PASS, 4 REVIEW and 1 BLOCK.
This earlier campaign is not the final independent audit.

## Safety behavior

- Gate-2R: unsupported operational meaning remains unresolved rather than
  disappearing.
- Gate-2P: schema-valid provider output is checked against deterministic safety
  anchors; omitted operational meaning becomes unresolved.
- Gate-2M: unaccounted mixed-language/script material fails closed.
- Gate-3T: temporal occurrences are consumed only when bound to represented
  directive scope.
- Gate-3O: unsupported restrictive/exclusive scope is retained as unresolved,
  so exclusivity deletion routes to REVIEW rather than PASS.
- CAP instruction and structured-field comparison use the same deterministic
  verification boundary.

## Demonstrated results

| Source → candidate change | Result |
| --- | --- |
| after 6 PM → after 18:00 | PASS |
| after 6 PM → before 6 PM | BLOCK |
| Zone A → Zone B | BLOCK |
| must → may | BLOCK |
| evacuate → shelter | BLOCK |
| only emergency personnel → emergency personnel | REVIEW |
| mixed-language clause removed | REVIEW |

## Limitations

This is a bounded typed-contract prototype, not universal natural-language
understanding. Some restrictive, sequence, and quantity-equivalence forms are
conservatively REVIEWed or BLOCKed. V7 multilingual model-quality qualification
is unqualified and V8 remains locked. Human emergency-management review is
mandatory.

## Final independent audit (0.12.3)

The final audit found and repaired two residual-coverage defects: disjunction
inside audience/place scope, and unrepresented geographic names. Eighteen new
regressions were added. The updated suite passes 610 tests; DEV remains 76
unsafe BLOCK / 0 unsafe PASS / 32 clean PASS. The fresh audit executed 147
case/path combinations (127 distinct text pairs): 119 clear-critical executions
returned 73 BLOCK and 46 REVIEW, with zero PASS. Twenty equivalent controls
returned 16 PASS, 1 REVIEW and 3 BLOCK; eight ambiguous cases returned 2 REVIEW
and 6 BLOCK. The earlier 98-case campaign above is historical evidence.

## Presentation patch (0.12.4)

The existing CSS is now served from `/app.css` under `style-src 'self'`.
This presentation-only patch changes no semantic verification behavior. The
current full suite passes 611 tests (610 audited tests plus one CSP regression);
19 focused UI/security/API tests pass. The v0.12.3 audit history above is retained.
