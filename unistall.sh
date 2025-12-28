#!/usr/bin/env bash
set -euo pipefail

log() {
  echo "[wizard-uninstall] $1"
}

INSTALL_DIR="$HOME/.local/bin/wizard"
ENTRYPOINT="$HOME/.local/bin/wizard"
COMPLETION_DIR="$HOME/.local/share/bash-completion/completions"
MAN_DIR="$HOME/.local/share/man/man1"

main() {
  log "Removing Wizard installation directory..."
  rm -rf "$INSTALL_DIR"

  log "Removing Wizard entrypoint..."
  rm -f "$ENTRYPOINT"

  log "Removing bash completion..."
  rm -f "$COMPLETION_DIR/wizard"

  log "Removing man page..."
  rm -f "$MAN_DIR/wizard.1.gz"

  log "Wizard uninstall complete."
}

main "$@"
