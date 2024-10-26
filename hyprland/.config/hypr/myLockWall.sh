#!/bin/bash

currentWal=$(swww query | grep "image" | awk -F'image: ' '{print $2}' | sed -n '2p')

sed -i "s|path =.*|path = $currentWal|" "$HOME/.DotFiles/hyprland/.config/hypr/hyprlock.conf"

hyprlock
