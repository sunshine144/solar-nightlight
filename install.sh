#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing solar-nightlight..."

# 1. Install binary
mkdir -p ~/.local/bin
cp bin/solar-nightlight ~/.local/bin/solar-nightlight
chmod +x ~/.local/bin/solar-nightlight

# 2. Install systemd user service
mkdir -p ~/.config/systemd/user
cp systemd/solar-nightlight.service ~/.config/systemd/user/solar-nightlight.service

# 3. Reload and enable service
systemctl --user daemon-reload
systemctl --user enable --now solar-nightlight.service

echo "==> solar-nightlight successfully installed and started!"
echo "==> Check status with: solar-nightlight --status"
