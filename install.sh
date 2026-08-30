#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing hyprsunset-solar..."

# 1. Install binary
mkdir -p ~/.local/bin
cp bin/hyprsunset-solar ~/.local/bin/hyprsunset-solar
chmod +x ~/.local/bin/hyprsunset-solar

# 2. Install systemd user service
mkdir -p ~/.config/systemd/user
cp systemd/hyprsunset-solar.service ~/.config/systemd/user/hyprsunset-solar.service

# 3. Reload and enable service
systemctl --user daemon-reload
systemctl --user enable --now hyprsunset-solar.service

echo "==> hyprsunset-solar successfully installed and started!"
echo "==> Check status with: hyprsunset-solar --status"
