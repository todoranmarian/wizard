#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
LIB_DIR="$INSTALL_DIR/lib"
COMPLETIONS_DIR="$INSTALL_DIR/completions"

echo "[wizard] Upgrading Wizard…"

# Ensure directories exist
mkdir -p "$INSTALL_DIR"
mkdir -p "$LIB_DIR"
mkdir -p "$COMPLETIONS_DIR"

# Overwrite main script
cp wizard "$INSTALL_DIR/wizard"
chmod +x "$INSTALL_DIR/wizard"

# Overwrite commands
cp commands/* "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR"/summon-*

# Overwrite shared library
cp lib/* "$LIB_DIR/"

# Overwrite autocomplete
cp completions/wizard "$COMPLETIONS_DIR/wizard"

echo "[wizard] Upgrade complete."
