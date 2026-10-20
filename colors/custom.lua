vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "caelus"
vim.o.termguicolors = true
vim.o.background = "dark"

local c = {
  bg       = "#0f0f0f",
  gray0    = "#141514",
  gray1    = "#1e1f1e",
  gray2    = "#272a28",
  gray3    = "#3b403c",
  gray4    = "#585f5b",
  gray5    = "#6c756f",
  gray6    = "#888e7b",
  gray7    = "#9a9c8b",
  gray8    = "#b6b69a",
  gray9    = "#d9cdb5",
  gray10   = "#e3d6c9",
  fg       = "#f4decd",
  red      = "#f16e65",
  lred     = "#ef968f",
  orange   = "#ef934d",
  yellow   = "#efbf71",
  green    = "#7ec97e",
  lgreen   = "#a4daa4",
  cyan     = "#7ec9a3",
  lcyan    = "#abd4bf",
  blue     = "#71b4d6",
  lblue    = "#b0d4e8",
  magenta  = "#e28dc6",
  lmagenta = "#ebadd6",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalNC", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.gray1 })
hi("FloatBorder", { fg = c.gray5, bg = c.gray1 })
hi("FloatTitle", { fg = c.orange, bg = c.gray1, bold = true })

hi("Cursor", { fg = c.bg, bg = c.fg })
hi("lCursor", { fg = c.bg, bg = c.fg })
hi("CursorIM", { fg = c.bg, bg = c.fg })
hi("CursorLine", { bg = c.gray2 })
hi("CursorColumn", { bg = c.gray2 })
hi("CursorLineNr", { fg = c.orange, bg = c.bg, bold = true })
hi("LineNr", { fg = c.gray6, bg = c.bg })
hi("SignColumn", { fg = c.gray6, bg = c.bg })
hi("ColorColumn", { bg = c.gray1 })

hi("Visual", { bg = c.gray3 })
hi("VisualNOS", { bg = c.gray3 })
hi("Search", { fg = c.bg, bg = c.orange })
hi("IncSearch", { fg = c.bg, bg = c.orange, bold = true })
hi("CurSearch", { fg = c.bg, bg = c.yellow, bold = true })
hi("MatchParen", { fg = c.orange, bg = c.gray3, bold = true })

hi("Pmenu", { fg = c.fg, bg = c.gray1 })
hi("PmenuSel", { fg = c.bg, bg = c.orange })
hi("PmenuSbar", { bg = c.gray1 })
hi("PmenuThumb", { bg = c.orange })
hi("WildMenu", { fg = c.bg, bg = c.orange })

hi("StatusLine", { fg = c.fg, bg = c.gray2 })
hi("StatusLineNC", { fg = c.gray6, bg = c.gray0 })
hi("WinSeparator", { fg = c.gray8 })
hi("VertSplit", { fg = c.gray8 })

hi("TabLine", { fg = c.gray6, bg = c.gray1 })
hi("TabLineSel", { fg = c.orange, bg = c.bg, bold = true })
hi("TabLineFill", { bg = c.gray1 })

hi("Folded", { fg = c.gray8, bg = c.gray3 })
hi("FoldColumn", { fg = c.gray6, bg = c.bg })
hi("NonText", { fg = c.gray4 })
hi("SpecialKey", { fg = c.gray4 })
hi("Whitespace", { fg = c.gray3 })
hi("EndOfBuffer", { fg = c.gray4 })
hi("Conceal", { fg = c.gray6 })

hi("Directory", { fg = c.blue })
hi("Title", { fg = c.orange, bold = true })
hi("Question", { fg = c.green })
hi("MoreMsg", { fg = c.green })
hi("ModeMsg", { fg = c.fg })
hi("ErrorMsg", { fg = c.red, bold = true })
hi("WarningMsg", { fg = c.yellow })
hi("MsgArea", { fg = c.fg })
hi("QuickFixLine", { bg = c.gray3, bold = true })

hi("SpellBad", { undercurl = true, sp = c.red })
hi("SpellWarn", { undercurl = true, sp = c.yellow })
hi("SpellCap", { undercurl = true, sp = c.cyan })
hi("SpellLocal", { undercurl = true, sp = c.magenta })

hi("Comment", { fg = c.gray8, italic = true })
hi("String", { fg = c.green })
hi("Character", { fg = c.green })
hi("Number", { fg = c.magenta })
hi("Float", { fg = c.magenta })
hi("Boolean", { fg = c.magenta })
hi("Constant", { fg = c.magenta })

hi("Identifier", { fg = c.blue })
hi("Function", { fg = c.yellow })
hi("Keyword", { fg = c.red })
hi("Statement", { fg = c.red })
hi("Conditional", { fg = c.red })
hi("Repeat", { fg = c.red })
hi("Exception", { fg = c.red })

hi("Operator", { fg = c.gray9 })
hi("PreProc", { fg = c.orange })
hi("Include", { fg = c.orange })
hi("Define", { fg = c.orange })
hi("Macro", { fg = c.orange })

hi("Type", { fg = c.cyan, bold = true })
hi("StorageClass", { fg = c.red })
hi("Structure", { fg = c.cyan, bold = true })
hi("Typedef", { fg = c.cyan, bold = true })

hi("Special", { fg = c.yellow })
hi("SpecialChar", { fg = c.yellow })
hi("Tag", { fg = c.cyan })
hi("Delimiter", { fg = c.gray9 })
hi("SpecialComment", { fg = c.gray8, italic = true })
hi("Debug", { fg = c.red })
hi("Underlined", { fg = c.blue, underline = true })
hi("Error", { fg = c.red, bold = true })
hi("Todo", { fg = c.yellow, bold = true })

hi("@comment", { fg = c.gray8, italic = true })
hi("@string", { fg = c.green })
hi("@string.documentation", { fg = c.green })
hi("@string.escape", { fg = c.yellow })
hi("@string.special", { fg = c.cyan })
hi("@character", { fg = c.green })

hi("@number", { fg = c.magenta })
hi("@float", { fg = c.magenta })
hi("@boolean", { fg = c.magenta })
hi("@constant", { fg = c.magenta })
hi("@constant.builtin", { fg = c.magenta })
hi("@constant.macro", { fg = c.orange })

hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.lred })
hi("@variable.parameter", { fg = c.fg })
hi("@variable.member", { fg = c.fg })
hi("@parameter", { fg = c.fg })

hi("@function", { fg = c.yellow })
hi("@function.builtin", { fg = c.yellow })
hi("@function.call", { fg = c.yellow })
hi("@function.method", { fg = c.yellow })
hi("@function.macro", { fg = c.orange })
hi("@method", { fg = c.yellow })
hi("@method.call", { fg = c.yellow })
hi("@constructor", { fg = c.cyan })

hi("@keyword", { fg = c.red })
hi("@keyword.function", { fg = c.red })
hi("@keyword.operator", { fg = c.red })
hi("@keyword.return", { fg = c.red })
hi("@keyword.import", { fg = c.red })
hi("@conditional", { fg = c.red })
hi("@repeat", { fg = c.red })
hi("@exception", { fg = c.red })
hi("@operator", { fg = c.gray9 })

hi("@punctuation.bracket", { fg = c.gray9 })
hi("@punctuation.delimiter", { fg = c.gray9 })
hi("@punctuation.special", { fg = c.cyan })

hi("@type", { fg = c.cyan })
hi("@type.builtin", { fg = c.cyan })
hi("@type.definition", { fg = c.cyan })
hi("@namespace", { fg = c.fg })
hi("@module", { fg = c.fg })
hi("@field", { fg = c.fg })
hi("@property", { fg = c.fg })
hi("@attribute", { fg = c.orange })
hi("@tag", { fg = c.cyan })
hi("@tag.attribute", { fg = c.fg })
hi("@tag.delimiter", { fg = c.gray9 })

hi("@text", { fg = c.fg })
hi("@text.title", { fg = c.orange, bold = true })
hi("@text.emphasis", { fg = c.fg, italic = true })
hi("@text.strong", { fg = c.fg, bold = true })
hi("@text.uri", { fg = c.blue, underline = true })
hi("@text.literal", { fg = c.green })
hi("@text.reference", { fg = c.magenta })
hi("@text.todo", { fg = c.yellow, bold = true })
hi("@text.warning", { fg = c.orange })
hi("@text.danger", { fg = c.red })

vim.g.terminal_color_0 = c.bg
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.fg
vim.g.terminal_color_8 = c.gray4
vim.g.terminal_color_9 = c.lred
vim.g.terminal_color_10 = c.lgreen
vim.g.terminal_color_11 = c.orange
vim.g.terminal_color_12 = c.lblue
vim.g.terminal_color_13 = c.lmagenta
vim.g.terminal_color_14 = c.lcyan
vim.g.terminal_color_15 = c.gray10
