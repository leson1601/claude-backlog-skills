---
name: autopilot
disable-model-invocation: true
description: Run one backlog round in an isolated worktree and record the outcome.
---

# Autopilot

Read [Project settings](references/project.md) first. Its commands, documents, card conventions, scope, and report format apply to every step below.

## Choose the round

Record the launch checkout, named branch, and HEAD. If the checkout has pending edits, stop and report the dirty checkout. Under Ralph, end the final message with `<promise>RALPH STOP</promise>` for a condition that requires the whole loop to stop.

Read the backlog, the progress log, and the relevant sections of the optional context docs. Select the first `- [ ]` card. If there is none, follow [Scout's empty-queue steps](../scout/SKILL.md) in the launch checkout and end the round. Continue the loop when Scout commits a promoted or new executable card. If Scout finds no executable card, follow the night prompt's waiting instructions in night mode, or stop and report why in a regular run. A failed backlog commit stops either run.

Work only within the autonomous scope. For a `Feature:` card queued by Feature Research, verify that its cited evidence still applies before building. A `[ ]` card the owner approved is also eligible within that scope. Move cards outside scope or still requiring a product decision to `[?]`, state why in the report, and commit the backlog and report before ending the round. If a card requires a manual check that cannot run here, mark it blocked.

## Work and verify

1. Read the relevant code and tests, then identify a small change and its acceptance check. If the card is too large, record a smaller independently useful slice and leave the remainder open.
2. Use Claude Code's `EnterWorktree` from the launch checkout. Verify that the worktree starts at the recorded HEAD. Run the install command.
3. Make the change and run the test command, the typecheck command, any extra checks that apply, and the card's acceptance check. For a bug fix, run its new or changed test once against the unfixed source and confirm that it fails; a test that passes there does not catch the bug, so strengthen it before committing. Record that failing run in the report. Record manual-check evidence only if the check actually ran.
4. On success, mark the completed card `[x]` in the worktree's backlog and add a report at the top of the progress log. Commit the implementation, backlog, and report together. If a slice leaves work open, give the completed slice and remainder separate cards.
5. Use `ExitWorktree` with `keep` to return to the launch checkout. Verify its branch, HEAD, and clean status, then fast-forward only to the successful commit. After integration, remove the worktree you created if Git can remove it without force. If integration fails, preserve the worktree and stop the loop. Keep all work local to the repository.

If verification remains blocked after troubleshooting, preserve the worktree and return to the launch checkout. If the launch branch and HEAD still match and it is clean, mark the card `[!]` with the reason and worktree path, and commit that status with the report. If the launch checkout changed, report the blocker and stop the loop without updating it.

Write each report in the configured language and format. Include the commands and results, plus the branch or worktree path for work that did not land.
