-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- TRANSLATED HYPRLAND LUA CONFIG.                       --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

------------------
---- MONITORS ----
------------------
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "alacritty"
local fileManager = "thunar"
local menu = "rofi -show run"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("elephant")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("swayosd-server")
	hl.exec_cmd("dunst")
	hl.exec_cmd("walker --gapplication-service")
	hl.exec_cmd("hyprctl setcursor GoogleDot-Black 24")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user start gvfs-udisks2-volume-monitor")
	hl.exec_cmd("hypridle")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- Force GTK and Qt to drop window decorations and headerbars
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("GTK_CSD", "0")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "GoogleDot-Black")
hl.env("HYPRCURSOR_THEME", "GoogleDot-Black")
hl.env("TERMINAL", "alacritty")
-----------------------
----- PERMISSIONS -----
-----------------------
hl.permission("/usr/bin/wf-recorder", "screencopy", "allow")
hl.permission("/usr/bin/slurp", "screencopy", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 10,
		border_size = 2,

		col = {
			active_border = "rgba(16A9A0FF)",
			inactive_border = "rgba(201,201,216,0.66)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 3,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 0.93,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- animations
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-----------------
---- LAYOUTS ----
-----------------
hl.config({
	master = {
		new_status = "master",
	},
})

----------------
----  MISC  ----
----------------
hl.config({
	misc = {
		force_default_wallpaper = 0,
		session_lock_xray = true,
		disable_hyprland_logo = true,
	},
})

---------------
---- INPUT ----
---------------
hl.config({
	input = {
		kb_layout = "hu",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		accel_profile = "flat",
		sensitivity = 0.25,

		touchpad = {
			disable_while_typing = false,
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
-- Force system suspend when the laptop lid closes
bindl = { "", "switch:on:Lid Switch", "exec", "systemctl suspend" }
---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

-- app & utility binds
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd('wf-recorder -g "$(slurp)" -f ~/Videos/recording.mp4'))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("killall -s SIGINT wf-recorder"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + 0", hl.dsp.exec_cmd(terminal .. " -e btop"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd("~/.local/bin/ocr-screen.sh"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("hyprctl reload waybar"))

-- move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- move windows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- switch workspaces
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
-- hl.bind(mainMod .. " + Ö",         hl.dsp.focus({ workspace = 10 }))
-- hl.bind(mainMod .. " + SHIFT + Ö", hl.dsp.window.move({ workspace = 10 }))

-- special workspace
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- mouse workspace scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- mouse drag/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- multimedia keys
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true })

hl.bind("Caps_Lock", hl.dsp.exec_cmd("swayosd-client --caps-lock"), { release = true })
