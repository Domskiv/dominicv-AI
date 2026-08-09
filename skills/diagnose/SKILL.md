---
name: diagnose
description: Structured debugging workflow for hard bugs, regressions, and performance issues. Builds a tight feedback loop first, then hypothesizes, instruments, and fixes. Trigger phrases: "diagnose", "/diagnose", "debug this", "why is this failing", "find the bug".
---

# Diagnose

For bugs where the root cause isn't obvious. Build a feedback loop first, then close in.

---

## Step 1 — Reproduce

Confirm you can reproduce it before theorizing:

1. What is the exact input or action that triggers the bug?
2. What is the actual output vs. expected output?
3. Does it reproduce consistently or only sometimes?

If you can't reproduce it — stop and ask for a reproduction case. Don't debug a ghost.

---

## Step 2 — Minimize

Narrow scope before reading code:

- Which layer is failing? (UI, API, DB, infrastructure)
- Does it fail with the simplest possible input?
- Does it fail in isolation, or only in combination with something else?

One sharp observation is worth 10 lines of exploratory reading.

---

## Step 3 — Read the evidence

Read what actually matters:
1. The exact error message, stack trace, or wrong output
2. The file and line it points to
3. One level up: what called it, with what arguments

Do not read the whole codebase. Read the trail.

---

## Step 4 — Hypothesize

State your best hypothesis in one sentence before touching anything:

> "I think X is happening because Y."

If you have multiple hypotheses, rank them by likelihood and test the most probable first.

---

## Step 5 — Instrument

Add targeted logging or assertions at exactly the point where your hypothesis predicts the failure. Run. Read the output. Update the hypothesis if wrong.

Don't add logging everywhere — pinpoint it.

---

## Step 6 — Fix

Once root cause is confirmed:
- Make the smallest change that fixes the confirmed problem
- Don't fix adjacent things noticed along the way — log them separately
- Don't add defensive code for the problem you just fixed unless the input is genuinely untrusted

---

## Step 7 — Verify

Run the original reproduction case. Confirm it no longer reproduces.

Run the test suite if available. Confirm nothing else broke.

Report:
```
Root cause: [one sentence]
Fix: [what changed]
Verified: [how confirmed]
```
