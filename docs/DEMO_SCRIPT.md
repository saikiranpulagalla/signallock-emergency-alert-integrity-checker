# SignalLock Demo Script (about 2 minutes)

**0:00–0:15 — Problem**

“AI can rewrite an emergency alert fluently while changing the action people are
supposed to take. In a safety-critical message, that is not a cosmetic error.”

**0:15–0:30 — Product**

“This is SignalLock, an Emergency Alert Integrity Checker. It asks whether the
protective instruction survived a rewrite before a human approves publication.”

**0:30–0:50 — Preserved rewrite**

Enter the tested preserved example: after 6 PM becomes after 18:00. “SignalLock
returns PRESERVED because the action, place, modality, and temporal meaning
match.”

**0:50–1:20 — Critical drift**

Change the candidate to before 6 PM. “The wording is almost identical, but the
time relationship reversed. SignalLock returns CRITICAL DRIFT. The field-level
signals show the TIME mismatch while ACTION, PLACE, and CONSTRAINT remain
preserved.”

**1:20–1:40 — Fail closed**

Use the ONLY example. “Here the restrictive meaning cannot be represented
confidently as preserved, so SignalLock returns REVIEW instead of guessing PASS.
That is intentional fail-closed behavior.”

**1:40–2:05 — Architecture**

“SignalLock uses probabilistic understanding and deterministic acceptance.
Extraction can assist interpretation, but typed comparison and fail-closed rules
own the verdict. It is CAP-aware and designed for human review.”

**2:05–2:20 — Evidence**

“The recovered prototype passed 611 regression tests. In the controlled DEV
benchmark it blocked all 76 unsafe cases with zero unsafe PASS results, and its
final independent audit found zero PASS outcomes across 119 clear-critical executions.”

**2:20–2:30 — Close**

“SignalLock: AI may rewrite the words. It may not rewrite the action.”

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
