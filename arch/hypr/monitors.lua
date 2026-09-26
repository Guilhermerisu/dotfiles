-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- Unscale XWayland.
hl.config({ xwayland = { force_zero_scaling = true } })

-- Toolkit-specific scale.
hl.env("GDK_SCALE", "1")

hl.monitor({ output = "DP-1", mode = "2560x1440@360", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "3840x2160@60", position = "-1440x0", scale = 1.5, transform = 1 })

hl.workspace_rule({ workspace = "10", monitor = "DP-2", default = true, persistent = true })

-- Good compromise for 27" or 32" 4K monitors (but fractional!)
-- hl.env("GDK_SCALE", "1.75")
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.6 })

-- Straight 1x setup for low-resolution displays like 1080p or 1440p
-- Or for ultrawide monitors like 34" 3440x1440 or 49" 5120x1440
-- hl.env("GDK_SCALE", "1")
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°)
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Example for Framework 13 w/ 6K XDR Apple display
-- hl.monitor({ output = "DP-5", mode = "6016x3384@60", position = "auto", scale = 2 })
-- hl.monitor({ output = "eDP-1", mode = "2880x1920@120", position = "auto", scale = 2 })
