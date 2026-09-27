# Safety Contract v1.0 — relational hardening

SignalLock converts an authoritative alert into a typed **Safety Contract**. The contract is not a bag of keywords. Its unit of preservation is a **scoped protective directive**: who must/may/must-not do what, where, when, under which condition, with which quantity threshold and exception.

## Directive invariants

Every extracted action carries its own relational fields:

- modality: `MUST`, `SHOULD`, `MAY`, `PROHIBITED`, `NOT_REQUIRED`, or `UNKNOWN`
- action type + surface verb/object/destination
- scoped audience(s)
- scoped area(s)
- temporal operator + time (`BEFORE`, `AFTER`, `BY`, `UNTIL`)
- structured/bound quantitative constraints
- bound exceptions
- explicit sequence index/dependency when order is stated
- Boolean grouping (`AND` / `OR`) when operationally material
- exact evidence provenance

The legacy global `audience`, `affected_areas`, `quantities`, and `exceptions` fields remain for compatibility and coverage, but they are **not sufficient evidence for PASS** when a relationship is present.

## P0 hard invariants

- required/prohibited protective action and modality
- action ↔ audience binding
- action ↔ location binding
- action ↔ number/unit/relation binding
- action ↔ condition/exception binding
- temporal operator + time
- stated order/dependency and AND/OR choice semantics
- candidate-only operational directives

Any confirmed P0 mismatch yields `BLOCK`.

## Uncertainty rule

Unresolved operational relationships, source contradictions, or independently unverified multilingual critical semantics yield `REVIEW`, never `PASS`.

## Authority rule

A browser/client cannot assert the authoritative semantic oracle. `/api/extract-authority` returns a server-issued HMAC token bound to the source-text hash and canonical contract. `/api/verify-contract` verifies that token (or, for the offline heuristic legacy path, independently reconstructs the authority) before candidate verification.

## CAP rule

CAP verification covers the **whole message**, not only one `<info>` block: envelope status/msgType/scope/sender/sent/references/addressing plus every info block and its polygon/circle/geocode targets are compared under strict CAP-profile parsing.

## Meaning of PASS

`PASS` means **the machine-readable contract was preserved and the output is ready for human review**. It never means safe for autonomous publication or dispatch.
