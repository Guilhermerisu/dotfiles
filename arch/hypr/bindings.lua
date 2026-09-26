-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.
-- See current bindings and descriptions:
--   omarchy menu keybindings --print
-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false
-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + ALT + SPACE")
hl.unbind("SUPER + SHIFT + G")
hl.unbind("SUPER + CTRL + V")
hl.unbind("SUPER + SHIFT + C")

o.bind("SUPER + SHIFT + C", "Clipboard", "omarchy-shell shell toggle omarchy.clipboard")
o.bind("SUPER + SPACE", "App launcher", "omarchy-menu toggle apps")
o.bind("SUPER + ALT + SPACE", "Omarchy menu", "omarchy-menu toggle root")
o.bind("SUPER + E", "File manager", "uwsm-app -- nautilus --new-window")
o.bind("SUPER + SHIFT + G", "Claude", 'omarchy-launch-webapp "https://claude.ai/new"')
o.bind("SUPER + SHIFT + T", "Todoist", 'omarchy-launch-webapp "https://app.todoist.com/app/today"')
o.bind("SUPER + F9", nil, "hyprctl hyprsunset temperature 3000")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")
