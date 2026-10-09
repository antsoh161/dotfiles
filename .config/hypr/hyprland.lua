hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia -d")
    hl.exec_cmd("alacritty")
end)

hl.on("config.reloaded", function()
    hl.exec_cmd("hyprctl dispatch submap global")
end)

require("hyprland.general")
require("hyprland.keybinds")
require("monitors")
require("workspaces")
