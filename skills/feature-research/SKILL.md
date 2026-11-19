---
name: feature-research
disable-model-invocation: true
description: Research product features and queue changes supported by evidence.
---

# Feature Research

Run from the project checkout. Read [Project settings](../autopilot/references/project.md), especially its product direction, before selecting a topic. If the backlog has pending edits, stop and report them. Use the topic supplied with `/feature-research` when present and evaluate it against that direction. Without a supplied topic, begin with a specific session described by a user of this product or a comparable one. Record what they wanted to do, what they enjoyed or requested, and where they got stuck. Link the original feedback and date it when possible. Verify the comparable feature in first-party material and look for independent corroboration and contrasting experiences. State how much evidence you found. A solitary report can motivate a trial. If no user account is available, report that gap and return no new card.

1. Read the backlog and the docs the product direction links to. Trace the reported behavior or requested topic through the current app or code. Check whether the feature is missing, hard to discover, already sufficient, or creating friction. Consider improving, replacing, or removing an existing feature. Revisit a settled decision when new evidence bears on the reason it was made.
2. Build the case from a comparable successful product or relevant research. For a product, cite a public indicator of success with its date, verify the specific feature in first-party material, and explain why the pattern transfers here. A product's overall success alone cannot establish the feature's effect. For research, cite the finding, who or what was studied, and what applies here. Treat individual reviews as anecdotes and label inference. If web access fails, report which checks were unavailable and use relevant, verified local research if it supports the change.
3. Rank up to three proposals using the product direction. For each, state the user benefit, what flow would change, the main trade-off, an observable acceptance check for the first usable version, and what user behavior would make you drop the idea. Report an empty result if none fit.

Only edit the backlog. Before writing, verify that it has no pending edits. Re-read it and deduplicate the proposals against every card status. Append one `Feature:` card per proposal under the to-do section. Use `- [ ]` when the evidence supports the change for this product and there is a testable first version. Use `- [?]` when an important assumption remains unresolved and say what evidence or decision is needed. Include the priority, user problem, proposed change, main trade-off, acceptance check, and sources. Leave the file untouched when there are no new proposals or it already has pending edits.

If the backlog is the only change in a named checkout, commit just that file as `feature research: propose backlog cards`. Otherwise, leave your changes uncommitted. Report the proposals, evidence, and whether new `[ ]` cards were committed, in the configured language.
