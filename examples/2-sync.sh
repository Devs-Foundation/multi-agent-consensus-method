#!/usr/bin/env bash
# Sync a local brain with the master. Safe to run at startup, on a timer, or on demand.
set -e
cd "$(dirname "$0")/.."          # your local clone of the brain
git pull --rebase --autostash origin master
git push origin HEAD:master 2>/dev/null || true
