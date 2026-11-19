---
name: ralph
disable-model-invocation: true
description: Run the backlog from a clean checkout, up to 10 rounds including Scout.
---

# Ralph

```!
bash "$(git rev-parse --show-toplevel)/.claude/skills/ralph/start.sh"
```

If the startup command was not executed, run it once with Bash from the project checkout. If startup reports an error, relay it and stop. Continue only after the plugin confirms activation.

Read [.claude/skills/autopilot/SKILL.md](../autopilot/SKILL.md) and follow it for one round. Return to the launch checkout before ending each round so the plugin's Stop hook can continue the loop.
