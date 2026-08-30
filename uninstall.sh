#!/usr/bin/env bash
set -euo pipefail

echo "==> Uninstalling hyprsunset-solar..."

systemctl --user disable --now hyprsunset-solar.service 2>/dev/null || true
rm -f ~/.config/systemd/user/hyprsunset-solar.service
rm -f ~/.local/bin/hyprsunset-solar
systemctl --user daemon-reload

echo "==> hyprsunset-solar successfully uninstalled."
