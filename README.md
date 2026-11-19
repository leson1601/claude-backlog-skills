# Claude Code backlog skills

Skills that let Claude Code work through a project's `BACKLOG.md` on its own: pick a card, build it in an isolated worktree, test, commit, and find new work when the queue runs dry.

| Skill | What it does |
| --- | --- |
| `/ralph` | Runs up to 10 Autopilot rounds in a loop. |
| `/ralph-night` | Loops until 05:00 local time. |
| `autopilot` | One round: takes the first `- [ ]` card, works in a worktree, runs the checks, commits, and fast-forwards. |
| `scout` | When no card is ready: promotes `[?]` cards, walks a user journey, and adds fix cards. |
| `/feature-research` | Proposes evidence-backed `Feature:` cards. |

## Install

1. Copy `skills/*` into `.claude/skills/` at your repo root.
2. Fill in `.claude/skills/autopilot/references/project.md` with your commands, docs, scope, report language, and product direction. This is the only file you need to edit.
3. Install the official Ralph Loop plugin: `/plugin install ralph-loop@claude-plugins-official`.
4. Make sure `git`, `jq`, and `python3` are installed.
5. Recommended in `.claude/settings.json`: `"worktree": { "baseRef": "head" }`, so worktrees start from your current commit.
6. Create `BACKLOG.md` with a `## To do` section and `PROGRESS.md`, then commit so the checkout is clean.

```markdown
# Backlog

## To do

- [ ] Fix the crash when saving an empty form, test in `form.test.ts` passes, issue #12
```

## Run

Start `/ralph` or `/ralph-night` from a clean checkout on a named branch. Stop a running loop with `/cancel-ralph`.

Night mode ends at 05:00 local time. To change it, set environment variables before starting Claude Code, for example `RALPH_NIGHT_END_HOUR=6 RALPH_NIGHT_TZ=Europe/Berlin`.

The iteration limit for `/ralph` is 10. To change it, edit the `start.sh` call in `.claude/skills/ralph/SKILL.md` to pass a number, for example `start.sh 5`.
