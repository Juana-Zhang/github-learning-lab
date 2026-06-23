#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_dir"

today="$(date '+%Y-%m-%d')"
now="$(date '+%Y-%m-%d %H:%M:%S')"

topics=(
  "Python data analysis"
  "Prompt design"
  "AI agent workflow"
  "RAG fundamentals"
  "Testing with pytest"
  "GitHub Actions"
  "Docker basics"
  "Model evaluation"
  "Data cleaning"
  "README documentation"
)

notes=(
  "Captured one small learning checkpoint and kept the project history current."
  "Added a practical note that can be expanded into a deeper example later."
  "Recorded a lightweight study update to keep the learning trail consistent."
  "Documented one useful idea and a next step for future practice."
)

day_of_year="$(date '+%j')"
topic="${topics[$((10#$day_of_year % ${#topics[@]}))]}"
note="${notes[$((10#$day_of_year % ${#notes[@]}))]}"

cat >> learning-log.md <<NOTE

## ${today}

Learning update at ${now}

- Topic: ${topic}
- What I learned: ${note}
- Next step: Turn this note into either a short example, a checklist, or a cleaner explanation.
NOTE

git add learning-log.md

if git diff --cached --quiet; then
  echo "No learning-log changes to commit."
  exit 0
fi

git commit -m "docs: add learning update for ${today}"
