#!/usr/bin/env bash
set -ux

export XCURSOR_SIZE=24
export XCURSOR_THEME="capitaine-cursors-white"

# load env vars
systemctl --user import-environment

# run hyprland
systemd-cat --identifier=hyprland Hyprland

# terminate user session upon sway exit
systemctl --user stop graphical-session.target
loginctl terminate-user $UID
