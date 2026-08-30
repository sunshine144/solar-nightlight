#!/usr/bin/env bash
set -euo pipefail

echo "==> Uninstalling solar-nightlight..."

systemctl --user disable --now solar-nightlight.service 2>/dev/null || true
rm -f ~/.config/systemd/user/solar-nightlight.service
rm -f ~/.local/bin/solar-nightlight
systemctl --user daemon-reload

echo "==> solar-nightlight successfully uninstalled."
