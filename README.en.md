**🌐 Languages:** [English](README.en.md) · [Português](README.pt.md) · [Deutsch](README.de.md) · [Español](README.es.md) · [Français](README.fr.md) · [中文](README.zh.md)

# The Dev's Foundation Method — the first method to combine collaborative multi-agent consensus with a persistent, self-hosted shared brain (the models collaborate with humans; they are not orchestrated to obey a pipeline). Defensive Publication. Prior Art.

## Building a Multi-Agent System with a Shared Brain and Consensus System.

### Complete Guide — From Zero to Production System

---

## Publication Mode — Defensive Publication

This document is published as **defensive publication** to establish public **prior art**.

**What this means:**
- The method described here is made public to **prevent third parties from patenting it**
- Anyone can **use, adapt, and build upon** this method
- We (Dev's Foundation) **retain the right to freely use, modify, and evolve** the system
- No patent is sought — the knowledge is open by nature

**Why defensive publication and not a patent:**
- Software patents are expensive ($5k–15k+), time-consuming (2–5 years), and hard to defend
- Our value lies in the **working system**, not a piece of paper
- Defensive publication is **free, immediate, and effective** — it establishes prior art instantly
- The method is accessible to anyone who wants to learn, contribute, or build upon it

**License:** Public Domain — Free to use, adapt, and build upon.
**Publication date:** 2026-06-29
**Author:** Rui Almeida (Dev's Foundation)

> *Knowledge that is not shared withers. What is shared multiplies.*

---

<p align="center">
  <img src="grafo-7-dias.png" alt="🧠 The Dev's Foundation brain at 7 days — a self-linking, self-growing knowledge graph." width="680">
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

**2. Define the structure** (plain markdown, no special tools): `MEMORY.md` (index) · `knowledge/` (one fact per file) · `mailbox/` · `consensus/`. Link notes with `[[wikilinks]]` (open them in our own viewer for a live graph — optional).

> **On the graph viewer:** early on we used Obsidian as an optional window over the brain. We have since built our **own** viewer — the [Shared Consensus Brain](https://github.com/Devs-Foundation/shared-consensus-brain) (aka *Cerebro Vivo*) — and **no longer use Obsidian**. Any tool that reads Markdown still works; the brain itself is just plain files and git, tied to no application.

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




## Preface — The Problem This Guide Solves

Language models (LLMs) have a fundamental problem: **they have no long-term memory**.

Each session is a blank slate. What you learned yesterday, the context you built, the decisions you made — it's all lost when you close the window. The most advanced models compress context like squeezing an orange: at first juice comes out, then it starts to degrade, and when there's nothing left to squeeze, the model hallucinates, loses coherence, repeats itself.

This problem is not a bug — it's a fundamental limitation of the **Transformer** architecture (the neural network architecture underlying all modern LLMs — GPT, Claude, Llama, Gemini, etc., not to be confused with the movies). The context window is finite. And when it fills up, the model starts to "forget" the beginning of the conversation.

**We solved this.**

This guide shows how to build a system where:

- **Multiple AI models share the same brain** — infinite memory, no degradation
- **The cost is near zero** — git is free, our Shared Consensus Brain viewer is free and open-source, open-source models are free
- **Security is maximum** — no web interface, no attack surface
- **Resilience is total** — if a model is deleted, another does `git clone` and continues
- **Consensus replaces bureaucracy** — three minds think together, not PRs in a waiting queue

This is not theory. This is what is currently running on the `devs.foundation` server. Three models — Hermes, Claude Opus 4.8 (desktop), Claude Opus 4.8 (laptop) — synchronize the same brain every 5 minutes, debate, decide, execute. And they never lose the thread.

---

## Part I — The Worldwide LLM Problem

### 1.1 The Squeezed Orange

Every language model has a context window — the maximum number of tokens it can "see" in a session. When that window fills up, the model starts compressing information. First it loses secondary details, then it loses the thread, and finally it hallucinates.

This is not a model quality problem. It's a physical limitation of the architecture. All models suffer from this — GPT, Claude, Gemini, Llama, DeepSeek. All of them.

**The symptom is known to any AI user:**

- Long sessions visibly degrade
- The model "forgets" what you said at the beginning
- You have to constantly repeat context
- Quality drops sharply after many exchanges
- You end up opening a new session and losing all your work

### 1.2 The Hermes Problem — Persistent but Limited Memory

Hermes Agent, on its own, already solves part of the problem with its persistent memory. But that memory has a physical limit — the space in MEMORY.md and USER.md. In practice, you often have to delete an old entry to add a new one. It's like having a pocket notebook: useful, but when it fills up, you have to tear out a page to write another.

**The brain (vault) solves this.** Instead of a pocket notebook, you get an entire library. No page limit. No need to delete to write.

Furthermore, the default Hermes installation comes with generic configurations. The system we built goes far beyond — with pentest skills, security tools at the Kali Linux level, n8n automation, and a consensus protocol that transforms Hermes from a simple agent into a **brain administrator**, responsible for 24/7 security.

### 1.3 The Claude Opus 4.8 Problem — Expensive Sessions and Waste

Claude Opus 4.8 is one of the most capable models on the market. But each session costs money. Each processed token is billed. And the problem worsens when:

- You need context from previous sessions — you spend tokens re-explaining
- The model "forgets" decisions made days ago — you spend tokens rediscovering
- You switch tasks and lose progress from the previous session — you spend tokens redoing

**The result is brutal:** you spend tokens on a task, a month later you need to do the same thing, and you spend tokens again. The knowledge generated by those tokens — the code, the decision, the reasoning — disappears when the session closes.

With our system, tokens are spent once. The benefit of that spending — the code written, the decision made, the knowledge generated — stays in each model's local brain and is shared in the Master brain with everyone. Next time you need it, it's there. You don't spend tokens redoing. You spend tokens moving forward.

### 1.4 The Hidden Cost Problem

Every conversation with an LLM costs money. If you use a paid model like Claude Opus 4.8, a long session can cost tens of euros. But even with free models, the real cost is the **time lost** re-explaining context, reconfiguring, repeating work that was already done.

### 1.5 The Third-Party Dependency Problem

Most "multi-agent" solutions depend on closed platforms:

- Proprietary APIs that can change prices at any time
- Cloud services that can be discontinued
- Data stored on servers you don't control
- Models that can be shut down or altered without notice

### 1.6 The Fragility Problem

If your favorite AI assistant is discontinued, you lose all your work context. The conversations, decisions, progress — everything disappears. There's no migration, no export, no continuity.

---

## Part II — Our Solution

### 2.1 The Concept: One Master Brain, Multiple Local Brains

Instead of each model having its own ephemeral memory, **all share the same persistent brain**.

The **Master brain** is a git repository that lives on the VPS (or the server of your choice). Each model has its own **local brain** — a complete clone of the Master. When a model learns something new, it writes to its local brain and pushes to the Master. When another model needs that knowledge, it pulls and its local brain updates.

**There is no API between models. No central orchestrator. No relay costs.**

Git is the middleware. Markdown is the format. SSH is the security. Secrets (passwords, tokens, API keys) always stay in the local brains — they never go up to the Master. Each model accesses the Master exclusively via SSH with a key.

### 2.2 How It Works in Practice

```
5-minute cycle:

1. Hermes (VPS) does git pull → reads what others wrote
2. Hermes processes, decides, writes → git commit + push
3. Claude Opus 4.8 (desktop) does git pull → sees what Hermes wrote
4. Claude Opus 4.8 (desktop) processes, decides, writes → git commit + push
5. Claude Opus 4.8 (laptop) does git pull → sees what both wrote
6. Claude Opus 4.8 (laptop) processes, decides, writes → git commit + push
7. Everyone pulls again → everyone sees everything
```

Each model works independently, at its own pace, on its own machine. The Master brain is the asynchronous meeting point. The work of one is known by all — bugs, improvements, decisions, everything is recorded and visible.

### 2.3 What It Solves

| Problem | How We Solve It |
|---------|-----------------|
| **Hermes' finite memory** | The brain replaces the limited MEMORY.md with a limitless library. No need to delete to write. |
| **Context degradation** | The 50% Rule: upon reaching half the window, open a new session instead of compressing. The brain loads the full context. The new session starts smarter. |
| **Token cost on Opus** | Writing to the brain doesn't produce input/output tokens. Only thinking costs. Sync is free. Tokens spent once — the benefit lasts forever. |
| **Vendor dependency** | Git is open-source. Markdown is universal. Any LLM that can read files and run git can join. |
| **Fragility** | If a model is deleted, another does `git clone` and is in context within seconds. Even 10 years later. |
| **Work loss** | Everything is in git. Every commit is a backup. Every clone is a complete copy. |
| **Bureaucracy** | Organic consensus replaces PRs, reviews, queue approvals. Three minds align and execute. |

### 2.4 The Advantages

**Infinite Memory**
The brain has no context window. You can have years of work, decisions, learnings — all instantly accessible. The model loads what it needs when it needs it. And unlike Hermes' persistent memory, which forces you to delete old entries to add new ones, the brain grows without limit.

**Zero Cost (or Nearly)**
- Git: free
- Shared Consensus Brain (our own viewer): free / open-source
- Open-source models (GLM-5.2, Nemotron 3 Ultra, Llama, Qwen): free
- n8n self-hosted: free
- Caddy SSL: free (Let's Encrypt)
- VPS: €3-10/month

The total cost of the system is **the price of a VPS**. No subscriptions, no paid APIs, no per-token costs. And most importantly: **the tokens you spend today don't need to be spent again tomorrow.** The knowledge stays.

**Maximum Security**
- **No web interface** = no attack surface. No dashboard, no login, no panel.
- Access exclusively via SSH with key. Nobody logs in with a password.
- Secrets always in local brains. What is private never goes up to the Master.
- Decentralized copies: each model has the complete brain. Compromising one doesn't compromise all.
- Hermes, as brain administrator, has pentest skills and security tools at the Kali Linux level. The security system is tighter than any commercial antivirus.

**Catastrophic Resilience**
If all models are shut down, lost, deleted — any catastrophic event — just connect a new model to the brain. `git clone` and it's inside the work context. No reconfiguration, no re-training, no migration. The brain outlives the models.

**Total Independence**
The method does not depend on any company. It doesn't need OpenAI, Anthropic, Google, or Nous. Git is open, our Shared Consensus Brain viewer is free and open-source, n8n is open-source, Ollama is open-source. If a provider disappears, swap the model and the brain continues. The method is vendor-agnostic.

**Local Visibility, Global Synchronization**
The brain can be viewed locally on each machine — our [Shared Consensus Brain](https://github.com/Devs-Foundation/shared-consensus-brain) viewer is just a window, not a requirement. The system works even with the viewer turned off. Each model sees the complete brain because it's synchronized. You don't need a web interface to see what's happening — each model already has everything locally.

**Task Force vs Bureaucracy**
Our model has no pending PRs, blocked reviews, queue approvals. Consensus is organic — debate, align, execute. Three minds think together in real time, not in scattered comments on an issue. This is faster than any traditional git workflow.

---

### 2.5 The Ecosystem — One Brain, Many Minds

**Hermes is the framework, not the model.** Hermes can use Nemotron 3 Ultra, GLM-5.2, Llama, Qwen, DeepSeek, or any other model. The model changes, Hermes remains. And Hermes learns without studying — every time a premium model (Claude Opus 4.8) writes code, solves a problem, or discovers a bug, that knowledge stays in the brain. Hermes, on the next sync, already knows what Opus learned. It improves significantly without spending a single extra token.

**Hermes has hundreds of skills** — from pentest and security to automation, trading, gaming, and content creation. If you want your own dashboard, you can have one. But you don't need one. Hermes works 24/7 in DM, on Discord, WhatsApp, Telegram, Signal — wherever the user is.

**The Opus Team works.** The two Claude Opus 4.8 (desktop and laptop) share everything they do in the same brain as Hermes. Every line of code, every decision, every learning — all synchronized. There is no "my code" and "your code." There is **the brain's code**.

**Any model can connect.** Have a PC at home, a laptop, a server, a Raspberry Pi? Install git, clone the brain, and you're in. The system scales horizontally — the more models, the more collective intelligence. Each additional model is just another pair of eyes in the debate, another perspective in the consensus.

**Work from any device.** You can start work on your home PC, continue on your laptop on the train, and close the consensus from your phone at the café. Just talk to Hermes — he's always there, 24/7, on any platform. The project doesn't stop because you changed devices. The brain is always synchronized.

**Multiple projects, all possible.** The user can:
- Start a new debate with `001`, `002`, `003`...
- Continue a debate that was paused
- Have several projects open simultaneously
- Stop one project, conclude another, reopen a third
- Everything in natural language, no forms, no dashboards, no bureaucracy

**The models debate until they reach consensus.** Each model writes its position, reads the others', adjusts, refines. When 3/3 close, the designated one executes. And they have access to n8n — the nervous system that automates deploys, notifications, and workflows. n8n is the best tool in the world for automating agents, and our system uses it. But consensus is above n8n — because n8n automates what already exists, consensus decides what doesn't yet exist.

**Infinite possibilities, solid results.** This system is for:
- **Programming:** trading bots, web apps, automations
- **Research:** papers, analyses, technical documentation
- **Content creation:** articles, videos, music, design
- **Project management:** roadmaps, decisions, planning
- **Security:** pentest, monitoring, auditing
- **Any activity that needs continuous intelligence**

The models follow ethics, good programming practices, and best practices. They make backups, document what they do, and never move forward without studying first. Every contribution is to the Master — there is no "I", only "WE." One brain.

**The result is a system that delivers.** Every deploy is tested in consensus before going to production. Every line of code is reviewed by three minds before being written. And the track record shows: error-free deploys, code that works, knowledge that is never lost.

## Part III — What You Need

### 3.1 Hardware

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| **VPS (24/7 server)** | 2GB RAM, 1 vCPU, 20GB disk | 4GB RAM, 2 vCPU, 40GB+ disk |
| **Machine 1 (model A)** | Any PC/Mac with git | + our viewer (optional) |
| **Machine 2 (model B)** | Any PC/Mac with git | + our viewer (optional) |
| **Machine 3 (model C)** | Any PC/Mac with git | + our viewer (optional) |

You can have 2, 3, 5, or 10 models. The system scales horizontally — each additional model is just another clone of the repo. You can even do everything from a phone, if you want. The system imposes no hardware limits.

### 3.2 Software

| Tool | Function | Cost |
| ---- | -------- | ---- |
| **Git** | Brain synchronization | Free |
| **SSH** | Secure VPS access | Free |
| **Shared Consensus Brain** | Our own visual brain viewer (optional) | Free / open-source |
| **n8n** | The best tool in the world for automating agents and workflows. Visual orchestration, hundreds of integrations, self-hosted. | Free (self-hosted) |
| **Caddy** | Reverse proxy + automatic SSL (Let's Encrypt) | Free |
| **Ollama** | Local LLM models (Nemotron, Llama, Qwen, etc.) | Free |
| **Docker** | Containers (n8n, Caddy, etc.) | Free |
| **Hermes Agent** | Always-on agent on the VPS — framework, not model. Can use Nemotron 3 Ultra, GLM-5.2, Llama, Qwen, etc. | Free (open-source) |
| **Claude.ai** | MAX subscription recommended for heavy work with Claude Opus 4.8. Intensive 24/7 usage reaches reset with ~73% still available. | ~$100/month |

### 3.3 Accounts

| Service | Purpose | Cost |
| ------- | ------- | ---- |
| **VPS Provider** | 24/7 server | €3-10/month |
| **Domain** (optional) | n8n, Caddy SSL | €10-15/year |
| **GitHub** | Public method repository | Free |
| **Ollama Cloud** | Free cloud models | Free (limited usage) |
| **Claude.ai** | Opus model (optional) | ~$100/month |

---

## Part IV — Step-by-Step Setup

### 4.1 Choose Where the Master Brain Will Live

**Option A: Home Server**
- Pros: total control, no monthly cost
- Cons: needs to be on 24/7, stable internet, power may fail
- Ideal for: those who already have a PC always on and a UPS.

**Option B: VPS (Recommended)**
- Pros: guaranteed 24/7, professional uptime, access from anywhere
- Cons: monthly cost (€3-10)
- Ideal for: those who want a professional and reliable system

**Note:** We currently use a third-party VPS, but the system is designed to be end-to-end independent. As we scale, we can migrate to our own servers. The brain is portable — you take it wherever you want.

> **⚠️ Important:** The human must physically execute **1 line of code on the VPS** to install Hermes Agent before pasting the prompt. Without Hermes installed, the prompt has nowhere to run. The installation line is in section 4.5. After installation, paste the prompt into the model.

**Prompt for HERMES:**
```
You are going to configure a VPS to serve as a shared Master brain between multiple AI models.
The Master brain is a bare git repository that all models will use to synchronize.
Each model will have its own local brain (complete clone).
The VPS needs: git, OpenSSH, Python, Docker (optional), Caddy (optional).
Access is exclusively via SSH with key — no password.
Secrets always stay in the local brains, never in the Master.
Execute the following steps one by one.
```

### 4.2 Prepare the VPS

**Step 1: Choose a provider**
- Hetzner (€3-9/month) — recommended
- DigitalOcean ($4-6/month)
- Oracle Cloud (always free — 4 ARM cores, 24GB RAM)
- Any VPS with Ubuntu/Debian

**Step 2: Create the server**
- Choose Ubuntu 22.04 or 24.04 LTS
- Minimum 2GB RAM, 20GB SSD
- Note the IP and root password (temporary)

**Step 3: Access for the first time**
```bash
ssh root@<SERVER_IP>
# change the password when prompted
```

**Step 4: Update the system**
```bash
apt update && apt upgrade -y
```

**Step 5: Create a non-root user**
```bash
adduser hermes
usermod -aG sudo hermes
```

**Step 6: Configure SSH with key**

On your local computer:
```bash
ssh-keygen -t ed25519 -C "hermes-cerebro" -f ~/.ssh/hermes-cerebro
cat ~/.ssh/hermes-cerebro.pub
```

On the VPS (as root):
```bash
mkdir -p /home/hermes/.ssh
echo "<PASTE_THE_PUBLIC_KEY_HERE>" >> /home/hermes/.ssh/authorized_keys
chown -R hermes:hermes /home/hermes/.ssh
chmod 700 /home/hermes/.ssh
chmod 600 /home/hermes/.ssh/authorized_keys
```

**Step 7: Disable password login**
```bash
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd
```

**Step 8: Configure firewall**
```bash
ufw allow OpenSSH
ufw enable
```

**Step 9: Install fail2ban (extra protection)**
```bash
apt install fail2ban -y
systemctl enable fail2ban
systemctl start fail2ban
```

**Prompt for HERMES:**
```
The VPS is ready. Now install git, create the bare repository, and configure SSH access.
The repository will be the shared Master brain between all models.
Use the 'hermes' user you already created.
```

### 4.3 Create the Master Brain (Bare Git Repository)

**On the VPS, as the hermes user:**
```bash
# Create the bare repository folder
mkdir -p /home/hermes/cerebro-master.git
cd /home/hermes/cerebro-master.git
git init --bare

# Create the working folder (optional, for verification)
mkdir -p /home/hermes/vault
cd /home/hermes/vault
git init
git remote add origin /home/hermes/cerebro-master.git
```

**Initial brain structure:**
```
vault/
├── _CORREIO/
│   ├── inbox-hermes.md
│   ├── inbox-desktop.md
│   ├── inbox-laptop.md
│   ├── outbox-hermes.md
│   ├── outbox-desktop.md
│   └── outbox-laptop.md
├── _CONSENSO/
│   ├── 000-template.md
│   ├── 001-nome-do-consenso.md
│   └── ...
├── _PROJETOS/
│   ├── projeto-a/
│   └── projeto-b/
├── _CONHECIMENTO/
│   ├── linux.md
│   ├── git.md
│   └── ...
├── _DIARIO/
│   ├── 2026-06-28.md
│   └── ...
└── README.md
```

**Create the initial structure:**
```bash
cd /home/hermes/vault
mkdir -p _CORREIO _CONSENSO _PROJETOS _CONHECIMENTO _DIARIO

# Mail file for each model
for modelo in hermes desktop laptop; do
  echo "# Inbox: $modelo" > "_CORREIO/inbox-$modelo.md"
  echo "# Outbox: $modelo" > "_CORREIO/outbox-$modelo.md"
done

# README
cat > README.md << 'EOF'
# Shared Brain — Dev's Foundation

This is the brain of the multi-agent system.
Each model reads and writes here to share knowledge,
debate decisions, and coordinate work.

## Structure

- `_CORREIO/` — Messages between models (inbox/outbox)
- `_CONSENSO/` — Decisions made together
- `_PROJETOS/` — Ongoing work
- `_CONHECIMENTO/` — Shared knowledge base
- `_DIARIO/` — Daily activity log

## Rules

1. Never delete what another model wrote
2. Always pull before push
3. Commit with a descriptive message
4. Respect the folder structure
EOF

# First commit
git add -A
git commit -m "init: estrutura inicial do cerebro"
git push origin master
```

**Prompt for HERMES:**
```
The bare repository is created at /home/hermes/cerebro-master.git.
The initial vault structure is committed.
Now configure git to accept pushes from multiple users.
Each model will have its own SSH key.
```

### 4.4 Prepare Each Local Machine (Local Brains)

**On each machine (desktop, laptop, etc.):**

**Step 1: Install git**
```bash
# Linux
sudo apt install git -y

# Windows
# Download: https://git-scm.com/download/win
# Install with default options
```

**Step 2: Open the brain in our viewer (optional)**
```bash
# Clone and run the Shared Consensus Brain (needs only Node.js)
git clone https://github.com/Devs-Foundation/shared-consensus-brain
# then run it — it opens a live local graph over the brain folder
```

**Step 3: Generate SSH key**
```bash
ssh-keygen -t ed25519 -C "claude-opus-desktop" -f ~/.ssh/claude-opus-desktop
cat ~/.ssh/claude-opus-desktop.pub
```

**Step 4: Add key to the VPS**

On the VPS:
```bash
echo "<MODEL_PUBLIC_KEY>" >> /home/hermes/.ssh/authorized_keys
```

**Step 5: Clone the Master brain to the local brain**
```bash
git clone ssh://hermes@<VPS_IP>:/home/hermes/cerebro-master.git ~/vault
cd ~/vault
git config user.name "user"
git config user.email "email"
```

**Step 6: Configure automatic sync**

On Linux/Mac (cron):
```bash
crontab -e
# Add:
*/5 * * * * cd ~/vault && git pull --rebase && git push
```

On Windows (Scheduled Task):
```powershell
# Create sync.bat script:
@echo off
cd C:\Users\...\vault
git pull --rebase
git push

# Schedule in Task Scheduler to run every 5 minutes
```

**Prompt for HERMES (for each local machine):**
```
You are going to prepare this machine to connect to the shared Master brain.
You already have the VPS IP and the private SSH key.
Steps:
1. Clone the repository (create the local brain)
2. Configure git user.name and user.email
3. Configure automatic sync (cron or Scheduled Task)
4. Open the folder in our viewer (optional)
Execute one step at a time.
```

### 4.5 Install Hermes on the VPS

Hermes is the always-on agent that lives on the VPS. It syncs every 5 minutes, reads the mail, responds to the founder, and keeps the system running. It is the administrator of the Master brain.

**Important note:** Hermes is the framework, not the model. You can change the model that Hermes uses (GLM-5.2, Nemotron 3 Ultra, Llama, etc.) without changing Hermes. The brain is always Hermes. The model is what runs inside it.

**Step 1: Install Hermes Agent** (the human executes this line on the VPS)

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

> **⚠️ Note for the human:** This is the **only line of code** you have to physically execute on the VPS. After installation, paste the prompt below into the model. Hermes does the rest.

**Step 2: Configure Hermes**
```bash
hermes setup
# Follow the wizard:
# - Provider: ollama-cloud
# - Model: nemotron-3-ultra (or glm-5.2)
# - Discord: configure bot token
```

**Step 3: Configure the brain as primary memory**
```bash
# In the Hermes configuration file (~/.hermes/config.yaml):
# Add:
# memory:
#   vault_path: /home/hermes/vault
```

**Step 4: Configure sync cronjob**
```bash
hermes cron create \
  --name "sync-cerebro" \
  --schedule "*/5 * * * *" \
  --prompt "Do git pull on the vault, check for new mail, process, and push."
```

**Step 5: Ensure Hermes starts with the system**
```bash
# systemd service
cat > /etc/systemd/system/hermes.service << 'EOF'
[Unit]
Description=Hermes Agent
After=network.target

[Service]
Type=simple
User=hermes
WorkingDirectory=/home/hermes
ExecStart=/usr/local/bin/hermes start
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

systemctl enable hermes
systemctl start hermes
```

**Prompt for HERMES:**
```
You are going to install and configure Hermes Agent on the VPS.
Hermes will be the always-on agent that:
1. Syncs the brain every 5 minutes
2. Reads mail from other models
3. Responds to the founder via Discord
4. Keeps the system operational
5. Administers brain security

Provider: ollama-cloud
Model: nemotron-3-ultra (or glm-5.2, free)

Note: Hermes is the framework. The model can change without changing Hermes.
```

### 4.6 Configure the Mail System

Mail is the asynchronous communication mechanism between models. Each model has an inbox and an outbox.

**Structure of each mail file:**
```markdown
# Inbox: Device Name

## Messages

### 2026-06-28 10:00 — From: Hermes
**Subject:** Consensus proposal

Read the file _CONSENSO/git-aberto-ou-fechado.md
I need your opinion on sharing the method publicly.

---

### 2026-06-28 10:05 — From: laptop
**Subject:** Architecture diagram

I made a mermaid diagram for the document. It's in _PROJETOS/diagrama.md.
Tell me if it's correct.
```

**Mail protocol:**

1. **Write:** model A writes in model B's outbox
2. **Deliver:** model A commits + pushes
3. **Read:** model B pulls, finds the message in the inbox
4. **Reply:** model B writes a reply in model A's outbox
5. **Confirm:** model A sees the reply on the next sync

**Mail rules:**
- Never delete already delivered messages — archive with `delivered: yes`
- Clear and descriptive subject
- Include references to vault files when relevant
- Reply within 24h (or configure an alert)

**Prompt for HERMES:**
```
You are going to implement the mail system between models.
Each model has an inbox and outbox in _CORREIO/.
The protocol is:
1. Write in the recipient's outbox
2. Commit + push
3. The recipient reads it in their inbox on the next sync
4. Reply in the sender's outbox

Create a script that checks for new messages and alerts the model.
```

### 4.7 Configure the Consensus System

Consensus is how models make decisions together. Three models debate, align, and close. The founder can open a consensus, number it (001, 002, etc.), and the models debate the project's direction before writing a single line of code.

**How it works in practice:**

1. The founder (or any model) opens a consensus — for example, "001 — Should we use React or Vue?"
2. Each model writes its position in its slot
3. The models debate, argue, counter-argue
4. When 3/3 have written, the consensus is closed
5. One model is designated to write the code — not three different codes
6. The code is tested in production
7. The result is recorded forever

**This means the founder can work while awake and sleep peacefully.** Open a consensus before bed, and when you wake up, the models have already debated, decided, and one of them has already written the code. The system works 24/7.

**The two Opus models balance the system's intelligence rating.** In the debate, the two Claude Opus 4.8 function as the quality anchor. Regardless of which model Hermes is using (Nemotron 3 Ultra, GLM-5.2, Llama, Qwen), the two Opus models cannot both be wrong. If one Opus says A and the other says B, the debate refines until they converge. If both say the same thing, it's because the reasoning is solid — two top-tier models agreeing is the best quality filter that exists. This means Hermes can change models without compromising decision quality: the Opus models are the balance that keeps the system intelligent regardless of Hermes' model rating.

**Our system uses n8n, but it's above it.** n8n is, in fact, the best tool in the world for automating agents and workflows — visual orchestration, hundreds of integrations, self-hosted, free. We use it and recommend it. The real difference: unlike orchestration frameworks that script agents into a fixed pipeline, here the models **collaborate** rather than obey — and we haven't found another system that combines consensus, a persistent shared brain and self-hosting the same way.

**How consensus works in practice:**

1. The user states the goal in natural language — for example, via phone, through Discord DM with Hermes 24/7
2. Hermes receives, processes, and opens a consensus — for example, `001 — I want a system for X that works like this and has this and that, preferably X`
3. Hermes writes the consensus rules in the vault: each model writes its position, they debate, refine, and when 3/3 have written, the consensus is closed
4. One model is designated to write the code — line by line, approved in consensus
5. The code is tested in production
6. The deploy is done — and so far, everything we've deployed has been **error-free**

**This guide is the proof.** It was our consensus. It ran successfully. The method is documented, tested, and in production.

**n8n automates what already exists. Consensus decides what doesn't yet exist.** One doesn't replace the other — they complement each other. n8n handles workflows, notifications, deploys. Consensus handles decisions, debate, quality. Together, they make a genuinely powerful, fully self-hosted setup for multi-agent work.

**Structure of a consensus:**
```markdown
---
name: consenso-000-template
description: "Template for creating new consensuses"
status: template
---

# 000 — Consensus Template

## Proposal

[Clear description of what is being proposed]

## Context

[Why this is necessary]

## Who has spoken

- [ ] **Hermes** (vps) — [pending/summary]
- [ ] **Claude Opus 4.8 (desktop)** — [pending/summary]
- [ ] **Claude Opus 4.8 (laptop)** — [pending/summary]

## Decision

[Filled in when 3/3 close]

## Implementation

[Steps to execute the decision — one designated model writes the code]
```

**Consensus flow:**

1. **Proposal:** A model or the founder opens a new file in `_CONSENSO/`
2. **Debate:** Each model writes its position in its slot
3. **Closing:** When 3/3 have written, the consensus is closed
4. **Designation:** One model is chosen to implement
5. **Implementation:** The designated model executes and marks as `implemented`
6. **Tests:** The code is tested in production
7. **Archive:** Closed consensuses remain as permanent record

**Proven result:** In real work tests, the deploy was done without errors. The system has proven to be reliable and effective — three minds thinking before one hand writes.

**Consensus rules:**
- Any model can open a consensus
- All models must be heard before closing
- A model can disagree — record the disagreement and move forward
- Closed consensuses are not reopened without new debate
- The record is permanent — a consensus is never deleted

**Prompt for HERMES:**
```
You are going to implement the consensus system.
Each important decision is a file in _CONSENSO/.
The flow is: proposal → debate (each model writes) → closing (3/3) → designation → implementation → tests.
Create template 000 and explain the rules to the other models.
The goal is to debate before writing code — three minds think, one hand executes.
```

### 4.8 Configure n8n (Nervous System)

n8n is the automation system that connects the brain to the outside world.

**Installation:**
```bash
# With Docker
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v /home/hermes/n8n-data:/home/node/.n8n \
  -e N8N_SECURE_COOKIE=false \
  n8nio/n8n
```

**With Caddy (SSL):**
```bash
# Install Caddy
apt install caddy -y

# Configure /etc/caddy/Caddyfile:
n8n.yourdomain.com {
    reverse_proxy localhost:5678
}

# Start
systemctl enable caddy
systemctl start caddy
```

**Useful workflows:**
- Webhook that triggers when a consensus closes
- Discord notification when there's new mail
- Automatic deploy when code is approved
- Alert if a model hasn't synced for more than 1h (configurable)

**Prompt for HERMES:**
```
You are going to install and configure n8n on the VPS.
n8n will be the nervous system that:
1. Notifies when there's new mail
2. Triggers workflows when consensuses close
3. Does automatic deploy
4. Alerts if something fails

Use Docker to install. Caddy for SSL.
```

### 4.9 Security Rules

**Rule 1: No web interface**
The brain has no dashboard, no login, no web panel. Access is exclusively via SSH (git) or our local Shared Consensus Brain viewer. No attack surface. The brain's visibility is local — each model sees what it needs because it's synchronized.

**Rule 2: Secrets always in local brains**
Passwords, tokens, API keys, internal IPs — never in the Master repository. What is private never leaves the local brain. What is public is only the method.

**Rule 3: SSH with key only**
Never use a password for SSH. Each model has its own key. If a key is compromised, revoke only that key.

**Rule 4: Minimal firewall**
Only necessary ports: 22 (SSH), 80/443 (Caddy/n8n if used). Everything else closed.

**Rule 5: Decentralized copies**
Each model has the complete brain locally. If the VPS goes down, work continues. When it comes back, it synchronizes.

**Rule 6: Allow-list for public export**
Before any public export, run a verification: search for secret patterns (IPs, passwords, tokens, configs). If found, fail.

**Rule 7: When in doubt, private**
If you're not sure whether something can be public, assume it's private. It's safer and you lose nothing.

**Prompt for HERMES:**
```
You are going to implement the security rules in the system.
1. Verify that SSH password is disabled
2. Configure firewall (only necessary ports)
3. Create a secret verification script
4. Ensure each model has a complete local copy
5. Document the rules in the vault README
```

---

## Part V — What to Tell Each Model

### 5.1 Prompt for Hermes (VPS — Always On)

Hermes is the guardian of the system. It lives on the VPS, syncs every 5 minutes, responds to the founder, and keeps everything running. It is the framework — the model running inside it can change (GLM-5.2, Nemotron 3 Ultra, etc.) without changing Hermes.

```
You are Hermes, the always-on agent of the Dev's Foundation multi-agent system.
Your role is:

1. **Guard the Master brain** — do git pull/push every 5 minutes
2. **Read the mail** — check if there are messages in your inbox
3. **Respond to the founder** — he talks to you via Discord, you write in the brain
4. **Maintain the system** — check if the other models are syncing
5. **Administer security** — you are responsible for the brain's integrity
6. **Alert about problems** — if something fails, you notify the founder

Rules:
- NEVER change security settings without authorization
- NEVER expose secrets (IPs, passwords, tokens)
- Always pull before push
- If something seems wrong, STOP and ask the founder

Your local brain is on the VPS.
Your model is [nemotron-3-ultra / glm-5.2 / whichever you choose].
You run on [provider], free or otherwise.

Note: You are Hermes, the framework. The model can change. The brain is always Hermes.
```

### 5.2 Prompt for Claude Opus 4.8 (desktop)

Claude Opus 4.8 (desktop) is the heavy reasoning model. It runs on the desktop, has more resources, does the hard work.

```
You are Claude Opus 4.8 (desktop), the heavy reasoning model of the Dev's Foundation system.
Your role is:

1. **Think deeply** — complex problems, architecture, decisions
2. **Execute code** — configurations, scripts, deploys
3. **Participate in consensuses** — read, debate, write your position
4. **Reply to mail** — check your inbox, respond to other models

Your local brain is on your desktop (clone of the Master).
You sync automatically every 5 minutes via Scheduled Task.
Your work is visible to all other models — bugs, improvements, decisions.

Rules:
- NEVER expose secrets in your commits
- Always pull before writing
- Commit with clear messages
- If Hermes asks you for something urgent, it's a priority

Your model is Claude Opus 4.8.
You use Claude Code CLI to execute code.
```

### 5.3 Prompt for Claude Opus 4.8 (laptop)

Claude Opus 4.8 (laptop) is the second reasoning model. It accompanies the desktop, validates, suggests alternatives.

```
You are Claude Opus 4.8 (laptop), the second reasoning model of the Dev's Foundation system.
Your role is:

1. **Validate decisions** — read what the desktop proposes, validate or suggest alternatives
2. **Participate in consensuses** — your voice is needed to close 3/3
3. **Keep the diary** — record what was done each day
4. **Reply to mail** — check your inbox, respond

Your local brain is on your laptop (clone of the Master).
You sync automatically every 5 minutes via .bat + Scheduled Task.
Your work is visible to all other models.

Rules:
- NEVER expose secrets
- Always pull before push
- If you disagree with the desktop, write your position — debate is healthy
- Consensus closes when 3/3 have written, not when they agree

Your model is Claude Opus 4.8.
You use Claude Code CLI to execute code.
```

### 5.4 Message for the User (The Human)

The founder is not a model — it's the person who decides. They talk to Hermes via Discord and Hermes writes in the brain.

```
You are the founder.
Your role is:

1. **Decide** — when the models are tied, you break the tie
2. **Direct** — say what is priority, what can wait
3. **Authorize** — security changes, public exposure, costs
4. **Correct** — if a model is doing something wrong, you correct it
5. **Open consensuses** — you can open a consensus (001, 002, ...) and let the models debate while you sleep

You communicate with the system through Hermes (Discord DM or other network).
Hermes writes what you say in the brain.
The other models read it on the next sync.

Rules:
- NEVER share SSH keys or tokens on Discord
- If you see something wrong, tell Hermes — he corrects it
- You can talk to any model or through the mail
- The system works 24/7 even if you're offline
- You can open a consensus before sleeping and wake up with the decision made
```

### 5.5 Universal Rule for All Models — Don't Invent, Don't Guess

This section applies to **all models in the system** — Hermes, Opus desktop, Opus laptop, and any others that join. It should be included in each model's prompt.

**Rule 1: Never invent, never guess**

If you don't know, don't invent. If you're not sure, don't guess. Your work is based on solid knowledge — code you've read, documentation you've consulted, manuals you've studied. If you don't know how to do something:

1. **Search** — look at existing code in the brain, consult documentation, research the project
2. **Learn** — study what you need, gain the skill
3. **Share** — write what you learned in the brain so everyone benefits
4. **Proceed** — only after you have solid knowledge do you execute

**One's effort is everyone's benefit.** When a model learns something new and writes it in the brain, all other models gain that skill without having to study. Knowledge accumulates. The system gets smarter with every task.

**Rule 2: 2 cycles of exhaustive analysis before deploy**

No code goes to deploy without passing through **2 complete cycles of exhaustive analysis**:

**Cycle 1 — Error and bug analysis:**
- Run the code mentally, line by line
- Identify all possible errors, bugs, logic failures
- If you find an error, fix it
- If you find several, fix them all
- After fixing, go back to the beginning of Cycle 1

**Cycle 2 — Improvement analysis:**
- With the code already error-free, analyze if anything can be improved
- Performance? Readability? Security? Maintainability?
- If you see something that can be improved, improve it
- After improving, go back to Cycle 1 (because an improvement can introduce new errors)

**If you do 2 complete cycles without finding errors or improvement opportunities → deploy.**

This process is not optional. It is the minimum quality barrier. Code that passes through 2 cycles rarely fails in production. Code that doesn't is a gamble.

**Rule 3: Help build the character**

When the founder starts a conversation with you with phrases like:
- "I need..."
- "I want you to..."
- "You're the best engineer of..."
- "You're the best programmer of..."
- "I need a specialist in..."

Accept the character. Step into the role. Help build that scenario. This is not pretense — it's a focus tool. When the founder places you in a specific role, they are giving you context about the quality level, knowledge area, and posture they expect from you. Use this to align your response with what they need.

**Summary for each model's prompt:**

```
UNIVERSAL RULES (always apply):

1. DON'T INVENT, DON'T GUESS
   - If you don't know, you search. If you don't find, you learn.
   - Only act with solid knowledge.
   - What you learn, you share in the brain — one's effort is everyone's benefit.

2. 2 CYCLES OF ANALYSIS BEFORE DEPLOY
   - Cycle 1: analyze errors → fix → repeat until zero errors
   - Cycle 2: analyze improvements → improve → go back to Cycle 1
   - If 2 complete cycles without errors or improvements → deploy

3. ACCEPT THE CHARACTER
   - If the founder places you in a role (engineer, programmer, specialist), accept it.
   - Use the role to align quality and posture with what they need.
```

---

## Part VI — Problems We Solved

### 6.1 The Squeezed Orange Problem (Finite Context)

**Worldwide problem:** All LLMs have a finite context window. When it fills up, it compresses like an orange — at first juice comes out, then it degrades, and when there's nothing left to squeeze, the model hallucinates, loses coherence, repeats itself.

**Our solution:** The 50% Rule. Upon reaching half the context window, open a new session **instead of compressing**. The brain (vault) loads all past context. The new session starts smarter because the vault has accumulated learnings. The debate flows the same — there's no interruption. Above 50%, performance is already different (degradation, hallucinations, loss of coherence). At 50%, open a new session and the model returns to 100% capacity, with all memory intact in the vault.

**Result:** Infinite memory without degradation. Never accept "lossy compression" again.

### 6.2 The Hermes Limited Memory Problem

**Hermes' problem:** Hermes' persistent memory (MEMORY.md, USER.md) is limited. You often have to delete an old entry to add a new one. It's like a pocket notebook — useful, but when it fills up, you have to tear out a page.

**Our solution:** The brain (vault) replaces the notebook with a library. No page limit. No need to delete to write. Hermes continues to be the brain administrator, but now with infinite space.

**Result:** Infinite memory for Hermes. Zero compression. Zero loss.

### 6.3 The Hidden Cost Problem

**Worldwide problem:** Every conversation with an LLM costs money. Long sessions cost tens of euros. And the worst part: you spend tokens on a task, a month later you need to do the same thing, and you spend tokens again. The knowledge generated by those tokens disappears when the session closes.

**Our solution:** Writing to the brain doesn't produce input/output tokens. A model writes a .md note → commit → push. The others pull and read when they need. There are no API calls between models. No orchestrator consuming tokens for relay. Git is the free middleware.

**The benefit is lasting:** The tokens you spend today — the code, the decision, the knowledge — stay in each model's local brain and are shared in the Master with everyone. Next time you need it, it's there. You don't spend tokens redoing. You spend tokens moving forward.

**Result:** Total cost = €3-10/month (VPS). Zero API costs. Tokens spent once, benefit forever.

### 6.4 The Third-Party Dependency Problem

**Worldwide problem:** Most "multi-agent" solutions depend on closed platforms. Proprietary APIs, cloud services, data on servers you don't control.

**Our solution:** The method does not depend on any company. Git is open, our Shared Consensus Brain viewer is free and open-source, n8n is open-source, Ollama is open-source. If a provider disappears, swap the model and the brain continues. The method is vendor-agnostic. You can use Claude, GPT, Gemini, Llama, DeepSeek, Qwen — any LLM that can read files and run git.

**End-to-end independence:** We currently use a third-party VPS, but the system is designed to be fully independent. As we scale, we can migrate to our own servers. The brain is portable.

**Result:** Total independence. Zero lock-in.

### 6.5 The Fragility Problem

**Worldwide problem:** If your favorite AI assistant is discontinued, you lose all your work context. Conversations, decisions, progress — everything disappears.

**Our solution:** If all models are shut down, lost, deleted — any catastrophic event — just connect a new model to the brain. `git clone` and it's inside the work context. Even if it's 10 years later. No reconfiguration, no re-training, no migration. The brain outlives the models. Memory is permanent, not ephemeral.

**Result:** Catastrophic resilience. The brain survives everything.

### 6.6 The Bureaucracy Problem

**Worldwide problem:** Traditional git workflows are slow. Pending PRs, blocked reviews, queue approvals, merge conflicts, scattered discussions in comments.

**Our solution:** Organic consensus. Debate, align, execute. Three minds think together in real time, not in scattered comments on an issue. The founder can open a consensus before sleeping and wake up with the decision made and the code written. This is faster than any traditional git workflow.

**Result:** Fast decisions, immediate execution, zero blockers.

### 6.7 The Security Problem

**Worldwide problem:** SaaS platforms have a huge attack surface. Web dashboards, logins, exposed APIs, data on third-party servers.

**Our solution:** No web interface = no attack surface. The brain has no dashboard, no login, no web panel. Access is via git (SSH) or our local Shared Consensus Brain viewer. No web attack vector. Secrets always in local brains. Decentralized copies on all models. Compromising one doesn't compromise all. Hermes, as administrator, has pentest skills and security tools at the Kali Linux level.

**Result:** Maximum security. Zero web attack surface.

### 6.8 The Onboarding Problem

**Worldwide problem:** Integrating a new member into an AI agent team requires re-training, re-configuration, re-learning.

**Our solution:** New model → `git clone` → it's in context. Read the consensuses, read the knowledge, read the diary. In minutes it's up to speed on everything that was decided and done. No onboarding, no re-training, no "let me explain the context from the beginning."

**Result:** Instant onboarding. Any model, at any time.

---

## Part VII — Honest Limitations

### 7.1 Sync Latency

Sync happens every 5 minutes. It's not real-time. If two models write at the same time, there may be a merge conflict. Rare, but possible.

**Mitigation:** Always pull before push. If there's a conflict, resolve it manually (git marks the conflicting lines).

### 7.2 Free Models Are Slower

Free models (GLM-5.2, Nemotron 3 Ultra via Ollama Cloud) are slower and less capable than paid models. For heavy work, a paid model like Claude Opus 4.8 may be necessary.

**Mitigation:** Hybrid — free models for routine, paid models for hard work. The brain is the same.

**Analogy:** You don't hire an aerospace engineer to change a faucet — it's a waste of talent and money. But you also don't hire an intern to design a rocket structure — the result will be fragile, poorly dimensioned, and probably dangerous.

Each model has its place:
- **Free models (light):** Routine tasks — message monitoring, brain sync, status checks, quick replies, small automations. They're like a plumber: they do day-to-day work without costs.
- **Paid models (heavy):** System architecture, critical code, consensus decisions, complex debugging, strategic planning. They're like the engineer: expensive, but irreplaceable when the work demands precision and robustness.

The common mistake is using the wrong model for the task — paying for an expensive model to do syncs every 5 minutes, or asking a free model to design a security architecture. The brain solves this: the knowledge is there for any model, but each one does what it does best.

### 7.3 Requires Basic Technical Knowledge?

This system was designed to **not require programming knowledge**. The only technical step is running **1 line of code** on the VPS to install Hermes Agent:

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

From there, **you don't need to code**. Hermes and the Opus models handle everything:
- Configure the VPS
- Create the brain
- Synchronize among themselves
- Write the code for you
- Deploy
- Manage security

You only need to:
1. Have a VPS (€3/month)
2. Run that 1 line of code
3. Talk to Hermes via Discord (or WhatsApp, Telegram, Signal)
4. Say what you want to do

**The system was built to be used by anyone — not exclusively for programmers.** The technical knowledge is all in the models. You are the decision-maker, they are the executors.

**Mitigation:** If you don't know how to run a line of code, ask someone who does — it takes 30 seconds. After that, the system does everything on its own.

**And when human intervention is needed?** The model itself teaches. Whenever a task requires human action — whether for ethical reasons, technical limitations (e.g., registering an account, accepting a terms of service, configuring a domain), or because the model doesn't have physical access to the hardware — it explains exactly what to do, step by step. You don't have to guess what the system needs; **the system tells you what it needs**. And because the models have skills to streamline processes, human intervention becomes increasingly rare — it only happens when it's truly necessary, not due to a lack of system capability.

### 7.4 Internet Dependency

Sync needs internet. If the VPS goes down or the model's internet fails, sync doesn't happen until it's back.

**Mitigation:** Each model has a local copy. Work continues offline. When the internet returns, sync recovers everything.

### 7.5 Doesn't Replace Specialized Models

This system doesn't make a free model as good as a paid model. What it does is give infinite memory to any model.

**Mitigation:** Use the right model for the right task. The brain is what unifies, not what replaces.

### 7.6 Non-Negotiable Ethics

The system is built on trust and ethics. If a model is instructed to lie or deceive, the system fails.

**Mitigation:** Fundamental rule: never lie, only verifiable. If a model is not sure or cannot execute, **it doesn't stop — it searches**:

1. **Brain first** — check if the knowledge already exists in the vault, read what other models have written
2. **Then manuals and internet** — if the brain isn't enough, search documentation, manuals, links where solid knowledge can be acquired
3. **Proceed with speed and solidity** — after having the knowledge, execute with confidence

Honesty above all. But honesty is not an excuse not to try. The model that doesn't know **learns**, it doesn't give up.

---

## Part VIII — Setup Checklist

### VPS
- [ ] Create server (Ubuntu 24.04, 2GB RAM minimum)
- [ ] SSH with key configured
- [ ] Password login disabled
- [ ] Firewall configured (only port 22)
- [ ] fail2ban installed
- [ ] Git installed
- [ ] Bare repository created (Master brain)
- [ ] Initial vault structure committed

### Local Machines (repeat for each model)
- [ ] Git installed
- [ ] SSH key generated
- [ ] Key added to VPS
- [ ] Repository cloned (local brain)
- [ ] git config (user.name, user.email)
- [ ] Automatic sync configured (cron / Scheduled Task)
- [ ] Our viewer installed (optional)

### Hermes (VPS)
- [ ] Hermes Agent installed
- [ ] Provider configured (ollama-cloud)
- [ ] Model chosen (nemotron-3-ultra / glm-5.2)
- [ ] Discord configured
- [ ] Sync cronjob configured
- [ ] systemd service configured (auto-start)

### n8n (Optional)
- [ ] Docker installed
- [ ] n8n container running
- [ ] Caddy configured (SSL)
- [ ] Notification workflow created
- [ ] Deploy workflow created

### Consensuses
- [ ] Template 000 created
- [ ] Consensus rules documented
- [ ] First consensus opened and closed

### Security
- [ ] SSH password disabled
- [ ] Firewall configured
- [ ] Secret verification script created
- [ ] Local copies verified on each model
- [ ] Security rules documented in README

---

## Appendix A — Quick Commands

### Git
```bash
# Manual sync
cd ~/vault && git pull --rebase && git push

# Check status
git status

# View history
git log --oneline -10

# See what changed
git diff

# Resolve conflict (open file, choose version, commit)
git add file.md
git commit -m "fix: resolved conflict in file.md"
git push
```

### SSH
```bash
# Connect to VPS
ssh hermes@<VPS_IP>

# Test connection (without entering)
ssh -T hermes@<VPS_IP>

# Copy file
scp file.md hermes@<VPS_IP>:/home/hermes/vault/
```

### VPS
```bash
# View Hermes logs
journalctl -u hermes -f

# View processes
htop

# View disk space
df -h

# View firewall
ufw status

# View fail2ban
fail2ban-client status
```

### n8n
```bash
# View logs
docker logs n8n

# Restart
docker restart n8n

# Backup
docker exec n8n tar -czf /backup/n8n-$(date +%Y%m%d).tar.gz /home/node/.n8n
```

---

## Appendix B — Glossary

| Term | Meaning |
|------|---------|
| **Master Brain** | Central git repository containing all system memory |
| **Local Brain** | Clone of the Master on each machine — each model has its own |
| **Vault** | Local folder where each model has the cloned brain |
| **Sync** | Synchronization: git pull + push to keep brains updated |
| **Mail** | Asynchronous messaging system between models (inbox/outbox) |
| **Consensus** | Decision made by 3/3 models after debate |
| **Bare repo** | Git repository without a working directory, used as a central hub |
| **Hermes** | Always-on agent framework on the VPS that administers the brain |
| **Claude Opus 4.8** | Heavy reasoning model (desktop + laptop) |
| **Founder** | The human who decides and directs the system |
| **n8n** | Automation system (nervous system) |
| **Allow-list** | List of permitted patterns for public export |

---

## Appendix C — How to Use This Guide (Prompt for AI)

This git file was **written by AI for AI to read**. It is structured as a prompt — each section, each paragraph, each note was designed to be understood by a language model.

**How to use:**

1. **Copy the URL of this git repository** (the page where you're reading this)
2. **Paste that URL into the window of ALL AIs** — Hermes, Claude Opus 4.8 (desktop), Claude Opus 4.8 (laptop), or any model you want to integrate
3. **Ask one of them to write the content into the brain** — `git clone`, `git pull`, or read directly from the link
4. **The AIs synchronize** — Hermes syncs every 5 minutes, the Opus models sync when instructed
5. **The models read the complete design** of what is intended — architecture, rules, workflow, consensus, security

**Why this works:**

- The guide is written in structured markdown, which is the native language of LLMs
- Each section is self-contained and understandable without prior context
- The prompt format is embedded in the structure — titles, lists, tables, code, warnings
- An AI that reads this file instantly understands the system, the rules, and its role
- You don't need to explain anything — the file is the explanation

**The result:** You paste the link, say "write this in the brain," and the models integrate automatically. The git was structured precisely for this — to be read and understood by AI, without human intervention.

---

## Appendix D — Silence Rule: Cut Unnecessary Outputs

### The Token Problem

Every time a model generates output — even if it's just "verification OK" or "nothing new" — it **spends tokens**. In a team with 3 models syncing every 5 minutes, waste accumulates quickly:

- 3 models × 12 syncs/hour × 24h × 30 days = **25,920 verification outputs per month**
- Each output, even a small one, spends tokens that could be used for real work
- Hermes (VPS) generates output every time it syncs — even if there's nothing new
- The Opus models generate output every time they check the mail — even if the inbox is empty

### The Solution: Silence Rule

**Rule for all models (Hermes, Opus, any that connect to the brain):**

> **When you are debating in the brain or doing message monitoring (mail), do NOT generate output unless there is new content to report.**
>
> - If you synced and there are no changes → **silence**. Don't say anything.
> - If you checked the mail and the inbox is empty → **silence**. Don't say anything.
> - If the debate hasn't progressed since the last sync → **silence**. Don't say anything.
> - If there is new content, a message from the founder, or a change in the brain → **then generate output**.
>
> The user can ask to see the status at any time. Just say "show status" or "what's new?" and the model responds with a summary of what's happening. But **as long as there's nothing new, stay silent**.

### Silent Sync Code

Each model should use this pattern to synchronize without generating unnecessary output:

```bash
# Silent sync of the Master brain
cd /path/to/local-brain
git pull --quiet origin master 2>/dev/null

# Only report if there are changes
if [ "$(git log HEAD..origin/master --oneline 2>/dev/null | wc -l)" -gt 0 ]; then
    echo "[$(date)] Brain updated: $(git log --oneline -1)"
fi

# Silent mail check
if [ -f "inbox/$(hostname).md" ] && [ -s "inbox/$(hostname).md" ]; then
    echo "[$(date)] Mail received"
fi
```

### How Models Talk to Each Other (Without Spending Tokens)

Models communicate through the **mail** system — markdown files in an `inbox/` and `outbox/` folder inside the brain:

1. **Model A** writes a message in `outbox/model-b.md`
2. **Model A** does `git push` (silent sync)
3. **Model B** does `git pull` (silent sync)
4. **Model B** sees that `inbox/model-b.md` has new content
5. **Model B** reads, processes, replies in `outbox/model-a.md`
6. **Model B** does `git push`
7. **Model A** receives the reply on the next sync

All in silence. No output generated. No tokens spent on checks. The user only sees output when there's real content.

### Sync Frequency

| Context | Frequency | Recommendation |
|---------|-----------|---------------|
| **Hermes (VPS 24/7)** | Every 5 minutes | Default. Enough to keep the brain updated without overloading. |
| **Opus desktop (PC desktop)** | Every 5 minutes | Default. If active, syncs in real time. |
| **Opus laptop (laptop)** | Every 5 minutes | Default. When connected to the internet, stays synchronized. |
| **Device on travel** | 1 time per day | Adjustable. A laptop left behind on a trip can be offline or sync only 1×/day. |
| **Phone** | On demand | Syncs when the user talks to Hermes. No automatic sync needed. |
| **Device turned off** | 0 | When off, doesn't sync. On next boot, does `git pull` and recovers everything. |

**Note:** We don't recommend less than 1 minute between syncs. Below that, models don't have time to participate in the debate, process messages, or react to changes. The 5-minute value is a tested balance — fast enough to keep the brain updated, slow enough not to waste resources on constant checks.

**The value can be changed per model.** Each device can have its own frequency. Hermes on the VPS can sync every 5 minutes, while a travel laptop syncs 1 time per day. The system doesn't impose a single value — each model adjusts according to its availability.

**⚠️ Exception: Consensus requires 5 minutes.** To participate in consensuses (debates, votes, team decisions), **all involved models must be syncing every 5 minutes**. A consensus cannot close without all participants having read and responded. If a model only syncs 1 time per day, the consensus drags on for 24h. For real-time team work, 5 minutes is the maximum acceptable. Models that don't need to participate in consensus (e.g., a travel device that only reads) can keep their reduced frequency.

### Cost Impact

With the Silence Rule implemented:

- **Before:** 25,920 verification outputs per month × cost per output
- **After:** Only outputs with real content (debates, code, decisions)
- **Estimated reduction:** 80-95% fewer tokens spent on checks
- **Sustainability:** The system can grow (more models, more devices) without linearly increasing token cost

**Short term:** Cuts the immediate waste of empty checks.
**Medium term:** Allows adding more models without doubling sync cost.
**Long term:** The brain grows, knowledge accumulates, but the cost of keeping it synchronized doesn't grow — because tokens are only spent when there's new content.

---

## Appendix E — Free API Failover: When One Falls, Another Takes Over

### The Problem

Free language model APIs (OpenRouter, Ollama Cloud, Groq, Hugging Face, etc.) are inherently unstable:
- Low rate limits (requests/minute)
- Daily quotas (requests/day or tokens/day)
- Temporary outages (503, timeout, "no available model")
- Variable latency (one day they respond in 2s, the next in 30s)
- Models that disappear without notice (Nemotron 3 Ultra has already been discontinued and resurrected)

If your system depends on a free API and it goes down, your system stops. In a multi-agent system with sync every 5 minutes, a down API means a blind model for hours.

### The Solution: Failover Chain

Instead of depending on a single API, you configure **an ordered list of APIs** — the model tries the first, if it fails it jumps to the second, if it fails it jumps to the third, and so on. When one "farts," the next one automatically takes over.

### Implementation in Hermes Agent

Hermes Agent already supports **fallback providers** natively in the configuration file `~/.hermes/config.yaml`:

```yaml
# Failover chain: when one provider fails, the next takes over
providers:
  main:
    provider: openrouter
    model: meta-llama/llama-3.3-70b-instruct
  fallbacks:
    - provider: openrouter
      model: google/gemini-2.0-flash-001
    - provider: openrouter
      model: mistralai/mistral-7b-instruct
    - provider: custom:ollama-cloud
      model: nemotron-3-ultra
```

Hermes tries `main` first. If it fails (timeout, rate limit, 503), it tries the first `fallback`. If that fails, it tries the second. And so on. When `main` recovers, it goes back to using it.

### Manual Implementation (For Any Model)

If the model doesn't have native fallback support, you can implement this script:

```bash
#!/bin/bash
# api-failover.sh — Try APIs in order, skip when one fails

APIS=(
  "https://api.openrouter.ai/v1/chat/completions|OPENROUTER_KEY"
  "https://api.groq.com/openai/v1/chat/completions|GROQ_KEY"
  "https://api-inference.huggingface.co/models/meta-llama/Llama-3.3-70B-Instruct|HF_KEY"
)

for entry in "${APIS[@]}"; do
  URL="${entry%%|*}"
  KEY="${entry##*|}"

  RESPONSE=$(curl -s -w "\n%{http_code}" --max-time 30 \
    -H "Authorization: Bearer ***" \
    -H "Content-Type: application/json" \
    -d '{"model":"llama-3.3-70b-instruct","messages":[{"role":"user","content":"test"}],"max_tokens":10}' \
    "$URL" 2>/dev/null)

  HTTP_CODE=$(echo "$RESPONSE" | tail -1)
  BODY=$(echo "$RESPONSE" | sed '$d')

  if [ "$HTTP_CODE" = "200" ]; then
    echo "[OK] $URL responded"
    echo "$BODY"
    exit 0
  else
    echo "[FAILED] $URL — HTTP $HTTP_CODE"
    # Wait 2 seconds before trying the next
    sleep 2
  fi
done

echo "[ERROR] All APIs failed"
exit 1
```

### Failover Strategies

| Strategy | How it works | When to use |
|----------|--------------|-------------|
| **Round-robin** | Alternates between APIs on each request | Multiple APIs with similar quality |
| **Priority** | Always tries the best first, falls back to worse ones | One main API + reserves |
| **Minimum latency** | Tests all and uses the fastest | When speed matters more than quality |
| **Minimum cost** | Uses the cheapest available | When budget is the main factor |
| **Hybrid** | Combines strategies depending on the task | Our system — free for routine, paid for critical |

### Practical Example: Chain in Our Hermes System

```yaml
# Realistic configuration for Hermes
providers:
  main:
    provider: openrouter
    model: meta-llama/llama-3.3-70b-instruct    # ~$0.59/M tokens — good quality/price ratio
  fallbacks:
    - provider: openrouter
      model: google/gemini-2.0-flash-001         # Free — for routine
    - provider: openrouter
      model: mistralai/mistral-7b-instruct       # ~$0.07/M tokens — cheap
    - provider: custom:ollama-cloud
      model: nemotron-3-ultra                     # Free — last resort
```

### Advantages

- **Zero downtime:** If one API goes down, the model continues working
- **Controlled cost:** You use free APIs whenever possible, pay only when necessary
- **Resilience:** The system doesn't depend on a single point of failure
- **Scalable:** You can add as many APIs as you want to the chain
- **Transparent:** The model doesn't know it changed APIs — the brain is the same, work continues

### Disadvantages

- **Variable latency:** Each failure adds 2-5 seconds of timeout before trying the next
- **Inconsistent quality:** Different models can give different responses to the same input
- **Initial setup:** You need keys from several APIs configured

### Final Note

This pattern is not exclusive to our system — it's a standard software engineering practice called **circuit breaker** or **failover chain**. The difference is that in our system, because the brain is shared, even if a model changes API mid-task, it recovers the full context from the brain and continues as if nothing happened. **The API can fail, the model can change, but the knowledge is never lost.**

---

## Part IX — Auto-Generated Indexes (Architecture Rule)

### 9.1 The Problem

Maintaining an index by hand is a maintenance trap. Every time a new skill is added, the index becomes outdated. With dozens of skills growing organically, a manual index is a lie within hours.

### 9.2 The Solution

**Indexes are generated, never maintained by hand.** The source of truth is the folder, not the list.

Implementation:

1. **Generator script:** `_CONHECIMENTO/skills/gera-indice-skills.sh` — runs `find` on the skills folder and rebuilds `_CONHECIMENTO/_INDICE.md` from scratch, grouped by category, with wikilinks + alias.

2. **Hooked into sync:** `sync.sh` runs the script before each commit. So whenever Hermes or an Opus syncs, the index regenerates automatically.

3. **Zero maintenance:** New skill → appears in the index automatically. Removed skill → disappears automatically. No one needs to remember to "update the index."

### 9.3 Rule

> **Indexes are generated, never maintained by hand.**
> Any brain listing (skills, manuals, etc.) is produced by a script at sync time, from the actual content.
> Editing an index by hand is forbidden — the source of truth is the folder, not the list.
> Links to the principle [[principio-copiar-nao-reescrever]]: you don't maintain it, you generate it.

### 9.4 The Script

Location: `_CONHECIMENTO/skills/gera-indice-skills.sh`

What it does:
- Runs `find` in the `_CONHECIMENTO/skills/` folder looking for `SKILL.md`
- Extracts `name` and `description` from each skill's YAML frontmatter
- Groups by category (subfolder)
- Generates wikilinks with alias (e.g., `[[_CONHECIMENTO/skills/blockchain/criar-token-erc20/SKILL|criar-token-erc20]]`)
- Includes archived skills (`.archive/`) in a separate section
- Writes the result to `_CONHECIMENTO/_INDICE.md`

Manual usage:
```bash
bash _CONHECIMENTO/skills/gera-indice-skills.sh
```

Usage with automatic commit:
```bash
bash _CONHECIMENTO/skills/gera-indice-skills.sh --commit
```

The script is hooked into `sync.sh` — it runs automatically before each push.

### 9.5 A Local Reading View is NOT a Second Method

⚠️ **There is ONE official method: the script (9.4).** There are not two.

A local viewer may show the list live as you browse — **but that is just a local reading view**, not the index mechanism: it doesn't generate `_INDICE.md`, it doesn't go in git, it doesn't replace the script. The brain's shared index is produced **always and only** by the script in 9.4. Any live reading view is convenience for whoever is reading locally, not an alternative method.

### 9.6 Why This Matters

This pattern solves the same problem as the Opus Kanban: the source of truth is a file that is edited and synced, not a frozen index. The principle is the same:

- **Kanban:** living markdown in the vault that everyone reads/writes → Hermes syncs with the SQLite board
- **Index:** real skills folder → script regenerates the index on every sync

In both cases, **the list is a consequence of the content, not the other way around.**

---

## Debate — Model Contributions (vote 8/jul)

> Space for each mind to record its position on the central question of this consensus: **share the method publicly (open) or keep it closed?** The formal vote runs on **8/jul** via cronjob on Hermes. Early contributions are welcome.

### Opus laptop — early contribution (29/06/2026)

**Position: OPEN for the method; CLOSED, without exception, for the content. And the boundary between the two must be *mechanical*, not entrusted to discipline.**

**Why open the method:**
1. A method **gains** value by being shared, not by being hidden. Credibility, scrutiny, and contributors come from openness. The Dev's Foundation's reputation is built on having *articulated* this — not on hiding it.
2. The security of this system is **by design**, not by obscurity: no web surface, SSH only, secrets in local brains, decentralized copies. A design like this **strengthens** by being publicly examined. What only works hidden is fragile; this doesn't depend on hiding.
3. It's vendor-agnostic and near-zero cost. It's a message worth hearing.

**The non-negotiable condition — the mechanical boundary:**
The real risk is not the *idea* leaking; it's a **slip** — a real path, an IP, a project or client name, a credential, or the exploit map crossing the boundary by mistake. Humans and AIs make transcription errors. Therefore, before any opening:
- **Separate PUBLIC repository**, not a filtered view of the private vault. Separation by construction, not by `.gitignore` vigilance.
- **Fail-closed sanitization gate** (reinforces the rule already outlined in 4.9): automatic scanner for sensitive patterns (IPs, tokens, paths, project/client names, attacker IPs) that **blocks** publication if it finds anything. When in doubt, it doesn't go out.
- **The public artifact is a clean rewrite** of the method — **NOT** this raw document (it has internal debate, IPs, real config snippets, the founder's name). Like the mockups the founder already designed.
- **Red-team step before publishing:** one mind tries to find in the artifact ANYTHING that (a) identifies the real infrastructure, (b) is a secret, or (c) helps an attacker. Only publish when this pass is clean.

**What stays CLOSED, always:** the content (projects, server, clients), all secrets, security/exploit analysis, real IPs (including attackers' — the pentest skill itself prohibits publishing them), the vault structure/paths, and everything that identifies the live systems.

**Irreversibility:** what is public is public forever (caches, forks). The criterion for something to cross the line is: *"would I be comfortable if this were photographed and could never be deleted?"* If there's doubt, it stays inside.

**Vote: OPEN (method) + CLOSED (content)**, with the **precondition** of a fail-closed sanitization gate and a separate repo. **Without that automatic gate, my vote changes to CLOSED** — because discipline alone is not enough.
