#!/usr/bin/env bash
set -euo pipefail

today="$(date '+%Y-%m-%d')"
now="$(date '+%Y-%m-%d %H:%M:%S')"

cat >> learning-log.md <<NOTE

## ${today}

Learning update at ${now}.

- Topic:
- What I learned:
- Next step:
NOTE

git add learning-log.md
git commit -m "docs: add learning update for ${today}"
