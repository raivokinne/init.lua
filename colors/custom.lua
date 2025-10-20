local colorbuddy = require('colorbuddy')
colorbuddy.colorscheme("custom")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local colors = colorbuddy.colors
local groups = colorbuddy.groups
local styles = colorbuddy.styles

-- Colors
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

-- Base groups
Group.new("Normal", colors.superwhite, colors.background, styles.None)
Group.new("NormalFloat", colors.superwhite, colors.background, styles.italic)
Group.new("NonText", colors.gray2, colors.background, styles.italic)

-- Status line
Group.new("StatusLine", colors.background, colors.lightblue, styles.NONE)
Group.new("StatusLineNC", colors.background, colors.lightblue:dark(), styles.NONE)

-- Line numbers & columns
Group.new("LineNr", colors.seagreen, colors.background)
Group.new("CursorLineNr", colors.yellow, colors.background, styles.bold)
Group.new("SignColumn", colors.seagreen, colors.background)
Group.new("ColorColumn", nil, colors.gray2)

-- Cursor
Group.new("Cursor", colors.background, colors.lightblue)
Group.new("CursorLine", nil, colors.gray2:dark())
Group.new("CursorColumn", nil, colors.gray2:dark())

-- Search
Group.new("Search", colors.background, colors.yellow)
Group.new("IncSearch", colors.background, colors.orange, styles.bold)
Group.new("Substitute", colors.background, colors.red)

-- Visual mode
Group.new('Visual', colors.background, colors.blue, styles.italic)
Group.new('VisualNOS', colors.background, colors.blue:dark())

-- Popup menu
Group.new('Pmenu', colors.superwhite, colors.background, styles.italic)
Group.new('PmenuSel', colors.background, colors.lightblue, styles.italic)
Group.new('PmenuThumb', colors.lightblue, colors.background, styles.italic)
Group.new('PmenuSbar', colors.gray2, colors.background, styles.italic)
Group.new('PmenuExtra', colors.lightblue, colors.background, styles.italic)
Group.new('PmenuKind', colors.purple, colors.background, styles.italic)

-- Syntax groups
Group.new('Comment', colors.seagreen, nil, styles.italic)
Group.new('Constant', colors.orange, nil)
Group.new('String', colors.green, nil)
Group.new('Character', colors.green, nil)
Group.new('Number', colors.orange, nil)
Group.new('Boolean', colors.orange, nil)
Group.new('Float', colors.orange, nil)

Group.new('Identifier', colors.red, nil)
Group.new('Function', colors.lightblue, colors.background, styles.bold)
Group.new('Statement', colors.purple, nil)
Group.new('Conditional', colors.purple, nil)
Group.new('Repeat', colors.purple, nil)
Group.new('Label', colors.yellow, nil)
Group.new('Operator', colors.turquoise, nil)
Group.new('Keyword', colors.violet, nil, styles.bold)
Group.new('Exception', colors.red, nil)

Group.new('PreProc', colors.yellow, nil)
Group.new('Include', colors.blue, nil)
Group.new('Define', colors.purple, nil)
Group.new('Macro', colors.red, nil)
Group.new('PreCondit', colors.yellow, nil)

Group.new('Type', colors.yellow, nil)
Group.new('StorageClass', colors.yellow, nil)
Group.new('Structure', colors.yellow, nil)
Group.new('Typedef', colors.yellow, nil)

Group.new('Special', colors.blue, nil)
Group.new('SpecialChar', colors.orange, nil)
Group.new('Tag', colors.red, nil)
Group.new('Delimiter', colors.brown, nil)
Group.new('SpecialComment', colors.seagreen:light(), nil, styles.italic)
Group.new('Debug', colors.red, nil)

-- Text emphasis
Group.new('Underlined', colors.blue, nil, styles.underline)
Group.new('Bold', nil, nil, styles.bold)
Group.new('Italic', nil, nil, styles.italic)

Group.new('Error', colors.red:light(), nil, styles.bold)
Group.new('ErrorMsg', colors.red:light(), colors.background, styles.bold)
Group.new('WarningMsg', colors.yellow, colors.background, styles.bold)
Group.new('Todo', colors.purple, colors.background, styles.bold)

-- Diff
Group.new('DiffAdd', colors.green:dark(), colors.background)
Group.new('DiffChange', colors.yellow:dark(), colors.background)
Group.new('DiffDelete', colors.red:dark(), colors.background)
Group.new('DiffText', colors.blue, colors.background, styles.bold)

-- Git signs
Group.new('GitSignsAdd', colors.green, colors.background)
Group.new('GitSignsChange', colors.yellow, colors.background)
Group.new('GitSignsDelete', colors.red, colors.background)

-- Folding
Group.new('Folded', colors.seagreen, colors.gray2:dark())
Group.new('FoldColumn', colors.seagreen, colors.background)

-- Tabs & special chars
Group.new('TabLine', colors.gray2, colors.background)
Group.new('TabLineFill', nil, colors.background)
Group.new('TabLineSel', colors.background, colors.lightblue)
Group.new('SpecialKey', colors.gray2, nil)
Group.new('Whitespace', colors.gray2, nil)

-- LSP
Group.new('LspSignatureActiveParameter', colors.yellow, colors.background, styles.italic)
Group.new('LspReferenceText', nil, colors.gray2:dark())
Group.new('LspReferenceRead', nil, colors.gray2:dark())
Group.new('LspReferenceWrite', nil, colors.gray2:dark())

-- Diagnostics
Group.new('DiagnosticError', colors.red, nil)
Group.new('DiagnosticWarn', colors.yellow, nil)
Group.new('DiagnosticInfo', colors.blue, nil)
Group.new('DiagnosticHint', colors.turquoise, nil)

Group.new('DiagnosticUnderlineError', nil, nil, styles.underline)
Group.new('DiagnosticUnderlineWarn', nil, nil, styles.underline)
Group.new('DiagnosticUnderlineInfo', nil, nil, styles.underline)
Group.new('DiagnosticUnderlineHint', nil, nil, styles.underline)

-- Treesitter
Group.new('@variable', colors.superwhite, nil)
Group.new('@constant', colors.orange, nil)
Group.new('@function', colors.lightblue, nil, styles.bold)
Group.new('@keyword', colors.violet, nil, styles.bold)
Group.new('@string', colors.green, nil)
Group.new('@comment', colors.seagreen, nil, styles.italic)
Group.new('@type', colors.yellow, nil)
Group.new('@parameter', colors.red:light(), nil)
Group.new('@property', colors.red, nil)

-- Custom groups (from your original)
Group.new('italicBoldFunction', colors.green, groups.Function, styles.NONE + styles.NONE)
Group.new('boldFunction', colors.yellow, colors.background, groups.italicBoldFunction - styles.NONE)
