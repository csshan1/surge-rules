# Dmit-EB Surge Rules

This repository stores the shareable rule strategy for the Dmit-EB Surge profile.

It intentionally does not include proxy node subscriptions, passwords, or private node information.

## Files

- `rules/Direct.list`: Custom direct rules only. Use this as a Surge `RULE-SET` with `DIRECT`.
- `rules/*.list`: Mirrored upstream rules used by the Dmit-EB profile.
- `profiles/Dmit-EB.rules.conf`: The full `[Rule]` section from the profile, using only this repository's raw rule URLs.

## Recommended Usage

Add this line near the top of your Surge `[Rule]` section:

```ini
RULE-SET,https://raw.githubusercontent.com/<user>/<repo>/main/rules/Direct.list,DIRECT
```

Keep it before proxy and media rule sets so these domains always go direct.

The full profile rule section uses this repository as the only rule source:

```ini
RULE-SET,https://raw.githubusercontent.com/csshan1/surge-rules/main/rules/Direct.list,DIRECT
RULE-SET,https://raw.githubusercontent.com/csshan1/surge-rules/main/rules/OpenAI.list,Intelligence
RULE-SET,https://raw.githubusercontent.com/csshan1/surge-rules/main/rules/Apple.list,Apple
```

## Full Rule Section

After publishing to GitHub, the full rule section can be viewed at:

```text
https://raw.githubusercontent.com/<user>/<repo>/main/profiles/Dmit-EB.rules.conf
```

Surge profiles usually cannot import a partial `[Rule]` section directly as a `RULE-SET`, so `profiles/Dmit-EB.rules.conf` is best used as a canonical source to copy from or sync into a full profile.
