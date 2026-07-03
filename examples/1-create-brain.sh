#!/usr/bin/env bash
# Create the shared brain: a bare git repo + the folder convention.
# Run once on the server (or use any private git provider).
set -e
git init --bare "$HOME/brain.git"                 # the master brain (single source of truth)
tmp="$(mktemp -d)"; git clone "$HOME/brain.git" "$tmp"; cd "$tmp"
mkdir -p knowledge mailbox consensus
printf '# Brain — index\n\n> one line per note\n' > MEMORY.md
printf 'These are the shared conventions. One fact per file. Link with [[wikilinks]].\n' > knowledge/_conventions.md
git add -A && git commit -m "chore: initialize shared brain" && git push origin HEAD:master
echo "Brain ready at $HOME/brain.git"
