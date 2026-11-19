# Project settings

The backlog skills read this file before every round. Replace each example with your project's values.

## Commands

- Install: `npm ci`
- Test: `npm test`
- Typecheck or lint: `npm run typecheck`
- Extra checks: list any check that applies only to certain changes, for example "For changes under `src/pricing/`, also run `npm run pricing-report` and paste its output into the report."

## Documents

- Backlog: `BACKLOG.md`. Cards live under the `## To do` heading.
- Progress log: `PROGRESS.md`. Newest report first.
- Optional context: `PLAN.md`, `VALIDATION.md`, or other docs the agent should read for open issues. Delete the ones you don't have.

## Backlog cards

- `- [ ]` ready to work
- `- [x]` done
- `- [?]` needs evidence or an owner decision
- `- [!]` blocked; the line gives the reason and the worktree path
- Feature cards from Feature Research start with `Feature:`.

## Autonomous scope

The agent may work on software reliability, accessibility, localization, build tooling, and feature work that fits the product direction below. Anything else goes to `[?]`.

## Reports

- Language: English
- Each report records **Done**, **Tested**, **Needs your decision**, and **Remaining**.

## Product direction

Describe in a few paragraphs:

1. What the product is, who uses it, and what a good session looks like.
2. The role of each main area, in priority order.
3. How you check that the direction works (what to observe in real use).
4. Hard limits the agent must keep, for example offline only, no accounts, no ads or tracking, or privacy commitments.
5. Whether the agent may add, replace, or remove existing features when evidence supports it.
6. Where users talk about the product or comparable products (stores, forums, issue trackers), so Feature Research knows where to look.
