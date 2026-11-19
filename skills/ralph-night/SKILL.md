---
name: ralph-night
disable-model-invocation: true
description: Run the backlog until the next 05:00 local time (set RALPH_NIGHT_END_HOUR and RALPH_NIGHT_TZ to change it).
---

# Ralph Night

```!
bash "$(git rev-parse --show-toplevel)/.claude/skills/ralph/start.sh" night
```

If the startup command was not executed, run it once with Bash from the project checkout. If startup reports an error, relay it and stop. Continue only after the plugin confirms activation.

Follow the night prompt printed by startup for the first round. The plugin repeats that prompt, with the same deadline, for subsequent rounds. Return to the launch checkout before ending each round so the plugin's Stop hook can continue the loop.
