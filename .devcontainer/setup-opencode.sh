#!/bin/bash
# Ensure the config directory exists
mkdir -p /home/codespace/.config/opencode/

# Use envsubst to replace $OPENCODE_ACCESS_TOKEN with the actual secret
# Assuming the secret is available as an environment variable in the Codespace
envsubst '$OPENCODE_ACCESS_TOKEN' < /workspaces/stunning-octo-goggles/badlands/.devcontainer/opencode-config.template.json > /home/codespace/.config/opencode/config.json
