local utils = require("utils")
local palette = require("palette")

local Solarized = {}

Solarized.palette = palette

local mix_with_dark_bg = utils.mix_with(Solarized.palette.base03)
local mix_with_light_bg = utils.mix_with(Solarized.palette.base3)

-- extra base colors
Solarized.palette.base04 = "#001217"
Solarized.palette.base4 = "#fdf6e3"

-- extra offset colors
Solarized.palette.yellow_bg_darker = mix_with_dark_bg(Solarized.palette.yellow, 0.7)
Solarized.palette.yellow_bg_lighter = mix_with_light_bg(Solarized.palette.yellow, 0.7)
Solarized.palette.red_bg_darker = mix_with_dark_bg(Solarized.palette.red, 0.8)
Solarized.palette.red_bg_lighter = mix_with_light_bg(Solarized.palette.red, 0.7)
Solarized.palette.cyan_darker = mix_with_dark_bg(Solarized.palette.cyan, 0.4)
Solarized.palette.cyan_lighter = mix_with_light_bg(Solarized.palette.cyan, 0.4)
Solarized.palette.green_bg_darker = mix_with_dark_bg(Solarized.palette.green, 0.85)
Solarized.palette.green_bg_lighter = mix_with_light_bg(Solarized.palette.green, 0.7)

Solarized.get_colors = function()
  local bg = vim.o.background
  local colors = {
    light = {
      bg0 = Solarized.palette.base3, -- background
      bg1 = Solarized.palette.base2, -- background highlights
      bg2 = Solarized.palette.base4,
      fg0 = Solarized.palette.base00, -- primary content
      fg1 = Solarized.palette.base1, -- comments/secondary content
      fg3 = Solarized.palette.base01, -- emphasis
      yellow = Solarized.palette.yellow,
      orange = Solarized.palette.orange,
      red = Solarized.palette.red,
      magenta = Solarized.palette.magenta,
      violet = Solarized.palette.violet,
      blue = Solarized.palette.blue,
      cyan = Solarized.palette.cyan,
      green = Solarized.palette.green,
      red_bg = Solarized.palette.red_bg_lighter,
      yellow_bg = Solarized.palette.yellow_bg_lighter,
      green_bg = Solarized.palette.green_bg_lighter,
      string_delimiter = Solarized.palette.cyan_lighter,
      none = "NONE",
    },
    dark = {
      bg0 = Solarized.palette.base03,
      bg1 = Solarized.palette.base02,
      bg2 = Solarized.palette.base04,
      fg0 = Solarized.palette.base0,
      fg1 = Solarized.palette.base01,
      fg3 = Solarized.palette.base1,
      yellow = Solarized.palette.yellow,
      orange = Solarized.palette.orange,
      red = Solarized.palette.red,
      magenta = Solarized.palette.magenta,
      violet = Solarized.palette.violet,
      blue = Solarized.palette.blue,
      cyan = Solarized.palette.cyan,
      green = Solarized.palette.green,
      red_bg = Solarized.palette.red_bg_darker,
      yellow_bg = Solarized.palette.yellow_bg_darker,
      green_bg = Solarized.palette.green_bg_darker,
      string_delimiter = Solarized.palette.cyan_darker,
      none = "NONE",
    },
  }

  return colors[bg]
end

local default_opts = {
  transparency = false,
}

Solarized.setup = function(opts)
  vim.g.color_name = "solarized"

  local config = vim.tbl_extend("force", default_opts, opts or {})
  local colors = Solarized.get_colors()
  local hi = vim.api.nvim_set_hl

  vim.g.colors_name = Solarized.name
  vim.cmd("highlight clear")

  hi(0, "Normal", { fg = colors.fg0, bg = config.transparency and colors.none or colors.bg0 })
  hi(0, "NormalNC", { fg = colors.fg0, bg = colors.bg0 })
  hi(0, "SignColumn", { fg = colors.fg1, bg = colors.bg0 })
  hi(0, "EndOfBuffer", { fg = colors.red })
  hi(0, "NormalFloat", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "FloatBorder", { fg = colors.fg1, bg = colors.bg1 })
  hi(0, "ColorColumn", { bg = colors.bg1 })
  hi(0, "Conceal", { fg = colors.blue })
  hi(0, "Cursor", { bg = colors.bg1 })
  hi(0, "CursorIM", { bg = colors.bg1 })
  hi(0, "CursorLineNr", { fg = colors.yellow, bg = colors.bg2 })
  hi(0, "vCursor", { link = "Cursor" })
  hi(0, "iCursor", { link = "Cursor" })
  hi(0, "lCursor", { link = "Cursor" })
  hi(0, "LineNr", { fg = colors.fg1 })
  hi(0, "Directory", { fg = colors.blue, bold = true })
  hi(0, "DiffAdd", { fg = colors.green, bg = colors.green_bg })
  hi(0, "DiffChange", { fg = colors.yellow, bg = colors.yellow_bg })
  hi(0, "DiffDelete", { fg = colors.red, bg = colors.red_bg })
  hi(0, "DiffText", { fg = colors.blue, bg = colors.none })
  hi(0, "ErrorMsg", { fg = colors.red, bg = colors.red_bg })
  hi(0, "Folded", { fg = colors.fg0, bg = colors.bg1, italic = true })
  hi(0, "FoldColumn", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "IncSearch", { reverse = true })
  hi(0, "MatchParen", { fg = colors.fg1 })
  hi(0, "ModeMsg", { fg = colors.cyan, bold = true })
  hi(0, "MoreMsg", { fg = colors.cyan, bold = true })
  hi(0, "NonText", { fg = colors.fg1 })
  hi(0, "Pmenu", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "PmenuSel", { bg = colors.yellow_bg })
  hi(0, "PmenuSbar", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "PmenuThumb", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "Question", { fg = colors.cyan, bold = true })
  hi(0, "QuickFixLine", { fg = colors.fg0, bg = colors.bg1, bold = true, italic = true })
  hi(0, "qfLineNr", { fg = colors.fg1 })
  hi(0, "Search", { reverse = true })
  hi(0, "SpecialKey", { fg = colors.fg1 })
  hi(0, "SpellBad", { fg = colors.red, bg = colors.none, italic = true, undercurl = true })
  hi(0, "SpellCap", { fg = colors.blue, bg = colors.none, italic = true, undercurl = true })
  hi(0, "SpellLocal", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
  hi(0, "SpellRare", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
  hi(0, "StatusLine", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "StatusLineNC", { fg = colors.fg1, bg = colors.bg0 })
  hi(0, "StatusLineTerm", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "StatusLineTermNC", { fg = colors.fg1, bg = colors.bg0 })
  hi(0, "TabLineFill", { fg = colors.fg1, bg = colors.bg1 })
  hi(0, "TablineSel", { fg = colors.fg0, bg = colors.bg0 })
  hi(0, "Tabline", { fg = colors.fg1, bg = colors.bg1 })
  hi(0, "Title", { fg = colors.orange, bg = colors.none, bold = true })
  hi(0, "Visual", { bg = colors.bg1 })
  hi(0, "VisualNOS", { fg = colors.none, bg = colors.bg1 })
  hi(0, "WarningMsg", { fg = colors.red, bg = colors.bg1, bold = true })
  hi(0, "WildMenu", { fg = colors.fg1, bg = colors.bg1, bold = true })
  hi(0, "CursorColumn", { fg = colors.none, bg = colors.bg1 })
  hi(0, "CursorLine", { bg = colors.bg1 })
  hi(0, "ToolbarLine", { fg = colors.fg1, bg = colors.bg1 })
  hi(0, "ToolbarButton", { fg = colors.fg1, bg = colors.bg1, bold = true })
  hi(0, "NormalMode", { fg = colors.cyan, bg = colors.none, reverse = true })
  hi(0, "InsertMode", { fg = colors.green, bg = colors.none, reverse = true })
  hi(0, "VisualMode", { fg = colors.yellow, bg = colors.none, reverse = true })
  hi(0, "CommandMode", { fg = colors.magenta, bg = colors.none, reverse = true })
  hi(0, "VertSplit", { fg = colors.fg1 })
  hi(0, "Warnings", { fg = colors.yellow })

  -- Syntax highlighting
  hi(0, "Type", { fg = colors.yellow })
  hi(0, "Typedef", { fg = colors.yellow })
  hi(0, "StorageClass", { fg = colors.yellow })
  hi(0, "Structure", { fg = colors.yellow })
  hi(0, "Constant", { fg = colors.cyan })
  hi(0, "String", { fg = colors.cyan })
  hi(0, "Character", { fg = colors.cyan })
  hi(0, "Number", { fg = colors.cyan })
  hi(0, "Boolean", { fg = colors.cyan, bold = true })
  hi(0, "Float", { fg = colors.cyan })
  hi(0, "StringDelimiter", { fg = colors.green })
  hi(0, "Comment", { fg = colors.fg1, italic = true })
  hi(0, "Delimiter", { fg = colors.fg1 })
  hi(0, "Identifier", { fg = colors.fg0, bg = colors.none })
  hi(0, "Function", { fg = colors.blue, italic = true })
  hi(0, "Statement", { fg = colors.green })
  hi(0, "Conditional", { fg = colors.green })
  hi(0, "Repeat", { fg = colors.green })
  hi(0, "Label", { fg = colors.green })
  hi(0, "Operator", { fg = colors.fg3 })
  hi(0, "Keyword", { fg = colors.green, italic = true })
  hi(0, "Exception", { fg = colors.green })
  hi(0, "PreProc", { fg = colors.orange })
  hi(0, "Include", { fg = colors.orange, italic = true })
  hi(0, "Define", { fg = colors.orange })
  hi(0, "Macro", { fg = colors.orange })
  hi(0, "PreCondit", { fg = colors.orange })
  hi(0, "Special", { fg = colors.fg3, bold = true })
  hi(0, "SpecialChar", { fg = colors.red })
  hi(0, "Tag", { fg = colors.red })
  hi(0, "SpecialComment", { fg = colors.red })
  hi(0, "Debug", { fg = colors.red })
  hi(0, "Underlined", { fg = colors.violet, underline = true })
  hi(0, "Ignore", { fg = colors.none })
  hi(0, "Error", { fg = colors.red, bold = true, underline = true })
  hi(0, "Todo", { fg = colors.magenta, bold = true, italic = true })

  -- Telescope
  hi(0, "TelescopeNormal", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "TelescopeMatching", { fg = colors.bg0, bg = colors.yellow })
  hi(0, "TelescopeBorder", { fg = colors.bg1, bg = colors.bg1 })
  hi(0, "TelescopePromptNormal", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "TelescopePromptBorder", { fg = colors.bg1, bg = colors.bg1 })
  hi(0, "TelescopePromptPrefix", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "TelescopePromptTitle", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "TelescopeSelection", { bg = colors.yellow_bg })
  hi(0, "TelescopeSelectionCaret", { fg = colors.yellow, bg = colors.yellow_bg })
  hi(0, "TelescopeResultsTitle", { fg = colors.fg3, bg = colors.bg1 })
  hi(0, "TelescopeResultsBorder", { fg = colors.bg1, bg = colors.bg1 })
  hi(0, "TelescopePreviewBorder", { fg = colors.fg1, bg = colors.bg1 })
  hi(0, "TelescopePreviewTitle", { fg = colors.fg1, bg = colors.bg1 })

  -- Fidget
  hi(0, "FidgetTitle", { link = "Title" })
  hi(0, "FidgetNormal", { bg = colors.bg1 })

  -- Diagnostics
  hi(0, "DiagnosticError", { fg = colors.red })
  hi(0, "DiagnosticWarn", { fg = colors.yellow })
  hi(0, "DiagnosticInfo", { fg = colors.blue })
  hi(0, "DiagnosticHint", { fg = colors.fg3 })
  hi(0, "DiagnosticUnderlineError", { fg = colors.red, undercurl = true, sp = colors.red })
  hi(0, "DiagnosticUnderlineWarn", { fg = colors.yellow, undercurl = true, sp = colors.yellow })
  hi(0, "DiagnosticUnderlineInfo", { fg = colors.blue, undercurl = true, sp = colors.blue })
  hi(0, "DiagnosticUnderlineHint", { fg = colors.fg3, undercurl = true, sp = colors.cyan })
  hi(0, "DiagnosticVirtualTextError", { fg = colors.red, bg = colors.red_bg, blend = 50 })
  hi(0, "DiagnosticVirtualTextInfo", { fg = colors.blue, undercurl = true, sp = colors.blue })
  hi(
    0,
    "DiagnosticVirtualTextWarn",
    { fg = colors.yellow, bg = colors.yellow_bg, undercurl = true, sp = colors.yellow }
  )
  hi(0, "DiagnosticVirtualTextHint", { fg = colors.fg3, undercurl = true, sp = colors.cyan })

  -- GitSigns
  hi(0, "GitSignsAdd", { fg = colors.green })
  hi(0, "GitSignsAddNr", { fg = colors.green })
  hi(0, "GitSignsAddLn", { fg = colors.green })
  hi(0, "GitSignsChange", { fg = colors.yellow })
  hi(0, "GitSignsChangeNr", { fg = colors.yellow })
  hi(0, "GitSignsChangeLn", { fg = colors.yellow })
  hi(0, "GitSignsDelete", { fg = colors.red })
  hi(0, "GitSignsDeleteNr", { fg = colors.red })
  hi(0, "GitSignsDeleteLn", { fg = colors.red })

  -- Flash
  hi(0, "FlashBackdrop", { fg = colors.fg1, bg = colors.bg2 })
  hi(0, "FlashMatch", { fg = colors.bg0, bg = colors.magenta })
  hi(0, "FlashCurrent", { fg = colors.bg0, bg = colors.blue })
  hi(0, "FlashLabel", { fg = colors.yellow, bg = colors.yellow_bg })
  hi(0, "FlashCursor", { fg = colors.bg0, bg = colors.yellow })

  -- Fugitive
  hi(0, "diffAdded", { fg = colors.green, bg = colors.green_bg })
  hi(0, "diffRemoved", { fg = colors.red, bg = colors.red_bg })
  hi(0, "diffChanged", { fg = colors.yellow, bg = colors.yellow_bg })

  -- LSP
  hi(0, "LspReferenceRead", { fg = colors.yellow, bold = true })
  hi(0, "LspReferenceText", { fg = colors.yellow, bold = true })
  hi(0, "LspReferenceWrite", { fg = colors.orange, bold = true })
  hi(0, "LspCodeLens", { fg = colors.fg1 })

  -- LspSaga
  hi(0, "CmpDocumentation", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "CmpDocumentationBorder", { fg = colors.bg1, bg = colors.bg1 })
  hi(0, "CmpItemAbbr", { fg = colors.fg0 })
  hi(0, "CmpItemAbbrDeprecated", { fg = colors.red, strikethrough = true })
  hi(0, "CmpItemAbbrMatch", { fg = colors.fg0 })
  hi(0, "CmpItemAbbrMatchFuzzy", { fg = colors.fg0 })
  hi(0, "CmpItemMenu", { fg = colors.fg1 })
  hi(0, "CmpItemKindDefault", { fg = colors.fg1 })
  hi(0, "CmpItemKindKeyword", { fg = colors.green })
  hi(0, "CmpItemKindVariable", { fg = colors.fg0 })
  hi(0, "CmpItemKindConstant", { fg = colors.cyan })
  hi(0, "CmpItemKindReference", { fg = colors.fg0 })
  hi(0, "CmpItemKindValue", { fg = colors.fg0 })
  hi(0, "CmpItemKindFunction", { fg = colors.blue })
  hi(0, "CmpItemKindMethod", { fg = colors.blue })
  hi(0, "CmpItemKindConstructor", { fg = colors.blue })
  hi(0, "CmpItemKindClass", { fg = colors.yellow })
  hi(0, "CmpItemKindInterface", { fg = colors.yellow })
  hi(0, "CmpItemKindStruct", { fg = colors.yellow })
  hi(0, "CmpItemKindEvent", { fg = colors.yellow })
  hi(0, "CmpItemKindEnum", { fg = colors.yellow })
  hi(0, "CmpItemKindUnit", { fg = colors.yellow })
  hi(0, "CmpItemKindModule", { fg = colors.yellow })
  hi(0, "CmpItemKindProperty", { fg = colors.fg0 })
  hi(0, "CmpItemKindField", { fg = colors.fg0 })
  hi(0, "CmpItemKindTypeParameter", { fg = colors.fg0 })
  hi(0, "CmpItemKindEnumMember", { fg = colors.yellow })
  hi(0, "CmpItemKindOperator", { fg = colors.fg3 })
  hi(0, "CmpItemKindSnippet", { fg = colors.orange })

  -- Treesitter
  hi(0, "@tag", { fg = colors.blue, bold = true })
  hi(0, "@tag.attribute", { fg = colors.fg0, italic = true })
  hi(0, "@tag.delimiter", { fg = colors.fg1 })
  hi(0, "@constructor", { fg = colors.blue })
  hi(0, "@punctuation.string.delimiter", { fg = colors.string_delimiter, bg = colors.none, nocombine = true })
  hi(0, "@include.javascript", { fg = colors.fg1, italic = true })
  hi(0, "@include.source.javascript", { fg = colors.fg0, italic = true })
  hi(0, "@include.identifier.javascript", { fg = colors.fg3, italic = false })

  -- Semantic tokens
  hi(0, "@lsp.type.property", { italic = true })

  -- Language related
  hi(0, "rubyStringDelimiter", { link = "@punctuation.string.delimiter" })

  vim.g.terminal_color_0 = Solarized.palette.base02
  vim.g.terminal_color_1 = Solarized.palette.red
  vim.g.terminal_color_2 = Solarized.palette.green
  vim.g.terminal_color_3 = Solarized.palette.yellow
  vim.g.terminal_color_4 = Solarized.palette.blue
  vim.g.terminal_color_5 = Solarized.palette.magenta
  vim.g.terminal_color_6 = Solarized.palette.cyan
  vim.g.terminal_color_7 = Solarized.palette.base2
  vim.g.terminal_color_8 = Solarized.palette.base03
  vim.g.terminal_color_9 = Solarized.palette.orange
  vim.g.terminal_color_10 = Solarized.palette.base01
  vim.g.terminal_color_11 = Solarized.palette.base00
  vim.g.terminal_color_12 = Solarized.palette.base0
  vim.g.terminal_color_13 = Solarized.palette.violet
  vim.g.terminal_color_14 = Solarized.palette.base1
  vim.g.terminal_color_15 = Solarized.palette.base3
  vim.g.terminal_color_background = colors.bg0
  vim.g.terminal_color_foreground = colors.fg0
end

return Solarized
