#!/bin/bash
niri msg -j workspaces | jq -r 'sort_by(.idx) | map(select(.is_focused or .active_window_id != null) | if .is_focused then "<span color=\"#cba6f7\">" + (.idx | tostring) + "</span>" else (.idx | tostring) end) | join("  ")'
