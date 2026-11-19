---
name: scout
disable-model-invocation: true
description: Find ready-to-work backlog cards and research new features when none qualify.
---

# Scout

Read [Project settings](../autopilot/references/project.md) first. Work from the project checkout. If the backlog already has pending edits, stop and report them.

When the ready queue is empty, review the existing `[?]` cards first. Within the product direction, choose a small, reversible option when the evidence supports it and the outcome can be checked. Promote the existing card to `[ ]` and record the choice, reason and acceptance check on that line. Keep cards awaiting evidence or an explicit owner decision at `[?]`. If any card was promoted, go straight to the backlog commit below.

If the queue is still empty, exercise one user journey end to end, such as completing the product's main task and moving on to the next step. Use the running app when available. Otherwise exercise the same transitions with existing tests and identify which interactions still need a manual check. Record the steps actually exercised, what happened and where the user got stuck, if anywhere, in the round report. Turn a reproducible problem into a card with an acceptance check.

Use the progress log and the optional context docs to find open issues within the autonomous scope.

Look for smaller follow-ups to blocked cards. Check a candidate against current code, tests, reproducible app evidence, or primary documentation for the project's stack. Skip duplicates, resolved issues, and work that requires credentials or a manual check to establish the issue. If a check is unavailable, report the gap and keep the backlog grounded in the sources you verified.

Add up to five one-line `[ ]` cards for fixes or planned work under the backlog's to-do section, most valuable first. Name the acceptance check and cite the evidence on each line.

```markdown
- [ ] Fix or planned software work, acceptance check, source
```

If these checks yield no executable card, read [Feature Research](../feature-research/SKILL.md) and follow it once **this round**, even if it ran in earlier rounds. Let it write and report its cards, then end the round. Include the journey findings and any outstanding decisions or missing evidence in the report.

Edit only the backlog. Recheck that it has not changed while you gathered evidence. If it is the only pending change, commit just that file as `scout: add backlog cards`. If other edits are pending, leave the new cards uncommitted and report that. If there are no cards, leave the file untouched.

Report promoted and added cards in the configured language. State which committed `[ ]` cards Ralph can take next.
