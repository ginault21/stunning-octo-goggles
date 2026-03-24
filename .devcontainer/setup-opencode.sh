#!/bin/bash
set -e

CONFIG_DIR="/home/codespace/.config/opencode"
CONFIG_FILE="${CONFIG_DIR}/config.json"
TEMPLATE_FILE=".devcontainer/opencode-config.template.json"

echo "[opencode] Setting up configuration..."
mkdir -p "$CONFIG_DIR"

if [ -z "$OPENCODE_ACCESS_TOKEN" ]; then
  echo "[opencode] ERROR: OPENCODE_ACCESS_TOKEN is not set."
  exit 1
fi

envsubst '$OPENCODE_ACCESS_TOKEN' < "$TEMPLATE_FILE" > "$CONFIG_FILE"
echo "[opencode] Setup complete."
