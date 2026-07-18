-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Colors

-- local colors = require("colors.colors-matugen")

-- Main Modules
require("modules.autostart")
require("modules.binds")
require("modules.config")
require("modules.decorations")
require("modules.env")
require("modules.input")
require("modules.layout")
require("modules.misc")
require("modules.monitors")
require("modules.permissions")
require("modules.windowrules")

-- Custom Modules
require("modules.custom.binds")
require("modules.custom.windowrules")

-- Plugins
require("plugins.dynamic_cursor")
