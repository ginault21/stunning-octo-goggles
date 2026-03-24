#!/bin/bash
# OpenCode configuration setup script for GitHub Codespaces
# This script runs on container creation and injects the OpenCode API token

set -e

CONFIG_DIR="/home/codespace/.config/opencode"
CONFIG_FILE="${CONFIG_DIR}/config.json"
TEMPLATE_FILE="$(dirname "$0")/opencode-config.template.json"

echo "[opencode] Setting up OpenCode configuration..."

mkdir -p "$CONFIG_DIR"

if [ -z "$OPENCODE_ACCESS_TOKEN" ]; then
  echo "[opencode] ERROR: OPENCODE_ACCESS_TOKEN environment variable is not set."
  echo "[opencode] Ensure the secret is mapped in devcontainer.json remoteEnv."
  exit 1
fi

envsubst '$OPENCODE_ACCESS_TOKEN' < "$TEMPLATE_FILE" > "$CONFIG_FILE"

if grep -q '\$OPENCODE_ACCESS_TOKEN' "$CONFIG_FILE"; then
  echo "[opencode] ERROR: Token placeholder not replaced. Check envsubst installation."
  exit 1
fi

echo "[opencode] Configuration written to $CONFIG_FILE"
echo "[opencode] Setup complete!"
