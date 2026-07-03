# Examples — copy & run

Minimal scripts to replicate the method. Not a framework — just the conventions.

| File | What it does |
|---|---|
| `1-create-brain.sh` | Creates the shared brain (bare git repo) + the folder structure. Run once. |
| `2-sync.sh` / `2-sync.bat` | Sync a local brain with the master (pull + push). Use at startup, on a timer, or on demand. |
| `daily-sync.cron` | Crontab line to sync once a day (real-time only during debates). |
| `agent-system-prompt.md` | The rule every agent gets. |

See the main guide (README) for the full 7-step walkthrough.
