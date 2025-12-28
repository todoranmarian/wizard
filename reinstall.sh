#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"

echo "[wizard] Reinstalling Wizard…"

# Remove old files but keep config
rm -f "$INSTALL_DIR/wizard"
rm -f "$INSTALL_DIR"/summon-*
rm -rf "$INSTALL_DIR/lib"
rm -rf "$INSTALL_DIR/completions"

# Run installer
bash install.sh

echo "[wizard] Reinstall complete."
