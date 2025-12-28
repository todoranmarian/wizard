#!/usr/bin/env bash
set -euo pipefail

log() {
  echo "[wizard-install] $1"
}

INSTALL_BIN_DIR="$HOME/.local/bin"
COMPLETION_DIR="$HOME/.local/share/bash-completion/completions"
MAN_DIR="$HOME/.local/share/man/man1"

main() {
  log "Starting Wizard installation..."

  mkdir -p "$INSTALL_BIN_DIR" "$COMPLETION_DIR" "$MAN_DIR"

  log "Installing shared library..."
  mkdir -p "$INSTALL_BIN_DIR/lib"
  cp -r lib/* "$INSTALL_BIN_DIR/lib/"

  log "Installing main 'wizard' script..."
  cp "wizard" "$INSTALL_BIN_DIR/wizard"
  chmod +x "$INSTALL_BIN_DIR/wizard"

  log "Installing commands..."
  for cmd in commands/*; do
    base="$(basename "$cmd")"
    cp "$cmd" "$INSTALL_BIN_DIR/$base"
    chmod +x "$INSTALL_BIN_DIR/$base"
  done

  log "Installing bash completion..."
  cp "completions/wizard" "$COMPLETION_DIR/wizard"

  log "Ensuring bash completion is sourced..."
  if ! grep -q "source $COMPLETION_DIR/wizard" "$HOME/.bashrc"; then
    echo "source $COMPLETION_DIR/wizard" >> "$HOME/.bashrc"
    log "Added completion sourcing to ~/.bashrc"
  else
    log "Completion already sourced in ~/.bashrc"
  fi

  log "Installing man page..."
  cp "man/wizard.1" "$MAN_DIR/wizard.1"
  gzip -f "$MAN_DIR/wizard.1"

  if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
    log "Adding ~/.local/bin to PATH in ~/.bashrc"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
  else
    log "~/.local/bin already in PATH."
  fi

  log "Installation complete."
  log "Restart your terminal or run: source ~/.bashrc"
}

main "$@"
