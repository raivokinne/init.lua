local colorbuddy = require('colorbuddy')

colorbuddy.colorscheme("custom")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local colors = colorbuddy.colors
local groups = colorbuddy.groups
local styles = colorbuddy.styles

Color.new('background', '#000000')
Color.new('red', '#cc6666')
Color.new('green', '#fff0f5')
Color.new('yellow', '#f0c674')
Color.new('lightblue', '#b0c4de')
Color.new("blue", "#00aae4")
Color.new("violet", "#b294bb")
Color.new("purple", "#b19cd9")
Color.new("orange", "#ffdab9")
Color.new("brown", "#cd853f")
Color.new("seagreen", "#698b69")
Color.new("turquoise", "#698b69")

Group.new("Normal", colors.superwhite, colors.background, styles.italic)
Group.new("StatusLine", colors.background, colors.lightblue, styles.NONE)
Group.new("StatusLineNC", colors.background, colors.lightblue:dark(), styles.NONE)
Group.new("LineNr", colors.gray2, colors.background)
Group.new('Function', colors.yellow, colors.background, styles.bold)
Group.new('Error', colors.red:light(), nil, styles.bold)
Group.new('italicBoldFunction', colors.green, groups.Function, styles.NONE + styles.NONE)
Group.new('boldFunction', colors.yellow, colors.background, groups.italicBoldFunction - styles.NONE)

Group.new('Pmenu', colors.superwhite, colors.background, styles.italic)
Group.new('PmenuSel', colors.background, colors.lightblue, styles.italic)
Group.new('PmenuThumb', colors.lightblue, colors.background, styles.italic)
Group.new('PmenuSbar', colors.gray2, colors.background, styles.italic)
Group.new('PmenuExtra', colors.lightblue, colors.background, styles.italic)
Group.new('PmenuKind', colors.purple, colors.background, styles.italic)
Group.new('NonText', colors.gray2, colors.background, styles.italic)
Group.new('NormalFloat', colors.superwhite, colors.background, styles.italic)
Group.new('Visual', colors.background, colors.blue, styles.italic)
Group.new('LspSignatureActiveParameter', colors.yellow, colors.background, styles.italic)
