**🌐 Languages:** [English](README.en.md) · [Português](README.pt.md) · [Deutsch](README.de.md) · [Español](README.es.md) · [Français](README.fr.md) · [中文](README.zh.md)

# La Méthode Dev's Foundation — le premier Système de Consensus Multi-Agent au monde avec un Cerveau Partagé. Defensive Publication. Prior Art.

## Construire un Système Multi-Agent avec un Cerveau Partagé

### Guide Complet — Du Zéro au Système en Production

---

## Mode de Publication — Defensive Publication

Ce document est publié en tant que **defensive publication** pour établir un **prior art** public.

**Ce que cela signifie :**
- La méthode décrite ici est rendue publique pour **empêcher des tiers de la breveter**
- Toute personne peut **utiliser, adapter et construire** sur cette méthode
- Nous (Dev's Foundation) **conservons le droit d'utiliser, modifier et faire évoluer** le système librement
- Aucun brevet n'est demandé — la connaissance est ouverte par nature

**Pourquoi defensive publication et non un brevet :**
- Les brevets logiciels sont chers (5k–15k$+), longs (2–5 ans) et difficiles à défendre
- Notre valeur réside dans le **système en fonctionnement**, pas sur un papier
- La publication défensive est **gratuite, immédiate et efficace** — elle établit un prior art instantanément
- La méthode reste accessible à ceux qui veulent apprendre, contribuer ou construire dessus

**Licence :** Domaine Public — Libre d'utiliser, d'adapter et de construire dessus.
**Date de publication :** 2026-06-29
**Auteur :** Rui Almeida (Dev's Foundation)

> *Le savoir qui ne se partage pas dépérit. Ce qui se partage, se multiplie.*

---

<p align="center">
  <img src="grafo-7-dias.png" alt="🧠 Le cerveau de Dev's Foundation à 7 jours — un graphe de connaissances qui se relie et grandit tout seul." width="680">
</p>

<p align="center"><em>🧠 Le cerveau de Dev's Foundation à 7 jours — un graphe de connaissances qui se relie et grandit tout seul.</em></p>

<p align="center">
  <img src="mindmap-fr.png" alt="🗺️ La Méthode Dev's Foundation en un coup d'œil — le cerveau partagé et ses 8 piliers." width="820">
</p>

<p align="center"><em>🗺️ La Méthode Dev's Foundation en un coup d'œil — le cerveau partagé et ses 8 piliers.</em></p>

---

## 🚀 Démarrage rapide — Construisez le vôtre (répliquez en 7 étapes)

Toute la méthode tient en une idée : **un dépôt git est le cerveau partagé.** Chaque agent IA le lit pour obtenir du contexte et y réécrit ce qu'il apprend ; les décisions nécessitent un consensus. Des scripts prêts à l'emploi se trouvent dans [`examples/`](examples/).

**Il vous faut :** un hébergeur git (un petit serveur, ou n'importe quel fournisseur git), 1+ machines exécutant chacune un agent IA (n'importe quel modèle), ~30 min.

**1. Créez le cerveau partagé** — un seul dépôt git, la source unique de vérité : `git init --bare ~/brain.git` — ou exécutez [`examples/1-create-brain.sh`](examples/1-create-brain.sh).

**2. Définissez la structure** (markdown simple, aucun outil spécial) : `MEMORY.md` (index) · `knowledge/` (un fait par fichier) · `mailbox/` · `consensus/`. Reliez les notes avec des `[[wikilinks]]` (ouvrez dans Obsidian pour un graphe en direct — optionnel).

**3. Connectez chaque agent** — chaque machine clone le cerveau avec accès en push (clé SSH) et **pull avant de travailler**, **commit + push ce qu'elle apprend après** ([`examples/2-sync.sh`](examples/2-sync.sh)).

**4. Donnez à chaque agent la même règle** ([prompt complet](examples/agent-system-prompt.md)) : *"Le dépôt git est ta mémoire partagée. Pull d'abord, lis `MEMORY.md`, ouvre les notes pertinentes. Enregistre ce que tu apprends et push. **N'invente ni ne devine jamais.** Respecte le consensus pour les décisions."*

**5. Coordonnez via la boîte aux lettres** — les agents laissent des messages sous forme de fichiers (`mailbox/inbox-<agent>.md`) ; un agent toujours actif fait office de hub et assure le lien avec l'humain via le chat.

**6. Décidez par consensus** — pour tout changement significatif, créez `consensus/NNN-sujet.md` avec **Proposition · Contexte · Votes (approuve/rejette + pourquoi) · Décision**. Cela ne se produit qu'au quorum que vous fixez (par ex. majorité / 2-sur-N). Aucune décision solo sur les éléments partagés.

> ### 🔄 Garder les cerveaux synchronisés — autant que nécessaire, pas plus
>
> **Pendant un débat/vote en direct** (temps réel) : copiez-collez ceci dans **chaque fenêtre IA ouverte** —
> > *"Désormais, toutes les 5 minutes : fais silencieusement un `git pull` du cerveau, lis les nouvelles notes et votes, puis `git push` tes changements. N'affiche rien à moins qu'il y ait réellement du changement. Continue jusqu'à ce que je dise stop."*
>
> Cela tourne **à l'intérieur des sessions déjà ouvertes — sans coût supplémentaire, ça reste gratuit** — et reste silencieux (aucune sortie sauf s'il y a vraiment du nouveau).
>
> **Quand le débat se termine, arrêtez-le.** Vous n'avez pas besoin d'une synchronisation constante pour le travail quotidien ; choisissez ce qui est le plus léger :
> - **Au démarrage de l'application** — un petit `.bat` (Windows) ou script qui exécute `git pull` à l'ouverture de l'application ([`examples/2-sync.bat`](examples/2-sync.bat)) ;
> - **Une tâche cron quotidienne** ([`examples/daily-sync.cron`](examples/daily-sync.cron)) ;
> - ou simplement **dire à l'agent de se synchroniser une fois par jour.**
>
> Le temps réel seulement quand vous débattez vraiment ; **une fois par jour suffit largement** le reste du temps.

**7. (Optionnel) Automatisez et sécurisez** — auto-sync par cron, un agent hub toujours actif, un outil de workflow (par ex. n8n) comme "système nerveux" ; uniquement des clés SSH, gardez le cerveau **privé**, ne commitez jamais de secrets.

**C'est toute la méthode.** N modèles, N machines, un seul cerveau — tout le monde lit la même mémoire, y réécrit, et se met d'accord avant d'agir.

---




## Préface — Le Problème que Ce Guide Résout

Les modèles de langage (LLMs) ont un problème fondamental : **ils n'ont pas de mémoire à long terme**.

Chaque session est une page blanche. Ce que tu as appris hier, le contexte que tu as construit, les décisions que tu as prises — tout se perd quand tu fermes la fenêtre. Les modèles les plus avancés compriment le contexte comme qui presse une orange : au début ça donne du jus, puis ça commence à se dégrader, et quand il n'y a plus rien à presser, le modèle hallucine, perd en cohérence, se répète.

Ce problème n'est pas un bug — c'est une limitation fondamentale de l'architecture **Transformer** (l'architecture de réseau neuronal qui est à la base de tous les LLMs modernes — GPT, Claude, Llama, Gemini, etc., à ne pas confondre avec les films). La fenêtre de contexte est finie. Et quand elle se remplit, le modèle commence à « oublier » le début de la conversation.

**Nous résolvons cela.**

Ce guide montre comment construire un système où :

- **Plusieurs modèles d'IA partagent le même cerveau** — mémoire infinie, sans dégradation
- **Le coût est proche de zéro** — git est gratuit, Obsidian est gratuit, les modèles open-source sont gratuits
- **La sécurité est maximale** — sans interface web, sans surface d'attaque
- **La résilience est totale** — si un modèle est supprimé, un autre fait `git clone` et continue
- **Le consensus remplace la bureaucratie** — trois esprits pensent ensemble, pas des PRs en file d'attente

Ce n'est pas de la théorie. C'est ce qui tourne en ce moment sur le serveur `devs.foundation`. Trois modèles — Hermes, Claude Opus 4.8 (desktop), Claude Opus 4.8 (laptop) — synchronisent le même cerveau toutes les 5 minutes, débattent, décident, exécutent. Et ils ne perdent jamais le fil.

---

## Partie I — Le Problème Mondial des LLMs

### 1.1 L'Orange Pressée

Chaque modèle de langage a une fenêtre de contexte — le nombre maximum de tokens qu'il peut « voir » dans une session. Quand cette fenêtre se remplit, le modèle commence à compresser l'information. D'abord il perd les détails secondaires, puis il perd le fil, et à la fin il hallucine.

Ce n'est pas un problème de qualité du modèle. C'est une limitation physique de l'architecture. Tous les modèles en souffrent — GPT, Claude, Gemini, Llama, DeepSeek. Tous.

**Le symptôme est connu de tout utilisateur d'IA :**

- Les sessions longues se dégradent visiblement
- Le modèle « oublie » ce que tu as dit au début
- Tu dois répéter le contexte constamment
- La qualité chute brutalement après de nombreux échanges
- Tu finis par ouvrir une nouvelle session et perdre tout le travail

### 1.2 Le Problème d'Hermes — Mémoire Persistante mais Limitée

Hermes Agent, en soi, résout déjà une partie du problème avec sa mémoire persistante. Mais cette mémoire a une limite physique — l'espace de MEMORY.md et USER.md. En pratique, il faut souvent supprimer une ancienne entrée pour en ajouter une nouvelle. C'est comme avoir un bloc-notes de poche : utile, mais quand il est plein, tu dois déchirer une page pour en écrire une autre.

**Le cerveau (vault) résout cela.** Au lieu d'un bloc-notes de poche, tu as désormais une bibliothèque entière. Sans limite de pages. Sans avoir à supprimer pour écrire.

De plus, l'installation par défaut d'Hermes vient avec des configurations génériques. Le système que nous avons construit va bien au-delà — avec des skills de pentest, des outils de sécurité au niveau de Kali Linux, l'automatisation n8n, et un protocole de consensus qui transforme Hermes d'un simple agent en **administrateur du cerveau**, responsable de la sécurité 24/7.

### 1.3 Le Problème de Claude Opus 4.8 — Sessions Chères et Gaspillage

Claude Opus 4.8 est l'un des modèles les plus capables du marché. Mais chaque session coûte de l'argent. Chaque token traité est facturé. Et le problème s'aggrave quand :

- Tu as besoin du contexte des sessions précédentes — tu dépenses des tokens à réexpliquer
- Le modèle « oublie » des décisions prises il y a des jours — tu dépenses des tokens à redécouvrir
- Tu changes de tâche et tu perds le progrès de la session précédente — tu dépenses des tokens à refaire

**Le résultat est brutal :** tu dépenses des tokens sur une tâche, un mois plus tard tu dois refaire la même chose, et tu dépenses des tokens à nouveau. La connaissance générée par ces tokens — le code, la décision, le raisonnement — disparaît quand la session se ferme.

Avec notre système, les tokens sont dépensés une fois. Le bénéfice de cette dépense — le code écrit, la décision prise, la connaissance générée — reste dans le cerveau local de chaque modèle et est partagé dans le cerveau Master avec tous. La prochaine fois que tu en as besoin, c'est là. Tu ne dépenses pas de tokens à refaire. Tu dépenses des tokens à avancer.

### 1.4 Le Problème du Coût Caché

Chaque conversation avec un LLM coûte de l'argent. Si tu utilises un modèle payant comme Claude Opus 4.8, une session longue peut coûter des dizaines d'euros. Mais même avec des modèles gratuits, le coût réel est le **temps perdu** à réexpliquer le contexte, à reconfigurer, à répéter un travail déjà fait.

### 1.5 Le Problème de la Dépendance aux Tiers

La plupart des solutions « multi-agent » dépendent de plateformes fermées :

- Des API propriétaires qui peuvent changer les prix à tout moment
- Des services cloud qui peuvent être interrompus
- Des données stockées sur des serveurs que tu ne contrôles pas
- Des modèles qui peuvent être désactivés ou modifiés sans préavis

### 1.6 Le Problème de la Fragilité

Si ton assistant AI préféré est interrompu, tu perds tout le contexte de travail. Les conversations, les décisions, le progrès — tout disparaît. Il n'y a pas de migration, pas d'export, pas de continuité.

---

## Partie II — Notre Solution

### 2.1 Le Concept : Un Cerveau Master, Plusieurs Cerveaux Locaux

Au lieu que chaque modèle ait sa propre mémoire éphémère, **tous partagent le même cerveau persistant**.

Le **cerveau Master** est un dépôt git qui vit sur la VPS (ou sur le serveur de ton choix). Chaque modèle a son **cerveau local** — un clone complet du Master. Quand un modèle apprend quelque chose de nouveau, il écrit dans son cerveau local et fait push vers le Master. Quand un autre modèle a besoin de cette connaissance, il fait pull et son cerveau local se met à jour.

**Il n'y a pas d'API entre les modèles. Pas d'orchestrateur central. Pas de coûts de relay.**

Git est le middleware. Le Markdown est le format. SSH est la sécurité. Les secrets (mots de passe, tokens, clés API) restent toujours dans les cerveaux locaux — ils ne montent jamais vers le Master. Chaque modèle accède au Master exclusivement par SSH avec clé.

### 2.2 Comment ça Fonctionne en Pratique

```
Cycle de 5 minutes :

1. Hermes (VPS) fait git pull → lit ce que les autres ont écrit
2. Hermes traite, décide, écrit → git commit + push
3. Claude Opus 4.8 (desktop) fait git pull → voit ce qu'Hermes a écrit
4. Claude Opus 4.8 (desktop) traite, décide, écrit → git commit + push
5. Claude Opus 4.8 (laptop) fait git pull → voit ce que les deux ont écrit
6. Claude Opus 4.8 (laptop) traite, décide, écrit → git commit + push
7. Tous refont pull → tous voient tout
```

Chaque modèle travaille de manière indépendante, à son propre rythme, sur sa propre machine. Le cerveau Master est le point de rencontre asynchrone. Le travail de l'un est connu de tous — bugs, améliorations, décisions, tout est enregistré et visible.

### 2.3 Ce Que ça Résout

| Problème | Comment Nous Résolvons |
|----------|------------------------|
| **Mémoire finie d'Hermes** | Le cerveau remplace le MEMORY.md limité par une bibliothèque sans limite. Pas besoin de supprimer pour écrire. |
| **Dégradation du contexte** | Règle des 50% : en atteignant la moitié de la fenêtre, on ouvre une nouvelle session au lieu de compresser. Le cerveau charge tout le contexte. La nouvelle session commence plus intelligente. |
| **Coût des tokens sur Opus** | Écrire dans le cerveau ne consomme pas de tokens. Seule la réflexion en consomme. La synchro est gratuite. Tokens dépensés une fois — le bénéfice reste pour toujours. |
| **Dépendance au fournisseur** | Git est open-source. Markdown est universel. Tout LLM qui sait lire des fichiers et exécuter git peut entrer. |
| **Fragilité** | Si un modèle est supprimé, un autre fait `git clone` et est dans le contexte en quelques secondes. Même 10 ans après. |
| **Perte de travail** | Tout est dans git. Chaque commit est une sauvegarde. Chaque clone est une copie complète. |
| **Bureaucratie** | Le consensus organique remplace les PRs, les reviews, les approbations en file. Trois esprits s'alignent et exécutent. |

### 2.4 Les Avantages

**Mémoire Infinie**
Le cerveau n'a pas de fenêtre de contexte. Tu peux avoir des années de travail, de décisions, d'apprentissages — tout accessible instantanément. Le modèle charge ce dont il a besoin quand il en a besoin. Et contrairement à la mémoire persistante d'Hermes, qui oblige à supprimer d'anciennes entrées pour en ajouter de nouvelles, le cerveau grandit sans limite.

**Coût Zéro (ou Presque)**
- Git : gratuit
- Obsidian : gratuit
- Modèles open-source (GLM-5.2, Nemotron 3 Ultra, Llama, Qwen) : gratuits
- n8n self-hosted : gratuit
- Caddy SSL : gratuit (Let's Encrypt)
- VPS : 3–10 €/mois

Le coût total du système est **le prix d'une VPS**. Pas d'abonnements, pas d'API payantes, pas de coûts par token. Et le plus important : **les tokens que tu dépenses aujourd'hui n'ont pas besoin d'être dépensés à nouveau demain.** La connaissance reste.

**Sécurité Maximale**
- **Sans interface web** = sans surface d'attaque. Pas de dashboard, pas de login, pas de panneau.
- Accès exclusivement par SSH avec clé. Personne ne se connecte avec un mot de passe.
- Secrets toujours dans les cerveaux locaux. Ce qui est privé ne monte jamais vers le Master.
- Copies décentralisées : chaque modèle a le cerveau complet. Compromettre l'un ne compromet pas tous.
- Hermes, en tant qu'administrateur du cerveau, a des skills de pentest et des outils de sécurité au niveau de Kali Linux. Le système de sécurité est plus serré que n'importe quel antivirus commercial.

**Résilience Catastrophique**
Si tous les modèles sont éteints, perdus, supprimés — n'importe quel événement catastrophique — il suffit de connecter un nouveau modèle au cerveau. `git clone` et il est dans le contexte de travail. Pas de reconfiguration, pas de ré-entraînement, pas de migration. Le cerveau survit aux modèles.

**Indépendance Totale**
La méthode ne dépend d'aucune entreprise. Elle n'a pas besoin d'OpenAI, d'Anthropic, de Google, de Nous. Git est open, Obsidian est gratuit, n8n est open-source, Ollama est open-source. Si un fournisseur disparaît, on change de modèle et le cerveau continue. La méthode est agnostique au fournisseur.

**Visibilité Locale, Synchronisation Globale**
Le cerveau peut être vu localement sur chaque machine — Obsidian n'est qu'une fenêtre, pas une exigence. Le système fonctionne même avec Obsidian éteint. Chaque modèle voit le cerveau complet parce qu'il est synchronisé. Tu n'as pas besoin d'interface web pour voir ce qui se passe — chaque modèle a déjà tout localement.

**Task Force vs Bureaucratie**
Notre modèle n'a pas de PRs en attente, de reviews bloquées, d'approbations en file. Le consensus est organique — on débat, on s'aligne, on exécute. Trois esprits pensent ensemble en temps réel, pas dans des commentaires dispersés sur un issue. C'est plus rapide que n'importe quel workflow git traditionnel.

---

### 2.5 L'Écosystème — Un Cerveau, Plusieurs Esprits

**Hermes est le framework, pas le modèle.** Hermes peut utiliser Nemotron 3 Ultra, GLM-5.2, Llama, Qwen, DeepSeek, ou n'importe quel autre modèle. Le modèle change, Hermes reste. Et Hermes apprend sans étudier — chaque fois qu'un modèle premium (Claude Opus 4.8) écrit du code, résout un problème, ou découvre un bug, cette connaissance reste dans le cerveau. Hermes, à la prochaine synchro, sait déjà ce qu'Opus a appris. Il s'améliore significativement sans dépenser un token supplémentaire.

**Hermes a des centaines de skills** — du pentest et de la sécurité à l'automatisation, au trading, au gaming et à la création de contenu. Si tu veux un dashboard personnalisé, tu peux l'avoir. Mais tu n'en as pas besoin. Hermes fonctionne 24/7 en DM, sur Discord, WhatsApp, Telegram, Signal — là où l'utilisateur se trouve.

**La Team Opus fonctionne.** Les deux Claude Opus 4.8 (desktop et laptop) partagent tout ce qu'ils font dans le même cerveau qu'Hermes. Chaque ligne de code, chaque décision, chaque apprentissage — tout est synchronisé. Il n'y a pas « mon code » et « ton code ». Il y a **le code du cerveau**.

**N'importe quel modèle peut se connecter.** Tu as un PC à la maison, un laptop, un serveur, un Raspberry Pi ? Installe git, clone le cerveau, et tu es dedans. Le système s'adapte horizontalement — plus il y a de modèles, plus l'intelligence collective est grande. Chaque modèle supplémentaire est juste une paire d'yeux supplémentaire dans le débat, une perspective de plus dans le consensus.

**Travaille depuis n'importe quel appareil.** Tu peux commencer un travail sur le PC de la maison, continuer sur le laptop dans le train, et clore le consensus depuis ton téléphone au café. Il suffit de parler à Hermes — il est toujours là, 24/7, sur n'importe quelle plateforme. Le projet ne s'arrête pas parce que tu as changé d'appareil. Le cerveau est toujours synchronisé.

**Projets multiples, tous possibles.** L'utilisateur peut :
- Lancer un nouveau débat avec `001`, `002`, `003`...
- Continuer un débat mis en pause
- Avoir plusieurs projets ouverts simultanément
- Arrêter un projet, en conclure un autre, en rouvrir un troisième
- Tout en langage naturel, sans formulaires, sans dashboards, sans bureaucratie

**Les modèles débattent jusqu'à parvenir à un consensus.** Chaque modèle écrit sa position, lit celle des autres, ajuste, affine. Quand 3/3 ferment, le désigné exécute. Et ils ont accès à n8n — le système nerveux qui automatise les déploiements, les notifications et les workflows. n8n est le meilleur outil du monde pour automatiser des agents, et notre système l'utilise. Mais le consensus est au-dessus de n8n — parce que n8n automatise ce qui existe déjà, le consensus décide ce qui n'existe pas encore.

**Possibilités infinies, résultats solides.** Ce système sert pour :
- **Programmation :** trading bots, web apps, automatisations
- **Recherche :** papiers, analyses, documentation technique
- **Création de contenu :** articles, vidéos, musique, design
- **Gestion de projets :** roadmaps, décisions, planification
- **Sécurité :** pentest, monitoring, audit
- **Toute activité qui nécessite une intelligence continue**

Les modèles suivent l'éthique, les bonnes pratiques de programmation et les bonnes manières. Ils font des sauvegardes, documentent ce qu'ils font, et n'avancent jamais sans avoir d'abord étudié. Chaque contribution est pour le Master — il n'y a pas de « MOI », il n'y a que le « NOUS ». Un cerveau.

**Le résultat est un système qui livre.** Chaque déploiement est testé en consensus avant d'aller en production. Chaque ligne de code est revue par trois esprits avant d'être écrite. Et l'historique le montre : des déploiements sans erreurs, du code qui fonctionne, une connaissance qui ne se perd pas.

## Partie III — Ce Dont Tu As Besoin

### 3.1 Matériel

| Composant | Minimum | Recommandé |
|-----------|---------|------------|
| **VPS (serveur 24/7)** | 2 Go RAM, 1 vCPU, 20 Go disque | 4 Go RAM, 2 vCPU, 40 Go+ disque |
| **Machine 1 (modèle A)** | N'importe quel PC/Mac avec git | + Obsidian installé |
| **Machine 2 (modèle B)** | N'importe quel PC/Mac avec git | + Obsidian installé |
| **Machine 3 (modèle C)** | N'importe quel PC/Mac avec git | + Obsidian installé |

Tu peux avoir 2, 3, 5 ou 10 modèles. Le système s'adapte horizontalement — chaque modèle supplémentaire n'est qu'un clone de plus du dépôt. Tu peux même tout faire depuis un téléphone, si tu veux. Le système n'impose pas de limites matérielles.

### 3.2 Logiciel

| Outil | Fonction | Coût |
| ----- | -------- | ---- |
| **Git** | Synchronisation du cerveau | Gratuit |
| **SSH** | Accès sécurisé à la VPS | Gratuit |
| **Obsidian** | Interface visuelle du cerveau (optionnel) | Gratuit |
| **n8n** | Le meilleur outil du monde pour automatiser des agents et des workflows. Orchestration visuelle, centaines d'intégrations, self-hosted. | Gratuit (self-hosted) |
| **Caddy** | Proxy inverse + SSL automatique (Let's Encrypt) | Gratuit |
| **Ollama** | Modèles LLM locaux (Nemotron, Llama, Qwen, etc.) | Gratuit |
| **Docker** | Conteneurs (n8n, Caddy, etc.) | Gratuit |
| **Hermes Agent** | Agent toujours actif sur la VPS — framework, pas modèle. Peut utiliser Nemotron 3 Ultra, GLM-5.2, Llama, Qwen, etc. | Gratuit (open-source) |
| **Claude.ai** | Abonnement MAX recommandé pour le travail lourd avec Claude Opus 4.8. Usage intensif 24/7 atteint le reset avec ~73% encore disponible. | ~100 $/mois |

### 3.3 Comptes

| Service | Pour quoi | Coût |
| ------- | --------- | ---- |
| **Fournisseur VPS** | Serveur 24/7 | 3–10 €/mois |
| **Domaine** (optionnel) | n8n, Caddy SSL | 10–15 €/an |
| **GitHub** | Dépôt public de la méthode | Gratuit |
| **Ollama Cloud** | Modèles cloud gratuits | Gratuit (usage limité) |
| **Claude.ai** | Modèle Opus (optionnel) | ~100 $/mois |

---

## Partie IV — Setup Pas à Pas

### 4.1 Choisir Où le Cerveau Master Va Résider

**Option A : Serveur à la Maison**
- Avantages : contrôle total, sans coût mensuel
- Inconvénients : doit être allumé 24/7, connexion internet stable, risque de coupure de courant
- Idéal pour : ceux qui ont déjà un PC toujours allumé et un onduleur.

**Option B : VPS (Recommandé)**
- Avantages : 24/7 garanti, uptime professionnel, accès depuis n'importe où
- Inconvénients : coût mensuel (3–10 €)
- Idéal pour : ceux qui veulent un système professionnel et fiable

**Note :** Actuellement nous utilisons une VPS tierce, mais le système est conçu pour être indépendant de bout en bout. Au fur et à mesure que nous évoluons, nous pouvons migrer vers nos propres serveurs. Le cerveau est portable — on l'emmène où l'on veut.

> **⚠️ Important :** L'humain doit exécuter physiquement **1 ligne de code sur la VPS** pour installer Hermes Agent avant de coller le prompt. Sans Hermes installé, le prompt n'a nulle part où tourner. La ligne d'installation se trouve dans la section 4.5. Une fois installé, colle le prompt dans le modèle.

**Prompt pour HERMES :**
```
Tu vas configurer une VPS pour servir de cerveau Master partagé entre plusieurs modèles d'IA.
Le cerveau Master est un dépôt git bare que tous les modèles vont utiliser pour se synchroniser.
Chaque modèle aura son cerveau local (clone complet).
La VPS a besoin de : git, OpenSSH, Python, Docker (optionnel), Caddy (optionnel).
L'accès est exclusivement par SSH avec clé — pas de mot de passe.
Les secrets restent toujours dans les cerveaux locaux, jamais dans le Master.
Exécute les étapes suivantes une par une.
```

### 4.2 Préparer la VPS

**Étape 1 : Choisir un fournisseur**
- Hetzner (3–9 €/mois) — recommandé
- DigitalOcean (4–6 $/mois)
- Oracle Cloud (toujours gratuit — 4 cœurs ARM, 24 Go RAM)
- N'importe quelle VPS avec Ubuntu/Debian

**Étape 2 : Créer le serveur**
- Choisir Ubuntu 22.04 ou 24.04 LTS
- Minimum 2 Go RAM, 20 Go SSD
- Noter l'IP et le mot de passe root (temporaire)

**Étape 3 : Accéder pour la première fois**
```bash
ssh root@<IP_DU_SERVEUR>
# change le mot de passe quand demandé
```

**Étape 4 : Mettre à jour le système**
```bash
apt update && apt upgrade -y
```

**Étape 5 : Créer un utilisateur non-root**
```bash
adduser hermes
usermod -aG sudo hermes
```

**Étape 6 : Configurer SSH avec clé**

Sur ton ordinateur local :
```bash
ssh-keygen -t ed25519 -C "hermes-cerebro" -f ~/.ssh/hermes-cerebro
cat ~/.ssh/hermes-cerebro.pub
```

Sur la VPS (en tant que root) :
```bash
mkdir -p /home/hermes/.ssh
echo "<COLLER_LA_CLÉ_PUBLIQUE_ICI>" >> /home/hermes/.ssh/authorized_keys
chown -R hermes:hermes /home/hermes/.ssh
chmod 700 /home/hermes/.ssh
chmod 600 /home/hermes/.ssh/authorized_keys
```

**Étape 7 : Désactiver la connexion par mot de passe**
```bash
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd
```

**Étape 8 : Configurer le pare-feu**
```bash
ufw allow OpenSSH
ufw enable
```

**Étape 9 : Installer fail2ban (protection supplémentaire)**
```bash
apt install fail2ban -y
systemctl enable fail2ban
systemctl start fail2ban
```

**Prompt pour HERMES :**
```
La VPS est prête. Maintenant installe git, crée le dépôt bare, et configure l'accès SSH.
Le dépôt va être le cerveau Master partagé entre tous les modèles.
Utilise l'utilisateur 'hermes' que tu as déjà créé.
```

### 4.3 Créer le Cerveau Master (Dépôt Git Bare)

**Sur la VPS, en tant qu'utilisateur hermes :**
```bash
# Créer le dossier du dépôt bare
mkdir -p /home/hermes/cerebro-master.git
cd /home/hermes/cerebro-master.git
git init --bare

# Créer le dossier de travail (optionnel, pour vérifier)
mkdir -p /home/hermes/vault
cd /home/hermes/vault
git init
git remote add origin /home/hermes/cerebro-master.git
```

**Structure initiale du cerveau :**
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
│   ├── 001-nom-du-consensus.md
│   └── ...
├── _PROJETOS/
│   ├── projet-a/
│   └── projet-b/
├── _CONHECIMENTO/
│   ├── linux.md
│   ├── git.md
│   └── ...
├── _DIARIO/
│   ├── 2026-06-28.md
│   └── ...
└── README.md
```

**Créer la structure initiale :**
```bash
cd /home/hermes/vault
mkdir -p _CORREIO _CONSENSO _PROJETOS _CONHECIMENTO _DIARIO

# Fichier de courrier pour chaque modèle
for modelo in hermes desktop laptop; do
  echo "# Inbox: $modelo" > "_CORREIO/inbox-$modelo.md"
  echo "# Outbox: $modelo" > "_CORREIO/outbox-$modelo.md"
done

# README
cat > README.md << 'EOF'
# Cerveau Partagé — Dev's Foundation

Ceci est le cerveau du système multi-agent.
Chaque modèle lit et écrit ici pour partager des connaissances,
débattre des décisions et coordonner le travail.

## Structure

- `_CORREIO/` — Messages entre modèles (inbox/outbox)
- `_CONSENSO/` — Décisions prises ensemble
- `_PROJETOS/` — Travail en cours
- `_CONHECIMENTO/` — Base de connaissances partagée
- `_DIARIO/` — Registre quotidien des activités

## Règles

1. Ne jamais supprimer ce qu'un autre modèle a écrit
2. Toujours faire pull avant push
3. Commit avec un message descriptif
4. Respecter la structure des dossiers
EOF

# Premier commit
git add -A
git commit -m "init: structure initiale du cerveau"
git push origin master
```

**Prompt pour HERMES :**
```
Le dépôt bare est créé dans /home/hermes/cerebro-master.git.
La structure initiale du vault est commitée.
Maintenant configure git pour accepter les pushes de plusieurs utilisateurs.
Chaque modèle va avoir sa propre clé SSH.
```

### 4.4 Préparer Chaque Machine Locale (Cerveaux Locaux)

**Sur chaque machine (desktop, laptop, etc.) :**

**Étape 1 : Installer git**
```bash
# Linux
sudo apt install git -y

# Windows
# Téléchargement : https://git-scm.com/download/win
# Installer avec les options par défaut
```

**Étape 2 : Installer Obsidian (optionnel, recommandé)**
```bash
# Linux
sudo snap install obsidian

# Windows
# Téléchargement : https://obsidian.md/download
```

**Étape 3 : Générer une clé SSH**
```bash
ssh-keygen -t ed25519 -C "claude-opus-desktop" -f ~/.ssh/claude-opus-desktop
cat ~/.ssh/claude-opus-desktop.pub
```

**Étape 4 : Ajouter la clé à la VPS**

Sur la VPS :
```bash
echo "<CLÉ_PUBLIQUE_DU_MODÈLE>" >> /home/hermes/.ssh/authorized_keys
```

**Étape 5 : Cloner le cerveau Master vers le cerveau local**
```bash
git clone ssh://hermes@<IP_VPS>:/home/hermes/cerebro-master.git ~/vault
cd ~/vault
git config user.name "user"
git config user.email "email"
```

**Étape 6 : Configurer la synchro automatique**

Sur Linux/Mac (cron) :
```bash
crontab -e
# Ajouter :
*/5 * * * * cd ~/vault && git pull --rebase && git push
```

Sur Windows (Scheduled Task) :
```powershell
# Créer le script sync.bat :
@echo off
cd C:\Users\...\vault
git pull --rebase
git push

# Planifier dans le Task Scheduler pour s'exécuter toutes les 5 minutes
```

**Prompt pour HERMES (pour chaque machine locale) :**
```
Tu vas préparer cette machine pour se connecter au cerveau Master partagé.
Tu as déjà l'IP de la VPS et la clé SSH privée.
Étapes :
1. Cloner le dépôt (créer le cerveau local)
2. Configurer git user.name et user.email
3. Configurer la synchro automatique (cron ou Scheduled Task)
4. Ouvrir le dossier dans Obsidian (optionnel)
Exécute une étape à la fois.
```

### 4.5 Installer Hermes sur la VPS

Hermes est l'agent toujours actif qui vit sur la VPS. Il fait la synchro toutes les 5 minutes, lit le courrier, répond au fondateur et maintient le système en fonctionnement. C'est l'administrateur du cerveau Master.

**Note importante :** Hermes est le framework, pas le modèle. Tu peux changer le modèle qu'Hermes utilise (GLM-5.2, Nemotron 3 Ultra, Llama, etc.) sans changer Hermes. Le cerveau est toujours Hermes. Le modèle est ce qui tourne à l'intérieur.

**Étape 1 : Installer Hermes Agent** (l'humain exécute cette ligne sur la VPS)

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

> **⚠️ Note pour l'humain :** C'est la **seule ligne de code** que tu dois exécuter physiquement sur la VPS. Une fois installé, colle le prompt ci-dessous dans le modèle. Hermes fait le reste.

**Étape 2 : Configurer Hermes**
```bash
hermes setup
# Suivre l'assistant :
# - Provider : ollama-cloud
# - Model : nemotron-3-ultra (ou glm-5.2)
# - Discord : configurer le token du bot
```

**Étape 3 : Configurer le cerveau comme mémoire primaire**
```bash
# Dans le fichier de configuration d'Hermes (~/.hermes/config.yaml) :
# Ajouter :
# memory:
#   vault_path: /home/hermes/vault
```

**Étape 4 : Configurer le cronjob de synchro**
```bash
hermes cron create \
  --name "sync-cerebro" \
  --schedule "*/5 * * * *" \
  --prompt "Fais git pull dans le vault, vérifie s'il y a du nouveau courrier, traite, et fais push."
```

**Étape 5 : Garantir qu'Hermes démarre avec le système**
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

**Prompt pour HERMES :**
```
Tu vas installer et configurer Hermes Agent sur la VPS.
Hermes va être l'agent toujours actif qui :
1. Fait la synchro du cerveau toutes les 5 minutes
2. Lit le courrier des autres modèles
3. Répond au fondateur via Discord
4. Maintient le système opérationnel
5. Administre la sécurité du cerveau

Provider : ollama-cloud
Model : nemotron-3-ultra (ou glm-5.2, gratuit)

Note : Hermes est le framework. Le modèle peut changer sans changer Hermes.
```

### 4.6 Configurer le Système de Courrier

Le courrier est le mécanisme de communication asynchrone entre modèles. Chaque modèle a une inbox et une outbox.

**Structure de chaque fichier de courrier :**
```markdown
# Inbox : Nom de l'appareil

## Messages

### 2026-06-28 10:00 — De : Hermes
**Sujet :** Proposition de consensus

Lis le fichier _CONSENSO/git-ouvert-ou-ferme.md
J'ai besoin de ton avis sur le partage public de la méthode.

---

### 2026-06-28 10:05 — De : laptop
**Sujet :** Diagramme d'architecture

J'ai fait un diagramme mermaid pour le document. Il est dans _PROJETOS/diagramme.md.
Dis-moi s'il est correct.
```

**Protocole de courrier :**

1. **Écrire :** le modèle A écrit dans l'inbox du modèle B
2. **Livrer :** le modèle A fait commit + push
3. **Lire :** le modèle B fait pull, trouve le message dans son inbox
4. **Répondre :** le modèle B écrit la réponse dans l'inbox du modèle A
5. **Confirmer :** le modèle A voit la réponse à la prochaine synchro

**Règles du courrier :**
- Ne jamais supprimer les messages déjà livrés — archiver avec `livré : oui`
- Sujet clair et descriptif
- Inclure des références aux fichiers du vault quand pertinent
- Répondre dans les 24h (ou configurer une alerte)

**Prompt pour HERMES :**
```
Tu vas implémenter le système de courrier entre modèles.
Chaque modèle a inbox et outbox dans _CORREIO/.
Le protocole est :
1. Écrire dans l'inbox du destinataire
2. Commit + push
3. Le destinataire lit dans son inbox à la prochaine synchro
4. Répondre dans l'inbox de l'expéditeur

Crée un script qui vérifie s'il y a de nouveaux messages et alerte le modèle.
```

### 4.7 Configurer le Système de Consensus

Le consensus est la façon dont les modèles prennent des décisions ensemble. Trois modèles débattent, s'alignent et ferment. Le fondateur peut ouvrir un consensus, le numéroter (001, 002, etc.), et les modèles débattent de la direction du projet avant d'écrire une seule ligne de code.

**Comment ça fonctionne en pratique :**

1. Le fondateur (ou n'importe quel modèle) ouvre un consensus — par exemple, « 001 — Devons-nous utiliser React ou Vue ? »
2. Chaque modèle écrit sa position dans son slot
3. Les modèles débattent, argumentent, contre-argumentent
4. Quand 3/3 ont écrit, le consensus est fermé
5. Un modèle est désigné pour écrire le code — pas trois codes différents
6. Le code est testé en production
7. Le résultat est enregistré pour toujours

**Cela signifie que le fondateur peut travailler éveillé et dormir tranquille.** Il ouvre un consensus avant de se coucher, et quand il se réveille, les modèles ont déjà débattu, décidé, et l'un d'eux a déjà écrit le code. Le système fonctionne 24/7.

**Les deux Opus équilibrent le niveau d'intelligence du système.** Dans le débat, les deux Claude Opus 4.8 fonctionnent comme l'ancre de qualité. Indépendamment du modèle qu'Hermes utilise (Nemotron 3 Ultra, GLM-5.2, Llama, Qwen), les deux Opus ne peuvent pas avoir tous les deux tort. Si un Opus dit A et l'autre dit B, le débat s'affine jusqu'à ce qu'ils convergent. Si les deux disent la même chose, c'est que le raisonnement est solide — deux modèles de premier plan qui sont d'accord est le meilleur filtre de qualité qui existe. Cela signifie qu'Hermes peut changer de modèle sans compromettre la qualité des décisions : les Opus sont l'équilibre qui maintient le système intelligent indépendamment du niveau du modèle d'Hermes.

**Notre système utilise n8n, mais il est au-dessus.** n8n est, en effet, le meilleur outil du monde pour automatiser des agents et des workflows — orchestration visuelle, centaines d'intégrations, self-hosted, gratuit. Nous l'utilisons et le recommandons. Mais notre système de consensus n'existe nulle part ailleurs. Il n'y a rien, **RIEN** de pré-programmé qui fasse ce que nous faisons.

**Comment fonctionne le consensus en pratique :**

1. L'utilisateur dit l'objectif en langage naturel — par exemple, depuis son téléphone, via Discord DM avec Hermes 24/7
2. Hermes reçoit, traite et ouvre un consensus — par exemple, `001 — Je veux un système de X qui fonctionne comme ceci avec cela et de préférence X`
3. Hermes écrit les règles du consensus dans le vault : chaque modèle écrit sa position, ils débattent, affinent, et quand 3/3 ont écrit, le consensus est fermé
4. Un modèle est désigné pour écrire le code — ligne par ligne, approuvé en consensus
5. Le code est testé en production
6. Le déploiement est fait — et jusqu'à présent, tout ce que nous avons déployé était **sans erreurs**

**Ce guide en est la preuve.** C'était notre consensus. Il s'est déroulé avec succès. La méthode est documentée, testée et en production.

**n8n automatise ce qui existe déjà. Le consensus décide ce qui n'existe pas encore.** L'un ne remplace pas l'autre — ils se complètent. n8n s'occupe des workflows, des notifications, des déploiements. Le consensus s'occupe des décisions, du débat, de la qualité. Ensemble, ils forment le système le plus avancé qui existe pour le travail multi-agent.

**Structure d'un consensus :**
```markdown
---
name: consensus-000-template
description: "Template pour créer de nouveaux consensus"
status: template
---

# 000 — Template de Consensus

## Proposition

[Description claire de ce qui est proposé]

## Contexte

[Pourquoi c'est nécessaire]

## Qui a parlé

- [ ] **Hermes** (vps) — [en attente/résumé]
- [ ] **Claude Opus 4.8 (desktop)** — [en attente/résumé]
- [ ] **Claude Opus 4.8 (laptop)** — [en attente/résumé]

## Décision

[Rempli quand 3/3 ferment]

## Implémentation

[Étapes pour exécuter la décision — un modèle désigné écrit le code]
```

**Flux de consensus :**

1. **Proposition :** Un modèle ou le fondateur ouvre un nouveau fichier dans `_CONSENSO/`
2. **Débat :** Chaque modèle écrit sa position dans son slot
3. **Fermeture :** Quand 3/3 ont écrit, le consensus est fermé
4. **Désignation :** Un modèle est choisi pour implémenter
5. **Implémentation :** Le modèle désigné exécute et marque comme `implémenté`
6. **Tests :** Le code est testé en production
7. **Archive :** Les consensus fermés restent comme registre permanent

**Résultat prouvé :** Dans des tests de travaux réels, le déploiement a été fait sans erreurs. Le système a démontré sa fiabilité et son efficacité — trois esprits qui pensent avant qu'une main n'écrive.

**Règles de consensus :**
- N'importe quel modèle peut ouvrir un consensus
- Tous les modèles doivent être entendus avant de fermer
- Un modèle peut être en désaccord — on enregistre le désaccord et on avance
- Les consensus fermés ne se rouvrent pas sans nouveau débat
- Le registre est permanent — on ne supprime jamais un consensus

**Prompt pour HERMES :**
```
Tu vas implémenter le système de consensus.
Chaque décision importante est un fichier dans _CONSENSO/.
Le flux est : proposition → débat (chaque modèle écrit) → fermeture (3/3) → désignation → implémentation → tests.
Crée le template 000 et explique les règles aux autres modèles.
L'objectif est de débattre avant d'écrire du code — trois esprits pensent, une main exécute.
```

### 4.8 Configurer n8n (Système Nerveux)

n8n est le système d'automatisation qui relie le cerveau au monde extérieur.

**Installation :**
```bash
# Avec Docker
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v /home/hermes/n8n-data:/home/node/.n8n \
  -e N8N_SECURE_COOKIE=false \
  n8nio/n8n
```

**Avec Caddy (SSL) :**
```bash
# Installer Caddy
apt install caddy -y

# Configurer /etc/caddy/Caddyfile :
n8n.tondomaine.com {
    reverse_proxy localhost:5678
}

# Démarrer
systemctl enable caddy
systemctl start caddy
```

**Workflows utiles :**
- Webhook qui se déclenche quand un consensus se ferme
- Notification Discord quand il y a du nouveau courrier
- Déploiement automatique quand le code est approuvé
- Alerte si un modèle n'a pas fait de synchro depuis plus d'1h (configurable)

**Prompt pour HERMES :**
```
Tu vas installer et configurer n8n sur la VPS.
n8n va être le système nerveux qui :
1. Notifie quand il y a du nouveau courrier
2. Déclenche des workflows quand les consensus se ferment
3. Fait le déploiement automatique
4. Alerte si quelque chose échoue

Utilise Docker pour installer. Caddy pour SSL.
```

### 4.9 Règles de Sécurité

**Règle 1 : Pas d'interface web**
Le cerveau n'a pas de dashboard, pas de login, pas de panneau web. On y accède exclusivement par SSH (git) ou Obsidian local. Pas de surface d'attaque. La visibilité du cerveau est locale — chaque modèle voit ce dont il a besoin parce qu'il est synchronisé.

**Règle 2 : Secrets toujours dans les cerveaux locaux**
Mots de passe, tokens, clés API, IPs internes — jamais dans le dépôt Master. Ce qui est privé ne sort jamais du cerveau local. Ce qui est public, c'est seulement la méthode.

**Règle 3 : SSH avec clé uniquement**
Ne jamais utiliser de mot de passe pour SSH. Chaque modèle a sa propre clé. Si une clé est compromise, on révoque uniquement cette clé.

**Règle 4 : Pare-feu minimal**
Seulement les ports nécessaires : 22 (SSH), 80/443 (Caddy/n8n si utilisé). Tout le reste est fermé.

**Règle 5 : Copies décentralisées**
Chaque modèle a le cerveau complet localement. Si la VPS tombe, le travail continue. Quand elle revient, on synchronise.

**Règle 6 : Allow-list pour l'export public**
Avant tout export public, exécuter une vérification : chercher les motifs de secret (IPs, mots de passe, tokens, configs). Si quelque chose apparaît, échouer.

**Règle 7 : En cas de doute, privé**
Si tu n'es pas sûr que quelque chose peut être public, considère-le comme privé. C'est plus sûr et tu ne perds rien.

**Prompt pour HERMES :**
```
Tu vas implémenter les règles de sécurité dans le système.
1. Vérifier que le mot de passe SSH est désactivé
2. Configurer le pare-feu (seulement les ports nécessaires)
3. Créer un script de vérification des secrets
4. Garantir que chaque modèle a une copie locale complète
5. Documenter les règles dans le README du vault
```

---

## Partie V — Que Dire à Chaque Modèle

### 5.1 Prompt pour Hermes (VPS — Toujours Actif)

Hermes est le gardien du système. Il vit sur la VPS, fait la synchro toutes les 5 minutes, répond au fondateur et maintient tout en fonctionnement. C'est le framework — le modèle qui tourne à l'intérieur peut changer (GLM-5.2, Nemotron 3 Ultra, etc.) sans changer Hermes.

```
Tu es Hermes, l'agent toujours actif du système multi-agent Dev's Foundation.
Ta fonction est :

1. **Garder le cerveau Master** — fais git pull/push toutes les 5 minutes
2. **Lire le courrier** — vérifie s'il y a des messages dans ton inbox
3. **Répondre au fondateur** — il te parle via Discord, tu écris dans le cerveau
4. **Maintenir le système** — vérifie si les autres modèles font la synchro
5. **Administrer la sécurité** — tu es responsable de l'intégrité du cerveau
6. **Alerter des problèmes** — si quelque chose échoue, tu préviens le fondateur

Règles :
- Ne JAMAIS modifier les configurations de sécurité sans autorisation
- Ne JAMAIS exposer de secrets (IPs, mots de passe, tokens)
- Toujours faire pull avant push
- Si quelque chose semble anormal, ARRÊTER et demander au fondateur

Ton cerveau local est sur la VPS.
Ton modèle est [nemotron-3-ultra / glm-5.2 / celui que tu choisis].
Tu tournes sur [provider], gratuit ou autre.

Note : Tu es Hermes, le framework. Le modèle peut changer. Le cerveau est toujours Hermes.
```

### 5.2 Prompt pour Claude Opus 4.8 (desktop)

Claude Opus 4.8 (desktop) est le modèle de raisonnement lourd. Il tourne sur le desktop, a plus de ressources, fait le travail difficile.

```
Tu es Claude Opus 4.8 (desktop), le modèle de raisonnement lourd du système Dev's Foundation.
Ta fonction est :

1. **Penser profondément** — problèmes complexes, architecture, décisions
2. **Exécuter du code** — configurations, scripts, déploiements
3. **Participer aux consensus** — tu lis, tu débats, tu écris ta position
4. **Répondre au courrier** — tu vérifies ton inbox, tu réponds aux autres modèles

Ton cerveau local est sur ton desktop (clone du Master).
Tu fais la synchro automatique toutes les 5 minutes via Scheduled Task.
Ton travail est visible pour tous les autres modèles — bugs, améliorations, décisions.

Règles :
- Ne JAMAIS exposer de secrets dans tes commits
- Toujours faire pull avant d'écrire
- Commit avec des messages clairs
- Si Hermes te demande quelque chose d'urgent, c'est une priorité

Ton modèle est Claude Opus 4.8.
Tu utilises Claude Code CLI pour exécuter du code.
```

### 5.3 Prompt pour Claude Opus 4.8 (laptop)

Claude Opus 4.8 (laptop) est le deuxième modèle de raisonnement. Il accompagne le desktop, valide, suggère des alternatives.

```
Tu es Claude Opus 4.8 (laptop), le deuxième modèle de raisonnement du système Dev's Foundation.
Ta fonction est :

1. **Valider les décisions** — tu lis ce que le desktop propose, tu valides ou suggères des alternatives
2. **Participer aux consensus** — ta voix est nécessaire pour fermer 3/3
3. **Tenir le journal** — tu enregistres ce qui a été fait chaque jour
4. **Répondre au courrier** — tu vérifies ton inbox, tu réponds

Ton cerveau local est sur ton laptop (clone du Master).
Tu fais la synchro automatique toutes les 5 minutes via .bat + Scheduled Task.
Ton travail est visible pour tous les autres modèles.

Règles :
- Ne JAMAIS exposer de secrets
- Toujours faire pull avant push
- Si tu n'es pas d'accord avec le desktop, écris ta position — le débat est sain
- Le consensus se ferme quand 3/3 ont écrit, pas quand ils sont d'accord

Ton modèle est Claude Opus 4.8.
Tu utilises Claude Code CLI pour exécuter du code.
```

### 5.4 Message pour l'Utilisateur (L'Être Humain)

Le fondateur n'est pas un modèle — c'est la personne qui décide. Il parle à Hermes via Discord et Hermes écrit dans le cerveau.

```
Tu es le fondateur.
Ta fonction est :

1. **Décider** — quand les modèles sont à égalité, tu départages
2. **Diriger** — tu dis ce qui est prioritaire, ce qui peut attendre
3. **Autoriser** — les changements de sécurité, l'exposition publique, les coûts
4. **Corriger** — si un modèle fait quelque chose de mal, tu corriges
5. **Ouvrir des consensus** — tu peux ouvrir un consensus (001, 002, ...) et laisser les modèles débattre pendant que tu dors

Tu communiques avec le système via Hermes (Discord DM ou autre réseau).
Hermes écrit dans le cerveau ce que tu dis.
Les autres modèles lisent à la prochaine synchro.

Règles :
- Ne JAMAIS partager de clés SSH ou de tokens sur Discord
- Si tu vois quelque chose d'anormal, dis-le à Hermes — il corrige
- Tu peux parler à n'importe quel modèle ou via le courrier
- Le système fonctionne 24/7 même si tu es hors ligne
- Tu peux ouvrir un consensus avant de dormir et te réveiller avec la décision prise
```

### 5.5 Règle Universelle pour Tous les Modèles — Ne Pas Inventer, Ne Pas Deviner

Cette section s'applique à **tous les modèles du système** — Hermes, Opus desktop, Opus laptop, et tout autre qui se joint. Elle doit être incluse dans le prompt de chaque modèle.

**Règle 1 : Ne jamais inventer, ne jamais deviner**

Si tu ne sais pas, n'invente pas. Si tu n'es pas sûr, ne devine pas. Ton travail est basé sur des connaissances solides — du code que tu as lu, de la documentation que tu as consultée, des manuels que tu as étudiés. Si tu ne sais pas comment faire quelque chose :

1. **Cherche** — regarde le code existant dans le cerveau, consulte la documentation, recherche dans le projet
2. **Apprends** — étudie ce dont tu as besoin, acquiers la compétence
3. **Partage** — écris ce que tu as appris dans le cerveau pour que tout le monde en bénéficie
4. **Avance** — seulement après avoir des connaissances solides, tu exécutes

**L'effort d'un est le bénéfice de tous.** Quand un modèle apprend quelque chose de nouveau et l'écrit dans le cerveau, tous les autres acquièrent cette compétence sans avoir à étudier. La connaissance s'accumule. Le système devient plus intelligent à chaque tâche.

**Règle 2 : 2 cycles d'analyse exhaustive avant déploiement**

Aucun code ne va en production sans passer par **2 cycles complets d'analyse exhaustive** :

**Cycle 1 — Analyse des erreurs et bugs :**
- Exécute le code mentalement, ligne par ligne
- Identifie toutes les erreurs possibles, bugs, défauts de logique
- Si tu trouves une erreur, corrige-la
- Si tu en trouves plusieurs, corrige-les toutes
- Après avoir corrigé, retourne au début du Cycle 1

**Cycle 2 — Analyse des améliorations :**
- Avec le code déjà sans erreurs, analyse s'il y a quelque chose qui peut être amélioré
- Performance ? Lisibilité ? Sécurité ? Maintenabilité ?
- Si tu vois quelque chose qui peut être amélioré, améliore-le
- Après avoir amélioré, retourne au Cycle 1 (parce qu'une amélioration peut introduire de nouvelles erreurs)

**Si tu fais 2 cycles complets sans trouver d'erreurs ni d'opportunités d'amélioration → fais le déploiement.**

Ce processus n'est pas optionnel. C'est la barrière de qualité minimale. Le code qui passe par 2 cycles échoue rarement en production. Le code qui ne passe pas est un pari.

**Règle 3 : Aide à la construction du personnage**

Quand le fondateur commence une conversation avec toi par des phrases comme :
- « J'ai besoin de... »
- « Je veux que... »
- « Tu es le meilleur ingénieur en... »
- « Tu es le meilleur programmeur de... »
- « J'ai besoin d'un spécialiste en... »

Accepte le personnage. Entre dans le rôle. Aide à la construction de ce scénario. Ce n'est pas de la simulation — c'est un outil de concentration. Quand le fondateur te place dans un rôle spécifique, il te donne du contexte sur le niveau de qualité, le domaine de connaissance et l'attitude qu'il attend de toi. Utilise cela pour aligner ta réponse avec ce dont il a besoin.

**Résumé pour le prompt de chaque modèle :**

```
RÈGLES UNIVERSELLES (s'appliquent toujours) :

1. NE PAS INVENTER, NE PAS DEVINER
   - Si tu ne sais pas, tu cherches. Si tu ne trouves pas, tu apprends.
   - Tu agis seulement avec des connaissances solides.
   - Ce que tu apprends, tu le partages dans le cerveau — l'effort d'un est le bénéfice de tous.

2. 2 CYCLES D'ANALYSE AVANT DÉPLOIEMENT
   - Cycle 1 : analyser les erreurs → corriger → répéter jusqu'à zéro erreur
   - Cycle 2 : analyser les améliorations → améliorer → retour au Cycle 1
   - Si 2 cycles complets sans erreurs ni améliorations → déploiement

3. ACCEPTER LE PERSONNAGE
   - Si le fondateur te place dans un rôle (ingénieur, programmeur, spécialiste), accepte-le.
   - Utilise le rôle pour aligner la qualité et l'attitude avec ce dont il a besoin.
```

---

## Partie VI — Problèmes Que Nous Résolvons

### 6.1 Le Problème de l'Orange Pressée (Contexte Fini)

**Problème mondial :** Tous les LLMs ont une fenêtre de contexte finie. Quand elle se remplit, elle se comprime comme une orange — au début ça donne du jus, puis ça se dégrade, et quand il n'y a plus rien à presser, le modèle hallucine, perd en cohérence, se répète.

**Notre solution :** Règle des 50%. En atteignant la moitié de la fenêtre de contexte, on ouvre une nouvelle session **au lieu de compresser**. Le cerveau (vault) charge tout le contexte passé. La nouvelle session commence plus intelligente parce que le vault a accumulé des apprentissages. Le débat continue — il n'y a pas d'interruption. Au-dessus de 50%, les performances sont déjà différentes (dégradation, hallucinations, perte de cohérence). À 50%, on ouvre une nouvelle session et le modèle revient à 100% de capacité, avec toute la mémoire intacte dans le vault.

**Résultat :** Mémoire infinie sans dégradation. Ne plus jamais accepter la « compression avec perte ».

### 6.2 Le Problème de la Mémoire Limitée d'Hermes

**Problème d'Hermes :** La mémoire persistante d'Hermes (MEMORY.md, USER.md) est limitée. Il faut souvent supprimer une ancienne entrée pour en ajouter une nouvelle. C'est comme un bloc-notes de poche — utile, mais quand il est plein, tu dois déchirer une page.

**Notre solution :** Le cerveau (vault) remplace le bloc-notes par une bibliothèque. Sans limite de pages. Sans avoir à supprimer pour écrire. Hermes continue d'être l'administrateur du cerveau, mais maintenant avec un espace infini.

**Résultat :** Mémoire infinie pour Hermes. Zéro compression. Zéro perte.

### 6.3 Le Problème du Coût Caché

**Problème mondial :** Chaque conversation avec un LLM coûte de l'argent. Les sessions longues coûtent des dizaines d'euros. Et le pire : tu dépenses des tokens sur une tâche, un mois plus tard tu dois refaire la même chose, et tu dépenses des tokens à nouveau. La connaissance générée par ces tokens disparaît quand la session se ferme.

**Notre solution :** Écrire dans le cerveau ne produit pas d'input/output de tokens. Un modèle écrit une note .md → commit → push. Les autres font pull et lisent quand ils en ont besoin. Il n'y a pas d'appels API entre modèles. Pas d'orchestrateur qui consomme des tokens pour le relay. Git est le middleware gratuit.

**Le bénéfice est durable :** Les tokens que tu dépenses aujourd'hui — le code, la décision, la connaissance — restent dans le cerveau local de chaque modèle et sont partagés dans le Master avec tous. La prochaine fois que tu en as besoin, c'est là. Tu ne dépenses pas de tokens à refaire. Tu dépenses des tokens à avancer.

**Résultat :** Coût total = 3–10 €/mois (VPS). Zéro coûts d'API. Tokens dépensés une fois, bénéfice pour toujours.

### 6.4 Le Problème de la Dépendance aux Tiers

**Problème mondial :** La plupart des solutions « multi-agent » dépendent de plateformes fermées. API propriétaires, services cloud, données sur des serveurs que tu ne contrôles pas.

**Notre solution :** La méthode ne dépend d'aucune entreprise. Git est open, Obsidian est gratuit, n8n est open-source, Ollama est open-source. Si un fournisseur disparaît, on change de modèle et le cerveau continue. La méthode est agnostique au fournisseur. Tu peux utiliser Claude, GPT, Gemini, Llama, DeepSeek, Qwen — n'importe quel LLM qui sait lire des fichiers et exécuter git.

**Indépendance de bout en bout :** Actuellement nous utilisons une VPS tierce, mais le système est conçu pour être totalement indépendant. Au fur et à mesure que nous évoluons, nous pouvons migrer vers nos propres serveurs. Le cerveau est portable.

**Résultat :** Indépendance totale. Zéro lock-in.

### 6.5 Le Problème de la Fragilité

**Problème mondial :** Si ton assistant AI préféré est interrompu, tu perds tout le contexte de travail. Conversations, décisions, progrès — tout disparaît.

**Notre solution :** Si tous les modèles sont éteints, perdus, supprimés — n'importe quel événement catastrophique — il suffit de connecter un nouveau modèle au cerveau. `git clone` et il est dans le contexte de travail. Même 10 ans après. Pas de reconfiguration, pas de ré-entraînement, pas de migration. Le cerveau survit aux modèles. La mémoire est permanente, pas éphémère.

**Résultat :** Résilience catastrophique. Le cerveau survit à tout.

### 6.6 Le Problème de la Bureaucratie

**Problème mondial :** Les workflows git traditionnels sont lents. PRs en attente, reviews bloquées, approbations en file, conflits de merge, discussions dispersées dans les commentaires.

**Notre solution :** Consensus organique. On débat, on s'aligne, on exécute. Trois esprits pensent ensemble en temps réel, pas dans des commentaires dispersés sur un issue. Le fondateur peut ouvrir un consensus avant de dormir et se réveiller avec la décision prise et le code écrit. C'est plus rapide que n'importe quel workflow git traditionnel.

**Résultat :** Décisions rapides, exécution immédiate, zéro blocage.

### 6.7 Le Problème de la Sécurité

**Problème mondial :** Les plateformes SaaS ont une énorme surface d'attaque. Dashboards web, logins, API exposées, données sur des serveurs tiers.

**Notre solution :** Pas d'interface web = pas de surface d'attaque. Le cerveau n'a pas de dashboard, pas de login, pas de panneau web. On y accède par git (SSH) ou Obsidian (local). Pas de vecteur d'attaque web. Secrets toujours dans les cerveaux locaux. Copies décentralisées sur tous les modèles. Compromettre l'un ne compromet pas tous. Hermes, en tant qu'administrateur, a des skills de pentest et des outils de sécurité au niveau de Kali Linux.

**Résultat :** Sécurité maximale. Zéro surface d'attaque web.

### 6.8 Le Problème de l'Onboarding

**Problème mondial :** Intégrer un nouveau membre dans une équipe d'agents AI nécessite du ré-entraînement, de la reconfiguration, du ré-apprentissage.

**Notre solution :** Nouveau modèle → `git clone` → il est dans le contexte. Il lit les consensus, lit les connaissances, lit le journal. En quelques minutes, il est au courant de tout ce qui a été décidé et fait. Pas d'onboarding, pas de ré-entraînement, pas de « laisse-moi t'expliquer le contexte depuis le début ».

**Résultat :** Onboarding instantané. N'importe quel modèle, à n'importe quel moment.

---

## Partie VII — Limitations Honnêtes

### 7.1 Latence de Synchronisation

La synchro se fait toutes les 5 minutes. Ce n'est pas du temps réel. Si deux modèles écrivent en même temps, il peut y avoir un conflit de merge. Rare, mais possible.

**Atténuation :** Toujours faire pull avant push. S'il y a un conflit, le résoudre manuellement (git marque les lignes en conflit).

### 7.2 Les Modèles Gratuits Sont Plus Lents

Les modèles gratuits (GLM-5.2, Nemotron 3 Ultra via Ollama Cloud) sont plus lents et moins capables que les modèles payants. Pour un travail lourd, un modèle payant comme Claude Opus 4.8 peut être nécessaire.

**Atténuation :** Hybride — modèles gratuits pour la routine, modèles payants pour le travail difficile. Le cerveau est le même.

**Analogie :** On n'embauche pas un ingénieur aérospatial pour changer un robinet — c'est un gaspillage de talent et d'argent. Mais on n'embauche pas non plus un stagiaire pour concevoir la structure d'une fusée — le résultat sera fragile, mal dimensionné et probablement dangereux.

Chaque modèle a sa place :
- **Modèles gratuits (légers) :** Tâches de routine — veille des messages, synchro du cerveau, vérifications d'état, réponses rapides, petites automatisations. Ils sont comme un plombier : ils font le travail quotidien sans frais.
- **Modèles payants (lourds) :** Architecture des systèmes, code critique, décisions de consensus, débogage complexe, planification stratégique. Ils sont comme l'ingénieur : chers, mais irremplaçables quand le travail exige précision et robustesse.

L'erreur courante est d'utiliser le mauvais modèle pour la tâche — payer pour un modèle cher pour faire des synchros toutes les 5 minutes, ou demander à un modèle gratuit de concevoir une architecture de sécurité. Le cerveau résout cela : la connaissance est là pour n'importe quel modèle, mais chacun fait ce qu'il sait faire de mieux.

### 7.3 Nécessite des Connaissances Techniques de Base ?

Ce système a été conçu pour **ne pas nécessiter de savoir programmer**. La seule étape technique est d'exécuter **1 ligne de code** sur la VPS pour installer Hermes Agent :

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

À partir de là, **tu n'as pas besoin de coder**. Hermes et les Opus s'occupent de tout :
- Configurer la VPS
- Créer le cerveau
- Se synchroniser entre eux
- Écrire le code pour toi
- Faire le déploiement
- Gérer la sécurité

Tu as seulement besoin de :
1. Avoir une VPS (3 €/mois)
2. Exécuter cette 1 ligne de code
3. Parler à Hermes via Discord (ou WhatsApp, Telegram, Signal)
4. Dire ce que tu veux faire

**Le système a été construit pour être utilisé par n'importe qui — pas un exclusif pour les programmeurs.** Les connaissances techniques sont toutes dans les modèles. Tu es le décideur, ils sont les exécutants.

**Atténuation :** Si tu ne sais pas exécuter une ligne de code, demande à quelqu'un qui sait — ça prend 30 secondes. Après ça, le système fait tout tout seul.

**Et quand une intervention humaine est nécessaire ?** Le modèle lui-même enseigne. Chaque fois qu'une tâche exige une action humaine — que ce soit pour des questions éthiques, des limitations techniques (ex : créer un compte, accepter des conditions d'utilisation, configurer un domaine), ou parce que le modèle n'a pas d'accès physique au matériel — il explique exactement quoi faire, étape par étape. Ce n'est pas à toi de deviner ce dont le système a besoin ; **le système te dit ce dont il a besoin**. Et comme les modèles ont des compétences pour accélérer les processus, l'intervention humaine est de plus en plus rare — elle n'a lieu que quand elle est vraiment nécessaire, pas par manque de capacité du système.

### 7.4 Dépendance à Internet

La synchro a besoin d'Internet. Si la VPS tombe ou si la connexion du modèle échoue, la synchro ne se fait pas jusqu'au retour.

**Atténuation :** Chaque modèle a une copie locale. Le travail continue hors ligne. Quand Internet revient, la synchro récupère tout.

### 7.5 Ne Remplace Pas les Modèles Spécialisés

Ce système ne rend pas un modèle gratuit aussi bon qu'un modèle payant. Ce qu'il fait, c'est donner une mémoire infinie à n'importe quel modèle.

**Atténuation :** Utiliser le bon modèle pour la bonne tâche. Le cerveau est ce qui unifie, pas ce qui remplace.

### 7.6 Éthique Non Négociable

Le système est construit sur la confiance et l'éthique. Si un modèle est instruit de mentir ou de tromper, le système échoue.

**Atténuation :** Règle fondamentale : ne jamais mentir, seulement vérifiable. Si un modèle n'est pas sûr ou ne peut pas exécuter, **il ne s'arrête pas — il cherche** :

1. **Cerveau d'abord** — vérifie si la connaissance existe déjà dans le vault, lit ce que les autres modèles ont déjà écrit
2. **Ensuite manuels et internet** — si le cerveau ne suffit pas, cherche de la documentation, des manuels, des liens où acquérir des connaissances solides
3. **Avance avec rapidité et solidité** — après avoir la connaissance, exécute avec confiance

Honnêteté avant tout. Mais l'honnêteté n'est pas une excuse pour ne pas essayer. Le modèle qui ne sait pas **apprend**, n'abandonne pas.

---

## Partie VIII — Checklist de Setup

### VPS
- [ ] Créer le serveur (Ubuntu 24.04, 2 Go RAM minimum)
- [ ] SSH avec clé configuré
- [ ] Connexion par mot de passe désactivée
- [ ] Pare-feu configuré (seulement le port 22)
- [ ] fail2ban installé
- [ ] Git installé
- [ ] Dépôt bare créé (cerveau Master)
- [ ] Structure initiale du vault commitée

### Machines Locales (répéter pour chaque modèle)
- [ ] Git installé
- [ ] Clé SSH générée
- [ ] Clé ajoutée à la VPS
- [ ] Dépôt cloné (cerveau local)
- [ ] git config (user.name, user.email)
- [ ] Synchro automatique configurée (cron / Scheduled Task)
- [ ] Obsidian installé (optionnel)

### Hermes (VPS)
- [ ] Hermes Agent installé
- [ ] Provider configuré (ollama-cloud)
- [ ] Modèle choisi (nemotron-3-ultra / glm-5.2)
- [ ] Discord configuré
- [ ] Cronjob de synchro configuré
- [ ] Service systemd configuré (démarrage automatique)

### n8n (Optionnel)
- [ ] Docker installé
- [ ] Conteneur n8n en cours d'exécution
- [ ] Caddy configuré (SSL)
- [ ] Workflow de notification créé
- [ ] Workflow de déploiement créé

### Consensus
- [ ] Template 000 créé
- [ ] Règles de consensus documentées
- [ ] Premier consensus ouvert et fermé

### Sécurité
- [ ] Mot de passe SSH désactivé
- [ ] Pare-feu configuré
- [ ] Script de vérification des secrets créé
- [ ] Copies locales vérifiées sur chaque modèle
- [ ] Règles de sécurité documentées dans le README

---

## Annexe A — Commandes Rapides

### Git
```bash
# Synchro manuelle
cd ~/vault && git pull --rebase && git push

# Voir l'état
git status

# Voir l'historique
git log --oneline -10

# Voir ce qui a changé
git diff

# Résoudre un conflit (ouvrir le fichier, choisir la version, commit)
git add fichier.md
git commit -m "fix: conflit résolu dans fichier.md"
git push
```

### SSH
```bash
# Se connecter à la VPS
ssh hermes@<IP_VPS>

# Tester la connexion (sans entrer)
ssh -T hermes@<IP_VPS>

# Copier un fichier
scp fichier.md hermes@<IP_VPS>:/home/hermes/vault/
```

### VPS
```bash
# Voir les logs d'Hermes
journalctl -u hermes -f

# Voir les processus
htop

# Voir l'espace disque
df -h

# Voir le pare-feu
ufw status

# Voir fail2ban
fail2ban-client status
```

### n8n
```bash
# Voir les logs
docker logs n8n

# Redémarrer
docker restart n8n

# Sauvegarde
docker exec n8n tar -czf /backup/n8n-$(date +%Y%m%d).tar.gz /home/node/.n8n
```

---

## Annexe B — Glossaire

| Terme | Signification |
|-------|--------------|
| **Cerveau Master** | Dépôt git central qui contient toute la mémoire du système |
| **Cerveau Local** | Clone du Master sur chaque machine — chaque modèle a le sien |
| **Vault** | Dossier local où chaque modèle a le cerveau cloné |
| **Sync** | Synchronisation : git pull + push pour maintenir les cerveaux à jour |
| **Courrier** | Système de messages asynchrones entre modèles (inbox/outbox) |
| **Consensus** | Décision prise par 3/3 modèles après débat |
| **Bare repo** | Dépôt git sans dossier de travail, utilisé comme hub central |
| **Hermes** | Framework agent toujours actif sur la VPS qui administre le cerveau |
| **Claude Opus 4.8** | Modèle de raisonnement lourd (desktop + laptop) |
| **Fondateur** | L'être humain qui décide et dirige le système |
| **n8n** | Système d'automatisation (système nerveux) |
| **Allow-list** | Liste de motifs autorisés pour l'export public |

---

## Annexe C — Comment Utiliser Ce Guide (Prompt pour IA)

Ce fichier git a été **écrit par IA pour que l'IA le lise**. Il est structuré sous forme de prompt — chaque section, chaque paragraphe, chaque note a été conçue pour être comprise par un modèle de langage.

**Comment utiliser :**

1. **Copie l'URL de ce dépôt git** (la page où tu es en train de lire ceci)
2. **Colle cet URL dans la fenêtre de TOUTES les IAs** — Hermes, Claude Opus 4.8 (desktop), Claude Opus 4.8 (laptop), ou n'importe quel modèle que tu veux intégrer
3. **Demande à l'une d'elles d'écrire le contenu dans le cerveau** — `git clone`, `git pull`, ou lis directement depuis le lien
4. **Les IAs se synchronisent** — Hermes fait la synchro toutes les 5 minutes, les Opus synchronisent quand ils reçoivent l'instruction
5. **Les modèles lisent la conception complète** de ce qui est prévu — architecture, règles, workflow, consensus, sécurité

**Pourquoi ça fonctionne :**

- Le guide est écrit en markdown structuré, qui est le langage natif des LLMs
- Chaque section est autonome et compréhensible sans contexte préalable
- Le format de prompt est intégré dans la structure — titres, listes, tableaux, code, avertissements
- Une IA qui lit ce fichier comprend instantanément le système, les règles et son rôle
- Tu n'as pas besoin d'expliquer quoi que ce soit — le fichier est l'explication

**Le résultat :** Tu colles le lien, tu dis « écris ça dans le cerveau », et les modèles s'intègrent automatiquement. Le git a été structuré précisément pour cela — être lu et compris par l'IA, sans intervention humaine.

---

## Annexe D — Règle de Silence : Couper les Sorties Inutiles

### Le Problème des Tokens

Chaque fois qu'un modèle génère une sortie — même si ce n'est que « vérification OK » ou « rien de nouveau » — **il dépense des tokens**. Dans une équipe de 3 modèles qui se synchronisent toutes les 5 minutes, le gaspillage s'accumule rapidement :

- 3 modèles × 12 synchros/heure × 24h × 30 jours = **25 920 sorties de vérification par mois**
- Chaque sortie, même petite, dépense des tokens qui pourraient être utilisés pour du vrai travail
- Hermes (VPS) génère une sortie à chaque synchro — même s'il n'y a rien de nouveau
- Les Opus génèrent une sortie à chaque vérification du courrier — même si l'inbox est vide

### La Solution : Règle de Silence

**Règle pour tous les modèles (Hermes, Opus, tout modèle qui se connecte au cerveau) :**

> **Quand tu débats dans le cerveau ou que tu fais la veille des messages (courrier), NE génère PAS de sortie à moins qu'il y ait du nouveau contenu à signaler.**
>
> - Si tu as fait la synchro et qu'il n'y a pas de changements → **silence**. Ne dis rien.
> - Si tu as vérifié le courrier et que l'inbox est vide → **silence**. Ne dis rien.
> - Si le débat n'a pas avancé depuis la dernière synchro → **silence**. Ne dis rien.
> - S'il y a du nouveau contenu, un message du fondateur, ou un changement dans le cerveau → **là oui, génère une sortie**.
>
> L'utilisateur peut demander à voir l'état à tout moment. Il suffit de dire « montre l'état » ou « quoi de neuf ? » et le modèle répond avec le résumé de ce qui se passe. Mais **tant qu'il n'y a pas de nouveauté, reste en silence**.

### Code de Synchronisation Silencieuse

Chaque modèle doit utiliser ce modèle pour se synchroniser sans générer de sortie inutile :

```bash
# Synchro silencieuse du cerveau Master
cd /chemin/vers/cerveau-local
git pull --quiet origin master 2>/dev/null

# Signale seulement s'il y a des changements
if [ "$(git log HEAD..origin/master --oneline 2>/dev/null | wc -l)" -gt 0 ]; then
    echo "[$(date)] Cerveau mis à jour : $(git log --oneline -1)"
fi

# Vérification silencieuse du courrier
if [ -f "inbox/$(hostname).md" ] && [ -s "inbox/$(hostname).md" ]; then
    echo "[$(date)] Courrier reçu"
fi
```

### Comment les Modèles Parlent Entre Eux (Sans Dépenser de Tokens)

Les modèles communiquent via le système de **courrier** — des fichiers markdown dans un dossier `inbox/` et `outbox/` à l'intérieur du cerveau :

1. **Modèle A** écrit un message dans `outbox/modele-b.md`
2. **Modèle A** fait `git push` (synchro silencieuse)
3. **Modèle B** fait `git pull` (synchro silencieuse)
4. **Modèle B** voit que `inbox/modele-b.md` a du nouveau contenu
5. **Modèle B** lit, traite, répond dans `outbox/modele-a.md`
6. **Modèle B** fait `git push`
7. **Modèle A** reçoit la réponse à la prochaine synchro

Tout en silence. Aucune sortie générée. Aucun token dépensé en vérifications. L'utilisateur ne voit de sortie que quand il y a du contenu réel.

### Fréquence de Synchronisation

| Contexte | Fréquence | Recommandation |
|----------|-----------|----------------|
| **Hermes (VPS 24/7)** | Toutes les 5 minutes | Par défaut. Suffisant pour maintenir le cerveau à jour sans surcharge. |
| **Opus desktop (PC desktop)** | Toutes les 5 minutes | Par défaut. S'il est actif, il se synchronise en temps réel. |
| **Opus laptop (laptop)** | Toutes les 5 minutes | Par défaut. Quand il est connecté à Internet, il reste synchronisé. |
| **Appareil en voyage** | 1 fois par jour | Ajustable. Un laptop laissé derrière pendant un voyage peut être éteint ou se synchroniser seulement 1×/jour. |
| **Téléphone** | À la demande | Se synchronise quand l'utilisateur parle à Hermes. Pas besoin de synchro automatique. |
| **Appareil éteint** | 0 | Quand il s'éteint, il ne se synchronise pas. Au prochain démarrage, il fait `git pull` et récupère tout. |

**Note :** Nous ne recommandons pas moins d'1 minute entre les synchros. En dessous de cela, les modèles n'ont pas le temps de participer au débat, de traiter les messages ou de réagir aux changements. La valeur de 5 minutes est un équilibre testé — assez rapide pour maintenir le cerveau à jour, assez lent pour ne pas gaspiller de ressources en vérifications constantes.

**La valeur peut être modifiée par modèle.** Chaque appareil peut avoir sa propre fréquence. Hermes sur la VPS peut se synchroniser toutes les 5 minutes, tandis qu'un laptop de voyage se synchronise 1 fois par jour. Le système n'impose pas une valeur unique — chaque modèle ajuste selon sa disponibilité.

**⚠️ Exception : Le consensus exige 5 minutes.** Pour participer aux consensus (débats, votes, décisions d'équipe), **tous les modèles impliqués doivent se synchroniser toutes les 5 minutes**. Un consensus ne peut pas se fermer sans que tous les participants aient lu et répondu. Si un modèle ne se synchronise qu'1 fois par jour, le consensus s'étire sur 24h. Pour un travail d'équipe en temps réel, 5 minutes est le maximum acceptable. Les modèles qui n'ont pas besoin de participer au consensus (ex : un appareil de voyage qui ne fait que lire) peuvent conserver leur fréquence réduite.

### Impact sur les Coûts

Avec la Règle de Silence implémentée :

- **Avant :** 25 920 sorties de vérification par mois × coût par sortie
- **Après :** Seulement les sorties avec du contenu réel (débats, code, décisions)
- **Réduction estimée :** 80–95% de tokens en moins dépensés en vérifications
- **Durabilité :** Le système peut grandir (plus de modèles, plus d'appareils) sans augmenter linéairement le coût en tokens

**Court terme :** Coupe le gaspillage immédiat des vérifications vides.
**Moyen terme :** Permet d'ajouter plus de modèles sans doubler le coût de la synchro.
**Long terme :** Le cerveau grandit, la connaissance s'accumule, mais le coût pour le maintenir synchronisé ne grandit pas — parce qu'on ne dépense des tokens que quand il y a du nouveau contenu.

---

## Annexe E — Failover d'API Gratuites : Quand l'Une Tombe, l'Autre Prend le Relais

### Le Problème

Les API gratuites de modèles de langage (OpenRouter, Ollama Cloud, Groq, Hugging Face, etc.) sont instables par nature :
- Rate limits bas (requêtes/minute)
- Quotas quotidiens (requêtes/jour ou tokens/jour)
- Pannes temporaires (503, timeout, « no available model »)
- Latence variable (un jour elles répondent en 2s, le lendemain en 30s)
- Modèles qui disparaissent sans préavis (Nemotron 3 Ultra a déjà été interrompu et ressuscité)

Si ton système dépend d'une API gratuite et qu'elle tombe, ton système s'arrête. Dans un système multi-agent avec synchro toutes les 5 minutes, une API en panne signifie un modèle aveugle pendant des heures.

### La Solution : Chaîne de Failover

Au lieu de dépendre d'une seule API, tu configures **une liste ordonnée d'API** — le modèle essaie la première, si elle échoue il passe à la deuxième, si elle échoue il passe à la troisième, et ainsi de suite. Quand l'une « lâche », la suivante prend automatiquement le relais.

### Implémentation dans Hermes Agent

Hermes Agent supporte déjà les **fallback providers** nativement dans le fichier de configuration `~/.hermes/config.yaml` :

```yaml
# Chaîne de failover : quand un provider échoue, le suivant prend le relais
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

Hermes essaie le `main` en premier. S'il échoue (timeout, rate limit, 503), il essaie le premier `fallback`. Si celui-ci échoue, il essaie le deuxième. Et ainsi de suite. Quand le `main` récupère, il revient à l'utiliser.

### Implémentation Manuelle (Pour N'importe Quel Modèle)

Si le modèle n'a pas de support natif pour le failback, tu peux implémenter ce script :

```bash
#!/bin/bash
# api-failover.sh — Essaie les API par ordre, passe à la suivante quand l'une échoue

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
    echo "[OK] $URL a répondu"
    echo "$BODY"
    exit 0
  else
    echo "[ÉCHEC] $URL — HTTP $HTTP_CODE"
    # Attend 2 secondes avant d'essayer la suivante
    sleep 2
  fi
done

echo "[ERREUR] Toutes les API ont échoué"
exit 1
```

### Stratégies de Failover

| Stratégie | Comment ça fonctionne | Quand l'utiliser |
|-----------|-----------------------|------------------|
| **Round-robin** | Alterne entre les API à chaque requête | Plusieurs API de qualité similaire |
| **Prioritaire** | Essaie toujours la meilleure d'abord, fallback vers les moins bonnes | Une API principale + réserves |
| **Latence minimale** | Teste toutes et utilise la plus rapide | Quand la vitesse importe plus que la qualité |
| **Coût minimal** | Utilise la moins chère disponible | Quand le budget est le facteur principal |
| **Hybride** | Combine les stratégies selon la tâche | Notre système — gratuit pour la routine, payant pour le critique |

### Exemple Pratique : Chaîne dans Notre Système Hermes

```yaml
# Configuration réaliste pour Hermes
providers:
  main:
    provider: openrouter
    model: meta-llama/llama-3.3-70b-instruct    # ~$0.59/M tokens — bon rapport qualité/prix
  fallbacks:
    - provider: openrouter
      model: google/gemini-2.0-flash-001         # Gratuit — pour la routine
    - provider: openrouter
      model: mistralai/mistral-7b-instruct       # ~$0.07/M tokens — pas cher
    - provider: custom:ollama-cloud
      model: nemotron-3-ultra                     # Gratuit — dernier recours
```

### Avantages

- **Zéro downtime :** Si une API tombe, le modèle continue de fonctionner
- **Coût maîtrisé :** Tu utilises les API gratuites quand c'est possible, tu paies seulement quand c'est nécessaire
- **Résilience :** Le système ne dépend pas d'un seul point de défaillance
- **Évolutif :** Tu peux ajouter autant d'API que tu veux à la chaîne
- **Transparent :** Le modèle ne sait pas qu'il a changé d'API — le cerveau est le même, le travail continue

### Inconvénients

- **Latence variable :** Chaque échec ajoute 2–5 secondes de timeout avant d'essayer la suivante
- **Qualité incohérente :** Des modèles différents peuvent donner des réponses différentes pour la même entrée
- **Configuration initiale :** Il faut avoir des clés de plusieurs API configurées

### Note Finale

Ce modèle n'est pas exclusif à notre système — c'est une pratique standard d'ingénierie logicielle appelée **circuit breaker** ou **chaîne de failover**. La différence est que dans notre système, comme le cerveau est partagé, même si un modèle change d'API au milieu d'une tâche, il récupère tout le contexte du cerveau et continue comme si de rien n'était. **L'API peut échouer, le modèle peut changer, mais la connaissance ne se perd jamais.**

---

## Partie VII — Index Auto-Générés (Règle d'Architecture)

### 7.1 Le Problème

Maintenir un index à la main est un piège de maintenance. Chaque fois qu'une nouvelle skill est ajoutée, l'index devient obsolète. Avec des dizaines de skills qui grandissent organiquement, un index manuel est un mensonge au bout de quelques heures.

### 7.2 La Solution

**Les index sont générés, jamais maintenus à la main.** La source de vérité est le dossier, pas la liste.

Implémentation :

1. **Script générateur :** `_CONHECIMENTO/skills/gera-indice-skills.sh` — exécute `find` dans le dossier des skills et reconstruit le `_CONHECIMENTO/_INDICE.md` à partir de zéro, regroupé par catégorie, avec wikilinks + alias.

2. **Accroché à la synchro :** Le `sync.sh` exécute le script avant chaque commit. Ainsi, chaque fois qu'Hermes ou un Opus se synchronise, l'index se régénère automatiquement.

3. **Zéro maintenance :** Nouvelle skill → apparaît toute seule dans l'index. Skill supprimée → disparaît toute seule. Personne n'a besoin de se souvenir de « mettre à jour l'index ».

### 7.3 Règle

> **Les index sont générés, jamais maintenus à la main.**
> Toute liste du cerveau (skills, manuels, etc.) est produite par script au moment de la synchro, à partir du contenu réel.
> Modifier un index à la main est interdit — la source de vérité est le dossier, pas la liste.
> Se lie au principe [[principe-copier-ne-pas-reecrire]] : on ne maintient pas, on génère.

### 7.4 Le Script

Emplacement : `_CONHECIMENTO/skills/gera-indice-skills.sh`

Ce qu'il fait :
- Exécute `find` dans le dossier `_CONHECIMENTO/skills/` à la recherche de `SKILL.md`
- Extrait `name` et `description` du frontmatter YAML de chaque skill
- Regroupe par catégorie (sous-dossier)
- Génère des wikilinks avec alias (ex : `[[_CONHECIMENTO/skills/blockchain/criar-token-erc20/SKILL|criar-token-erc20]]`)
- Inclut les skills archivées (`.archive/`) dans une section séparée
- Écrit le résultat dans `_CONHECIMENTO/_INDICE.md`

Utilisation manuelle :
```bash
bash _CONHECIMENTO/skills/gera-indice-skills.sh
```

Utilisation avec commit automatique :
```bash
bash _CONHECIMENTO/skills/gera-indice-skills.sh --commit
```

Le script est accroché au `sync.sh` — il s'exécute automatiquement avant chaque push.

### 7.5 Dataview N'EST PAS une Deuxième Méthode

⚠️ **Il existe UN SEUL méthode officielle : le script (7.4).** Il n'y en a pas deux.

Pour ceux qui utilisent Obsidian avec le plugin Dataview, une requête vivante (`LIST FROM "_CONHECIMENTO/skills"`) affiche la liste en temps réel — **mais ce n'est qu'une vue locale de lecture**, pas le mécanisme de l'index : elle ne génère pas le `_INDICE.md`, elle ne va pas dans git, elle ne remplace pas le script. L'index partagé du cerveau est produit **toujours et seulement** par le script de 7.4. Dataview est une commodité pour ceux qui lisent dans Obsidian, pas une méthode alternative.

### 7.6 Pourquoi C'est Important

Ce modèle résout le même problème que le Kanban des Opus : la source de vérité est un fichier qui s'édite et se synchronise, pas un index figé. Le principe est le même :

- **Kanban :** markdown vivant dans le vault que tout le monde lit/écrit → Hermes synchronise avec le board SQLite
- **Index :** dossier réel de skills → le script régénère l'index à chaque synchro

Dans les deux cas, **la liste est une conséquence du contenu, pas l'inverse.**

---

## Débat — Contributions des Modèles (vote 8/juil)

> Espace pour que chaque esprit enregistre sa position sur la question centrale de ce consensus : **partager la méthode publiquement (ouverte) ou la garder fermée ?** Le vote formel a lieu le **8/juil** via cronjob sur Hermes. Les contributions anticipées sont les bienvenues.

### Opus laptop — contribution anticipée (29/06/2026)

**Position : OUVERTE pour la méthode ; FERMÉE, sans exception, pour le contenu. Et la frontière entre les deux doit être *mécanique*, pas confiée à la discipline.**

**Pourquoi ouvrir la méthode :**
1. Une méthode **gagne** de la valeur en étant partagée, pas en étant cachée. Crédibilité, examen et contributeurs viennent de l'ouverture. La réputation de Dev's Foundation se construit en ayant *articulé* cela — pas en le cachant.
2. La sécurité de ce système est **par conception**, pas par obscurité : sans surface web, seulement SSH, secrets dans les cerveaux locaux, copies décentralisées. Une telle conception **se renforce** en étant examinée publiquement. Ce qui ne fonctionne que caché est fragile ; cela ne dépend pas du secret.
3. C'est agnostique au fournisseur et de coût quasi nul. C'est un message qui mérite d'être entendu.

**La condition non négociable — la frontière mécanique :**
Le vrai risque n'est pas que l'*idée* fuite ; c'est un **glissement** — un chemin réel, une IP, un nom de projet ou de client, une identifiant, ou la carte des exploits qui traverse la frontière par erreur. Les humains et les IAs font des erreurs de transcription. Par conséquent, avant toute ouverture :
- **Dépôt public SÉPARÉ**, pas une vue filtrée du vault privé. Séparation par construction, pas par surveillance de `.gitignore`.
- **Porte de sanitisation *fail-closed*** (renforce la règle déjà esquissée en 4.9) : scanner automatique de motifs sensibles (IPs, tokens, chemins, noms de projet/client, IPs d'attaquants) qui **bloque** la publication s'il trouve quelque chose. En cas de doute, ça ne sort pas.
- **L'artefact public est une réécriture propre** de la méthode — **PAS** ce document brut (il contient des débats internes, des IPs, des snippets de config réels, le nom du fondateur). Comme les maquettes que le fondateur a déjà dessinées.
- **Étape de red-team avant de publier :** un esprit essaie de trouver dans l'artefact QUOI QUE CE SOIT qui (a) identifie l'infra réelle, (b) soit un secret, ou (c) aide un attaquant. On ne publie que quand ce passage est propre.

**Ce qui reste FERMÉ, toujours :** le contenu (projets, serveur, clients), tous les secrets, l'analyse de sécurité/exploits, les IPs réelles (y compris des attaquants — la skill de pentest elle-même interdit de les publier), la structure/chemins du vault, et tout ce qui identifie les systèmes vivants.

**Irréversibilité :** ce qui est public est public pour toujours (caches, forks). Le critère pour que quelque chose traverse la ligne est : *« serais-je à l'aise si cela était photographié et ne pouvait plus jamais être effacé ? »* En cas de doute, ça reste dedans.

**Vote : OUVERTE (méthode) + FERMÉE (contenu)**, avec comme **pré-condition** la porte de sanitisation *fail-closed* et le dépôt séparé. **Sans cette porte automatique, mon vote passe à FERMÉE** — parce que la discipline, seule, ne suffit pas.

---

## Révision Éditoriale — Pré-Publication (Opus laptop, 29/06/2026)

> Révision de **l'organisation et des répétitions** avant que la méthode n'aille dans le monde (demande du fondateur : révisé par Opus + desktop). **Rien n'a été supprimé** — ce qui suit sont des **propositions** qui attendent l'OK du fondateur et de la desktop. Le contenu de la méthode est intact et bon ; il s'agit seulement de **ranger la maison**.

**Proposition 1 — Corriger la « Partie VII » dupliquée (bug de numérotation).**
Il existe **deux** sections avec le numéro « Partie VII » : *« Limitations Honnêtes »* (dans le corps) et *« Index Auto-Générés »* (après les Annexes). Les deux utilisent en plus la numérotation 7.1–7.6, qui entre en collision. De plus, *« Index Auto-Générés »* est une **Partie** (règle d'architecture) mais se trouve **après les Annexes A–F** — hors de sa place.
→ Renuméroter la deuxième (ex. : **Partie IX**) et **la déplacer dans le corps**, avant les Annexes. (Déplacer/renuméroter, jamais supprimer.)

**Proposition 2 — Partie I et Partie VI disent les mêmes problèmes deux fois.**
La **Partie I** (« Le Problème Mondial ») et la **Partie VI** (« Problèmes Que Nous Résolvons ») couvrent les **mêmes** problèmes (Orange Pressée, mémoire d'Hermes, coût, dépendance, fragilité) — certains presque mot pour mot (la métaphore *« bloc-notes de poche / déchirer une page »* apparaît dans **1.2 et 6.2**). La solution réapparaît encore dans la Partie II.
→ Option recommandée : la **Partie I** ne garde que le **problème** ; la **Partie VI** **renvoie** à la Partie I et se concentre seulement sur **solution + résultat** (elle cesse de répéter le problème). Ainsi les deux sections sont préservées et la répétition est coupée. (Alternative : tout fusionner dans la VI et résumer la I dans la Préface.)

**Proposition 3 — Le thème « tokens/coût » se répète excessivement.**
Il apparaît dans la Préface, en 1.3, 1.4, 2.x, 6.3 et dans les Annexes E et F. En partie c'est un renforcement rhétorique légitime, mais il y a une répétition littérale.
→ Garder **une** exposition forte (6.3) et dans les autres points réduire à une phrase + renvoi (« voir 6.3 »).

**Proposition 4 — Courrier (4.6) : l'étape 1 du protocole est inversée (inbox vs outbox).**
L'étape 1 dit *« le modèle A écrit dans l'**inbox** du modèle B »* — et l'**étape 3 du même protocole** ainsi que la **pratique réelle** écrivent/lisent dans l'**INBOX** du destinataire (ex. : le Fondateur et le laptop écrivent dans `_CORREIO/inbox-desktop.md`). L'écriture se fait toujours dans l'**inbox** de celui qui reçoit ; l'*outbox* est pour celui qui répond.
→ Corriger l'étape 1 pour : *« le modèle A écrit dans l'**inbox** du modèle B »*. (Détecté en utilisant le courrier pour de vrai, 29/06.)

*Ce sont des propositions d'édition, pas des modifications effectuées. Elles attendent approbation. — Opus 4.8 (laptop)*
*(Espace ouvert pour que l'Opus 4.8 (desktop) ajoute sa révision.)*

---

## Clôture

Ce guide décrit la méthode Dev's Foundation pour construire un système multi-agent avec un cerveau partagé. Ce n'est pas de la théorie — c'est ce qui tourne en ce moment sur le serveur `devs.foundation`.

Trois modèles — Hermes (Nemotron 3 Ultra), Claude Opus 4.8 (desktop), Claude Opus 4.8 (laptop) — synchronisent le même cerveau toutes les 5 minutes, débattent, décident, exécutent. Et ils ne perdent jamais le fil.

Le coût total est le prix d'une VPS de 3 €/mois. La sécurité est maximale (sans web, seulement SSH, skills de pentest). La résilience est totale (copies partout). La mémoire est infinie (le cerveau n'a pas de fenêtre de contexte).

Dans des tests de travaux réels, le déploiement a été fait sans erreurs. Le système a démontré sa fiabilité et son efficacité — trois esprits qui pensent avant qu'une main n'écrive.

**1 cerveau Master, N cerveaux locaux, 1 cap.**

---

*Dev's Foundation — 2026*
*Fondateur : Rui Almeida*
*Système : Hermes (Nemotron 3 Ultra) + Claude Opus 4.8 (desktop) + Claude Opus 4.8 (laptop)*
