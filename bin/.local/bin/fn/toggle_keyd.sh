#!/usr/bin/env bash

# Add this script as a system shortcut and bind
# to some key combination.
# At the moment I use `Meta+Shift+K`.

if [[ "$(systemctl show -p SubState --value keyd)" == "running" ]]; then
  if ! pkexec systemctl stop keyd; then
    notify-send "Failed to stop keyd" "Permission denied or service error."
    exit 1
  fi
else
  if ! pkexec systemctl start --now keyd; then
    notify-send "Failed to start keyd" "Permission denied or service error."
    exit 1
  fi
fi

