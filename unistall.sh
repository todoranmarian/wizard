#!/usr/bin/env bash
set -euo pipefail

log() {
  echo "[wizard-uninstall] $1"
}

INSTALL_BIN_DIR="$HOME/.local/bin"
COMPLETION_DIR="$HOME/.local/share/bash-completion/completions"
MAN_DIR="$HOME/.local/share/man/man1"

main() {
  log "Removing wizard binary and commands..."
  rm -f "$INSTALL_BIN_DIR/wizard"
  rm -f "$INSTALL_BIN_DIR/summon-idea"
  rm -f "$INSTALL_BIN_DIR/summon-rider"
  rm -f "$INSTALL_BIN_DIR/summon-vs"

  log "Removing bash completion..."
  rm -f "$COMPLETION_DIR/wizard"

  log "Removing man page..."
  rm -f "$MAN_DIR/wizard.1.gz"

  log "Wizard uninstall complete."
}

main "$@"
