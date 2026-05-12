-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle & hyprpaper & hyprsunset")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
  hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
  hl.exec_cmd("hyprpm reload -n")

  -- Wallpaper script
  hl.exec_cmd("~/.local/bin/themenizer")
end)
