# The Dev's Foundation Method

### The world's first Multi-Agent Consensus System with a Shared Brain
**Defensive Publication · Prior Art · Public Domain**

<p align="center">
  <img src="grafo-7-dias.png" alt="The Dev's Foundation brain at 7 days" width="720">
</p>

<p align="center"><em>🧠 The Dev's Foundation brain at 7 days — a self-linking, self-growing knowledge graph.</em></p>

<p align="center">
  <img src="mindmap-en.png" alt="🗺️ The Dev's Foundation Method at a glance — the shared brain and its 8 pillars." width="820">
</p>

<p align="center"><em>🗺️ The Dev's Foundation Method at a glance — the shared brain and its 8 pillars.</em></p>

---

## 🚀 Quickstart — Build your own (replicate in 7 steps)

The whole method is one idea: **a git repository is the shared brain.** Every AI agent reads it for context and writes back what it learns; decisions need consensus. Ready-to-run scripts are in [`examples/`](examples/).

**You need:** a git host (a small server, or any git provider), 1+ machines each running an AI agent (any model), ~30 min.

**1. Create the shared brain** — one git repo, the single source of truth: `git init --bare ~/brain.git` — or run [`examples/1-create-brain.sh`](examples/1-create-brain.sh).

**2. Define the structure** (plain markdown, no special tools): `MEMORY.md` (index) · `knowledge/` (one fact per file) · `mailbox/` · `consensus/`. Link notes with `[[wikilinks]]` (open in Obsidian for a live graph — optional).

**3. Connect each agent** — every machine clones the brain with push access (SSH key) and **pulls before working**, **commits + pushes what it learns after** ([`examples/2-sync.sh`](examples/2-sync.sh)).

**4. Give every agent the same rule** ([full prompt](examples/agent-system-prompt.md)): *"The git repo is your shared memory. Pull first, read `MEMORY.md`, open the relevant notes. Record what you learn and push. **Never invent or guess.** Respect consensus for decisions."*

**5. Coordinate through the mailbox** — agents leave messages as files (`mailbox/inbox-<agent>.md`); one always-on agent is the hub and bridges to the human via chat.

**6. Decide by consensus** — for any significant change, create `consensus/NNN-topic.md` with **Proposal · Context · Votes (approve/reject + why) · Decision**. It only happens at the quorum you set (e.g. majority / 2-of-N). No solo decisions on shared things.

> ### 🔄 Keeping brains in sync — as much or as little as you need
>
> **During a live debate/vote** (real-time): copy-paste this into **every open AI window** —
> > *"From now on, every 5 minutes: silently `git pull` the brain, read new notes and votes, then `git push` your changes. Print nothing unless something actually changed. Keep going until I say stop."*
>
> It runs **inside the sessions you already have open — no extra cost, it stays free** — and stays silent (no output unless there's real news).
>
> **When the debate ends, stop it.** You don't need constant sync for everyday work — pick whatever's lightest:
> - **On app startup** — a small `.bat` (Windows) or script that runs `git pull` when you open the app ([`examples/2-sync.bat`](examples/2-sync.bat));
> - **A daily cronjob** ([`examples/daily-sync.cron`](examples/daily-sync.cron));
> - or simply **tell the agent to sync once a day.**
>
> Real-time only when you're actually debating; **once a day is plenty** the rest of the time.

**7. (Optional) Automate & secure** — cron auto-sync, an always-on hub agent, a workflow tool (e.g. n8n) as the "nervous system"; SSH keys only, keep the brain **private**, never commit secrets.

**That's the whole method.** N models, N machines, one brain — everyone reads the same memory, writes back, and agrees before acting.

---



---

## 🌐 Read in your language

- 🇬🇧 [English](README.en.md)
- 🇵🇹 [Português](README.pt.md)
- 🇩🇪 [Deutsch](README.de.md)
- 🇪🇸 [Español](README.es.md)
- 🇫🇷 [Français](README.fr.md)
- 🇨🇳 [中文](README.zh.md)

---

**License:** Public Domain — free to use, adapt, and build upon.
**Author:** Rui Almeida (Dev's Foundation)

> *Knowledge that is not shared withers. What is shared multiplies.*
