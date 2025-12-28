# 🧙‍♂️ Wizard — Your Developer Spellbook

Wizard is a lightweight command‑line spellbook that lets you **summon your IDEs** with a single incantation.

No more clicking through menus.
Just clean, elegant command‑line magic.

```bash
wizard summon idea .
wizard summon rider ~/projects/app
wizard summon vs MySolution.sln
```

Wizard is designed to be:
* Practical — saves time every day
* Minimal — no dependencies
* Extensible — add your own spells
* Predictable — fully configurable 
* Cross‑platform — macOS, Linux, WSL, Git Bash on Windows

## ✨ Features
* Summon IntelliJ IDEA, Rider, or Visual Studio / VS Code
* Interactive configuration wizard (wizard configure)
* Config‑driven IDE paths stored in ~/.wizard/config
* Autocomplete support for commands, summon targets, and directories
* Upgrade & reinstall commands
* Man page included
* Modular spell architecture
* Shared library for reusable logic
* Zero guessing — Wizard uses your configured paths

## 🧙 Installation

Run this incantation from GitHub:
```bash
curl -s https://raw.githubusercontent.com/todoranmarian/wizard/master/install.sh | bash
```
Then restart your terminal or run:
```bash
source ~/.bashrc
```

Wizard installs into: `~/.local/bin/` and automatically configures:
* summon commands
* shared library
* autocomplete
* man pages

## ⚙️ First‑Time Setup
Before summoning anything, run:
```bash
wizard configure
```
Wizard will guide you through setting paths. Empty values mean the IDE is not installed and will be skipped.

Your configuration is stored in:`~/.wizard/config`

## 🛠️ Upgrading Wizard
After pulling new changes from your repo:
```bash
wizard upgrade
```

Or manually:
```bash
bash upgrade.sh
```

This updates:
* main script
* summon commands
* shared library
* autocomplete script

**Your config is preserved.**

## 🔁 Reinstalling Wizard
If something breaks:
```bash
wizard reinstall
```

Or manually:
```bash
bash reinstall.sh
```

This wipes old binaries but keeps your config.

## 🧹 Uninstall
If you ever wish to banish Wizard:
```bash
wizard uninstall
```

Or manually remove:
```
~/.local/bin/wizard
~/.local/bin/summon-*
~/.local/bin/lib/
~/.local/bin/completions/wizard
~/.wizard/config
```

## 📜 Usage
Summon an IDE:
`wizard summon <target> <path>`

Targets:
* idea — IntelliJ IDEA
* rider — JetBrains Rider
* vs — Visual Studio / VS Code

## 🔮 Autocomplete
Wizard includes a dynamic Bash completion script that supports:
* top‑level commands
* summon targets
* directory completion
* partial‑word completion

### _Powered by AI and a creative mind_ 😁