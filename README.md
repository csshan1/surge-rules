# Dmit-EB Surge Rules

This repository stores the shareable rule strategy for the Dmit-EB Surge profile.

It intentionally does not include proxy node subscriptions, passwords, or private node information.

## Files

- `rules/Direct.list`: Custom direct rules only. Use this as a Surge `RULE-SET` with `DIRECT`.
- `profiles/Dmit-EB.rules.conf`: The full `[Rule]` section from the profile, including custom direct rules and upstream rule-set references.

## Recommended Usage

Add this line near the top of your Surge `[Rule]` section:

```ini
RULE-SET,https://raw.githubusercontent.com/<user>/<repo>/main/rules/Direct.list,DIRECT
```

Keep it before proxy and media rule sets so these domains always go direct.

## Full Rule Section

After publishing to GitHub, the full rule section can be viewed at:

```text
https://raw.githubusercontent.com/<user>/<repo>/main/profiles/Dmit-EB.rules.conf
```

Surge profiles usually cannot import a partial `[Rule]` section directly as a `RULE-SET`, so `profiles/Dmit-EB.rules.conf` is best used as a canonical source to copy from or sync into a full profile.
