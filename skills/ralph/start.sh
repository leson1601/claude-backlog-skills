#!/bin/bash
set -euo pipefail

fail() {
  printf '%s\n' "$1" >&2
  exit 1
}

max_iterations=${1:-10}
prompt='Read .claude/skills/autopilot/SKILL.md and follow it for exactly one round.'
if [[ "$max_iterations" == night ]]; then
  max_iterations=0 # The plugin uses zero for unlimited rounds.
  end_hour=${RALPH_NIGHT_END_HOUR:-5}
  [[ "$end_hour" =~ ^([01]?[0-9]|2[0-3])$ ]] || fail 'RALPH_NIGHT_END_HOUR must be 0-23.'
  # An empty TZ means UTC, so only set it when a zone was given.
  [[ -z "${RALPH_NIGHT_TZ:-}" ]] || export TZ="$RALPH_NIGHT_TZ"
  deadline=$(python3 - "$end_hour" <<'PY'
import sys
from datetime import date, datetime, time, timedelta

cutoff = datetime.combine(date.today(), time(int(sys.argv[1])))
if cutoff <= datetime.now():
    cutoff += timedelta(days=1)
print(int(cutoff.timestamp()))
PY
)
  prompt="Night mode. Before starting each round, run date +%s. At or after $deadline ($(printf '%02d' "$((10#$end_hour))"):00 ${RALPH_NIGHT_TZ:-local time}), report the outcome and end with <promise>RALPH STOP</promise>. Until then, $prompt
If Scout finishes with no executable card, continue with a different untested user journey next round if available. Once these are exhausted, wait for 5 minutes or until the deadline, whichever comes first, before checking for new work. Repeat the wait while the evidence and backlog are unchanged. All other Autopilot stop conditions still apply."
else
  [[ "$max_iterations" =~ ^[1-9][0-9]*$ ]] || fail 'Ralph needs a positive iteration limit or night mode.'
fi

cd "$(git rev-parse --show-toplevel)"
git symbolic-ref --quiet HEAD >/dev/null || fail 'Ralph needs a named Git branch.'

lock=.claude/ralph-start.lock
mkdir "$lock" 2>/dev/null || fail 'Ralph startup is already locked in this checkout.'
trap 'rmdir "$lock"' EXIT

[[ ! -e .claude/ralph-loop.local.md ]] || fail 'A Ralph loop already owns this checkout. Use /cancel-ralph in its session.'
checkout_status=$(git status --porcelain)
[[ -z "$checkout_status" ]] || fail 'Ralph needs a clean checkout for isolated work and fast-forward merges.'
command -v jq >/dev/null || fail 'The Claude Code Ralph Loop plugin requires jq.'

registry="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/plugins/installed_plugins.json"
[[ -r "$registry" ]] || fail 'Install the official Ralph Loop plugin in Claude Code first.'

plugin_dir=$(jq -r --arg root "$PWD" '
  (.plugins["ralph-loop@claude-plugins-official"] // [])
  | (map(select(.projectPath == $root)) + map(select(.scope == "user")))
  | .[0].installPath // empty
' "$registry")
[[ -n "$plugin_dir" && -f "$plugin_dir/scripts/setup-ralph-loop.sh" ]] ||
  fail 'Install the official Ralph Loop plugin in Claude Code first.'

bash "$plugin_dir/scripts/setup-ralph-loop.sh" \
  "$prompt" \
  --max-iterations "$max_iterations" --completion-promise 'RALPH STOP'
