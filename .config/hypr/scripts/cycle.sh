#!/bin/bash

# Get information about all workspaces
workspaces_info=$(hyprctl workspaces -j)

# Get the ID and monitor of the currently active workspace
current_active_workspace_id=$(hyprctl activeworkspace -j | jq '.id')
current_active_workspace_monitor=$(hyprctl activeworkspace -j | jq -r '.monitor')

# Filter for occupied workspaces on the same monitor as the active workspace,
# then extract their IDs and sort them numerically.
occupied_workspaces_on_same_monitor=$(echo "$workspaces_info" | \
  jq -r --arg current_monitor "$current_active_workspace_monitor" \
  '.[] | select(.monitor == $current_monitor and .windows > 0) | .id' | sort -n)

next_workspace=""
found_current=false

# Iterate through the sorted occupied workspaces on the same monitor
for ws in $occupied_workspaces_on_same_monitor; do
  if [[ "$found_current" == "true" ]]; then
    next_workspace="$ws"
    break
  fi
  if [[ "$ws" == "$current_active_workspace_id" ]]; then
    found_current=true
  fi
done

# If no next occupied workspace is found on the same monitor (i.e., we were at the last one),
# wrap around to the first occupied workspace on that monitor.
if [[ -z "$next_workspace" ]]; then
  next_workspace=$(echo "$occupied_workspaces_on_same_monitor" | head -n 1)
fi

# Switch to the next occupied workspace if one was found
if [[ -n "$next_workspace" ]]; then
  hyprctl dispatch workspace "$next_workspace"
fi
