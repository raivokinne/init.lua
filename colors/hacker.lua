local colorbuddy = require('colorbuddy')

colorbuddy.colorscheme("hacker")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local colors = colorbuddy.colors
local groups = colorbuddy.groups
local styles = colorbuddy.styles

Color.new('background', '#0a0a0a')
Color.new('green', '#9aff6b')
Color.new('darkgreen', '#4e9a06')
Color.new('softgreen', '#7ec97e')
Color.new('warmgreen', '#a8d080')
Color.new('highlight', '#98c379')
Color.new('text', '#b4f0a7')
Color.new('accent', '#7fbf5f')
Color.new('shadow', '#1a1f14')
Color.new('terminal', '#7fd387')
Color.new('glow', '#8be08b')
Color.new('amber', '#d4b16a')

Group.new("Normal", colors.text, colors.background)
Group.new("StatusLine", colors.text, colors.darkgreen, styles.bold)
Group.new("StatusLineNC", colors.text, colors.shadow, styles.NONE)
Group.new("LineNr", colors.softgreen, colors.background)
Group.new("Visual", colors.none, colors.shadow)
Group.new("Search", colors.background, colors.amber, styles.bold)

Group.new("Function", colors.highlight, colors.background, styles.bold)
Group.new("Keyword", colors.green, colors.background, styles.bold)
Group.new("String", colors.softgreen, colors.background)
Group.new("Number", colors.glow, colors.background)
Group.new("Boolean", colors.accent, colors.background)
Group.new("Type", colors.warmgreen, colors.background, styles.bold)
Group.new("Constant", colors.highlight, colors.background)
Group.new("Identifier", colors.text, colors.background)
Group.new("Comment", colors.darkgreen, colors.background, styles.italic)
Group.new("Operator", colors.green, colors.background)
Group.new("Statement", colors.highlight, colors.background)
Group.new("PreProc", colors.accent, colors.background)
Group.new("Special", colors.amber, colors.background)
Group.new("Error", colors.amber, colors.background, styles.bold)
Group.new("Todo", colors.background, colors.accent, styles.bold)

Group.new("DiagnosticError", colors.amber, colors.background)
Group.new("DiagnosticWarn", colors.warmgreen, colors.background)
Group.new("DiagnosticInfo", colors.softgreen, colors.background)
Group.new("DiagnosticHint", colors.accent, colors.background)

Group.new("luaFunctionCall", groups.Function, groups.Function, groups.Function)
Group.new("italicBoldFunction", colors.softgreen, groups.Function, styles.bold)
Group.new("boldFunction", colors.highlight, colors.background, styles.bold)
Group.new("Conditional", colors.amber, colors.background, styles.bold)
Group.new("Repeat", colors.accent, colors.background, styles.bold)

Group.new("Pmenu", colors.text, colors.shadow)
Group.new("PmenuSel", colors.text, colors.darkgreen, styles.bold)
Group.new("PmenuThumb", colors.background, colors.highlight)
Group.new("VertSplit", colors.darkgreen, colors.background)
Group.new("TabLineSel", colors.highlight, colors.background, styles.bold)
Group.new("TabLine", colors.darkgreen, colors.background)
Group.new("TabLineFill", colors.background, colors.background)
