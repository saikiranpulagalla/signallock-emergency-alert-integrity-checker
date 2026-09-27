# SignalLock screenshots — v0.12.4

From the extracted release folder, run:

```powershell
python -m apps.api
```

Open http://127.0.0.1:8000. Choose **Offline deterministic demo** and **English**.
Paste the source and candidate below into their respective fields, then click
**Check alert integrity**. Wait for the result before capturing.

## Screenshot 1 — Product overview

Source: Residents of Zone A must evacuate after 6:00 PM.
Candidate: Residents of Zone A must evacuate after 18:00.

Expected: **PRESERVED**. Capture the SignalLock title/tagline, both input fields,
the check button and result card. Use a wide browser window and zoom out if needed.

## Screenshot 2 — Critical temporal drift

Source: Residents of Zone A must evacuate after 6:00 PM.
Candidate: Residents of Zone A must evacuate before 6:00 PM.

Expected: **CRITICAL DRIFT**. Capture both messages, the result, and the first
required-action signal showing expected AFTER:6:00 PM and observed BEFORE:6:00 PM.
Scroll slightly or zoom out so these details remain visible together.

## Screenshot 3 — Preserved equivalent

Source: Residents of Zone A must evacuate after 6:00 PM.
Candidate: Residents of Zone A must evacuate after 18:00.

Expected: **PRESERVED**. Capture both messages and the result with matching
field-level signals. A tighter crop than the overview is useful.

## Optional screenshot 4 — Human review

Source: Only emergency personnel must evacuate Zone A.
Candidate: Emergency personnel must evacuate Zone A.

Expected: **REVIEW**. Capture both messages and the uncertainty explanation.
Caption: unsupported operational restriction scope requires human review.

The external stylesheet /app.css should return HTTP 200. The interface should
have a dark background, two bordered input panels and colored verdict indicators.
PRESERVED means no detected drift under supported checks; human review remains required.
