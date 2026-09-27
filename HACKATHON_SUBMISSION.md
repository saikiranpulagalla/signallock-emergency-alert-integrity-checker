# SignalLock — Emergency Alert Integrity Checker

## Tagline

AI may rewrite the words. It may not rewrite the action.

## 50-word version

SignalLock is a prototype emergency-alert integrity checker. It compares an
authoritative alert with an AI-assisted rewrite and deterministically checks
whether action-critical meaning—ACTION, PLACE, TIME, and CONSTRAINT—survived.
When operational meaning cannot be represented confidently, it fails closed to
human review rather than guessing PASS.

## 100-word version

AI-assisted translation, summarization, and simplification can produce fluent
emergency alerts while changing a critical instruction. SignalLock is the
pre-publication check those rewrites should pass before human approval. It
extracts a typed safety representation from an authoritative alert and its
candidate rewrite, then deterministically compares ACTION, PLACE, TIME, and
CONSTRAINT. A change from “after 6 PM” to “before 6 PM” becomes critical drift;
unsupported restrictive meaning becomes REVIEW instead of an unsafe PASS.
SignalLock is CAP-aware and designed as a human-review aid, not an emergency
authority or safety certification system.

## 200-word version

Emergency communication increasingly passes through translation, simplification,
summarization, and AI-assisted editing. The danger is not only bad grammar: a
rewrite can remain fluent while changing what people must do, where, or when.
SignalLock is a prototype Emergency Alert Integrity Checker that asks one
focused question before human approval: did the protective instruction survive
the rewrite?

SignalLock compares an authoritative source alert and a candidate rewrite using
a typed Safety Contract. It checks ACTION, PLACE, TIME, and CONSTRAINT, then
applies deterministic, fail-closed verification. A candidate changing “must
evacuate after 6 PM” to “before 6 PM” is flagged as critical drift. If a
restriction such as “only emergency personnel” cannot be represented with enough
confidence, SignalLock routes it to REVIEW instead of guessing that it was
preserved. CAP 1.2 alert context is also supported.

We are not building another alert generator. We are building the check an alert
generator should pass before human approval. The recovered prototype passed 611
automated regression tests, blocked all 76 unsafe cases in its controlled DEV
set with zero unsafe PASS outcomes, and recorded zero PASS outcomes across 119
clear-critical executions in the final independent audit. These are bounded test results, not universal
safety guarantees.

## Inspiration / problem

High-stakes messages need more than surface similarity. A change in modality,
negation, place, time, condition, or exception can alter the protective action
even when the revised text looks nearly identical. SignalLock helps a reviewer
see those changes before publication.

## What it does and how it works

1. Extracts source and candidate alert semantics into typed contracts.
2. Compares action-critical fields deterministically.
3. Returns PRESERVED, REVIEW, or CRITICAL DRIFT in the UI.
4. Fails closed to REVIEW for unresolved operational meaning.
5. Parses CAP 1.2 alerts and incorporates structured alert context.

## What makes it different

We are not building another alert generator. We are building the check an alert
generator should pass before human approval.

## Challenges and lessons

The hardest engineering problems were semantic scope, temporal attachment,
mixed-language omission, provider completeness, and restrictive wording. We
learned that semantic similarity is insufficient; authentication does not prove
semantic completeness; recognized tokens are not necessarily represented
semantics; and ambiguity should fail closed.

## Accomplishments

- 611 passing automated regression tests.
- Controlled DEV: 76/76 unsafe cases BLOCK, 0 unsafe PASS, 32/32 clean PASS.
- Final independent audit: 147 case/path executions, 127 distinct pairs; 119 clear-critical executions with 0 PASS.
- CAP-aware comparison and a browser-based human-review workflow.

## Technologies

Python, FastAPI, Pydantic, Uvicorn, defusedxml, HTTPX, HTML/CSS/JavaScript,
Docker, and optional OpenAI Responses API integration.

## SDG alignment

SignalLock supports more resilient public-safety communication by helping human
reviewers detect action-critical rewrite drift before alerts are published. It
does not claim quantified societal outcomes.

## What is next

Future work includes larger independently curated holdouts, broader multilingual
qualification, expanded typed constraints, integration into alert-authoring
workflows, and production security/operational validation.

## Limitations

SignalLock is a prototype human-review aid, not emergency authority,
certification, autonomous broadcast system, or guarantee of translation
accuracy. Conservative REVIEW/BLOCK outcomes remain for some structurally
complex equivalences. Broader multilingual qualification remains future work.

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
