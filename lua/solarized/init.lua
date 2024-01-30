local utils = require("solarized.utils")
local palette = require("solarized.palette")

local Solarized = {}

Solarized.palette = palette

-- extra base colors
Solarized.palette.dim_bg_dark = utils.mix(Solarized.palette.base03, Solarized.palette.base04, 0.25)
Solarized.palette.dim_bg_light = utils.mix(Solarized.palette.base3, Solarized.palette.base00, 0.05)

Solarized.get_colors = function()
  local bg = vim.o.background
  local colors = {
    light = {
      bg0 = Solarized.palette.base3, -- background
      bg1 = Solarized.palette.base2, -- background highlights
      bg2 = Solarized.palette.base3,
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

      red_bg = Solarized.palette.red_lighter,
      yellow_bg = Solarized.palette.yellow_lighter,
      green_bg = Solarized.palette.green_lighter,
      blue_bg = Solarized.palette.blue_lighter,
      string_delimiter = Solarized.palette.cyan_light,
      dim_bg0 = Solarized.palette.dim_bg_light,
      none = "NONE",

      info_fg = Solarized.palette.blue,
      info_bg = Solarized.palette.blue_lighter,
      hint_fg = Solarized.palette.cyan,
      hint_bg = Solarized.palette.cyan_lighter,
      warning_fg = Solarized.palette.yelow,
      warning_bg = Solarized.palette.yellow_lighter,
      error_fg = Solarized.palette.red,
      error_bg = Solarized.palette.red_lighter,

      diff_change_fg = Solarized.palette.blue_darker,
      diff_change_bg = Solarized.palette.blue_lighter,
      diff_add_fg = Solarized.palette.green_darker,
      diff_add_bg = Solarized.palette.green_lighter,
      diff_delete_fg = Solarized.palette.red_darker,
      diff_delete_bg = Solarized.palette.red_lighter,

      statusline_bg = Solarized.palette.base01,
      statusline_fg = Solarized.palette.base2,
      statusline_bg_nc = Solarized.palette.dim_bg_light,
      statusline_fg_nc = Solarized.palette.base00,

      -- semantic tokens
      operator = Solarized.palette.base01,
      variable = Solarized.palette.base00,
      field = Solarized.palette.base01,
      keyword = Solarized.palette.green,
      function_call = Solarized.palette.blue_dark,
      string = Solarized.palette.cyan,
      number = Solarized.palette.cyan,
      boolean = Solarized.palette.orange,
      comment = Solarized.palette.base1,
      type = Solarized.palette.yellow,
      tag = Solarized.palette.blue_dark,
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

      red_bg = Solarized.palette.red_darker,
      yellow_bg = Solarized.palette.yellow_darker,
      green_bg = Solarized.palette.green_darker,
      blue_bg = Solarized.palette.blue_darker,
      string_delimiter = Solarized.palette.cyan_dark,
      dim_bg0 = Solarized.palette.dim_bg_dark,
      none = "NONE",

      info_fg = Solarized.palette.blue,
      info_bg = Solarized.palette.blue_darker,
      hint_fg = Solarized.palette.cyan,
      hint_bg = Solarized.palette.cyan_darker,
      warning_fg = Solarized.palette.light,
      warning_bg = Solarized.palette.yellow_darker,
      error_fg = Solarized.palette.red,
      error_bg = Solarized.palette.red_darker,

      diff_change_fg = Solarized.palette.blue_lighter,
      diff_change_bg = Solarized.palette.blue_darker,
      diff_add_fg = Solarized.palette.green_lighter,
      diff_add_bg = Solarized.palette.green_darker,
      diff_delete_fg = Solarized.palette.red_lighter,
      diff_delete_bg = Solarized.palette.red_darker,

      statusline_bg = Solarized.palette.base1,
      statusline_fg = Solarized.palette.base03,
      statusline_bg_nc = Solarized.palette.dim_bg_dark,
      statusline_fg_nc = Solarized.palette.base0,

      -- semantic tokens
      operator = Solarized.palette.base1,
      variable = Solarized.palette.base0,
      field = Solarized.palette.base1,
      keyword = Solarized.palette.green,
      string = Solarized.palette.cyan,
      function_call = Solarized.palette.blue_light,
      number = Solarized.palette.cyan,
      boolean = Solarized.palette.orange,
      comment = Solarized.palette.base01,
      type = Solarized.palette.yellow,
      tag = Solarized.palette.blue_light,
    },
  }

  return colors[bg]
end

Solarized.setup = function()
  vim.g.color_name = "solarized"

  local colors = Solarized.get_colors()
  local hi = vim.api.nvim_set_hl

  vim.g.colors_name = Solarized.name
  vim.cmd("highlight clear")

  hi(0, "Normal", { fg = colors.fg0, bg = colors.bg0 })
  hi(0, "NormalNC", { fg = colors.fg0, bg = colors.dim_bg0 })
  hi(0, "NormalSB", { fg = colors.fg0, bg = colors.dim_bg0 })
  hi(0, "SignColumn", { fg = colors.fg1 })
  hi(0, "CursorLineSign", { bg = colors.bg2 })
  hi(0, "EndOfBuffer", { fg = colors.red })
  hi(0, "NormalFloat", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "FloatBorder", { fg = colors.bg1, bg = colors.bg1 })
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
  hi(0, "DiffAdd", { bg = colors.green_bg })
  hi(0, "DiffChange", { bg = colors.blue_bg })
  hi(0, "DiffDelete", { bg = colors.red_bg, fg = colors.red })
  hi(0, "DiffText", { bg = colors.none })
  hi(0, "ErrorMsg", { fg = colors.red, bg = colors.error_bg })
  hi(0, "Folded", { fg = colors.fg0, bg = colors.bg1, italic = true })
  hi(0, "FoldColumn", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "IncSearch", { fg = colors.yellow, bg = colors.yellow_bg })
  hi(0, "MatchParen", { fg = colors.red })
  hi(0, "ModeMsg", { fg = colors.cyan, bold = true })
  hi(0, "MoreMsg", { fg = colors.cyan, bold = true })
  hi(0, "NonText", { fg = colors.fg1 })
  hi(0, "Pmenu", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "PmenuSel", { fg = colors.bg0, bg = colors.yellow })
  hi(0, "PmenuSbar", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "PmenuThumb", { fg = colors.fg0, bg = colors.bg1 })
  hi(0, "Question", { fg = colors.cyan, bold = true })
  hi(0, "QuickFixLine", { fg = colors.fg0, bg = colors.bg1, bold = true, italic = true })
  hi(0, "qfLineNr", { fg = colors.fg1 })
  hi(0, "Search", { fg = colors.bg2, bg = colors.magenta })
  hi(0, "SpecialKey", { fg = colors.fg1 })
  hi(0, "SpellBad", { fg = colors.red, bg = colors.none, italic = true, undercurl = true })
  hi(0, "SpellCap", { fg = colors.blue, bg = colors.none, italic = true, undercurl = true })
  hi(0, "SpellLocal", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
  hi(0, "SpellRare", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
  hi(0, "StatusLine", { fg = colors.statusline_fg, bg = colors.statusline_bg })
  hi(0, "StatusLineNC", { fg = colors.statusline_fg_nc, bg = colors.statusline_bg_nc })
  hi(0, "StatusLineTerm", { fg = colors.statusline_fg, bg = colors.statusline_bg })
  hi(0, "StatusLineTermNC", { fg = colors.statusline_fg_nc, bg = colors.statusline_bg_nc })
  hi(0, "TabLineFill", { fg = colors.bg1, bg = colors.fg1 })
  hi(0, "TablineSel", { fg = colors.fg0, bg = colors.bg0 })
  hi(0, "Tabline", { fg = colors.bg1, bg = colors.fg1 })
  hi(0, "Title", { fg = colors.fg0, bg = colors.none, bold = true })
  hi(0, "Visual", { fg = colors.bg0, bg = colors.fg0 })
  hi(0, "VisualNOS", { fg = colors.bg0, bg = colors.fg1 })
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
  hi(0, "VertSplit", { fg = colors.fg1, bg = colors.bg0 })
  hi(0, "Warnings", { fg = colors.yellow })

  -- Syntax highlighting
  hi(0, "Type", { fg = colors.type })
  hi(0, "Typedef", { fg = colors.type })
  hi(0, "StorageClass", { fg = colors.type })
  hi(0, "Structure", { fg = colors.type })
  hi(0, "Constant", { fg = colors.cyan })
  hi(0, "String", { fg = colors.string })
  hi(0, "Character", { fg = colors.cyan })
  hi(0, "Number", { fg = colors.number })
  hi(0, "Boolean", { fg = colors.boolean, bold = true })
  hi(0, "Float", { fg = colors.number })
  hi(0, "StringDelimiter", { fg = colors.green })
  hi(0, "Comment", { fg = colors.comment, italic = true })
  hi(0, "Delimiter", { fg = colors.fg1 })
  hi(0, "Identifier", { fg = colors.variable })
  hi(0, "Function", { fg = colors.blue, italic = false })
  hi(0, "Statement", { fg = colors.keyword })
  hi(0, "Conditional", { fg = colors.keyword })
  hi(0, "Repeat", { fg = colors.keyword })
  hi(0, "Label", { fg = colors.keyword, italic = true })
  hi(0, "Operator", { fg = colors.fg3 })
  hi(0, "Keyword", { fg = colors.keyword, italic = true })
  hi(0, "Exception", { fg = colors.keyword })
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
  hi(0, "TelescopeSelection", { bg = colors.bg0 })
  hi(0, "TelescopeSelectionCaret", { fg = colors.fg0 })
  hi(0, "TelescopeResultsTitle", { fg = colors.fg3, bg = colors.bg1 })
  hi(0, "TelescopeResultsBorder", { fg = colors.bg1, bg = colors.bg1 })
  hi(0, "TelescopePreviewBorder", { fg = colors.fg1, bg = colors.bg1 })
  hi(0, "TelescopePreviewTitle", { fg = colors.fg1, bg = colors.bg1 })

  -- Incline
  hi(0, "InclineNormal", { fg = colors.yellow, bg = colors.bg1 })
  hi(0, "InclineNormalNC", { fg = colors.fg1, bg = colors.bg0 })

  -- Fidget
  hi(0, "FidgetTitle", { link = "Title" })
  hi(0, "FidgetNormal", { bg = colors.bg1 })

  -- Harpoon
  hi(0, "HarpoonWindow", { link = "NormalFloat" })
  hi(0, "HarpoonBorder", { link = "FloatBorder" })
  hi(0, "HarpoonNumberActive", { fg = colors.orange })
  hi(0, "HarpoonNumberInactive", { fg = colors.fg1 })

  -- Diagnostics
  hi(0, "DiagnosticError", { fg = colors.red })
  hi(0, "DiagnosticWarn", { fg = colors.yellow })
  hi(0, "DiagnosticInfo", { fg = colors.blue })
  hi(0, "DiagnosticHint", { fg = colors.fg3 })
  hi(0, "DiagnosticUnderlineError", { bg = colors.error_bg, undercurl = true, sp = colors.error_fg })
  hi(0, "DiagnosticUnderlineWarn", { bg = colors.warning_bg, undercurl = true, sp = colors.warning_fg })
  hi(0, "DiagnosticUnderlineInfo", { fg = colors.blue, undercurl = true, sp = colors.blue })
  hi(0, "DiagnosticUnderlineHint", { fg = colors.fg3, undercurl = true, sp = colors.cyan })
  hi(0, "DiagnosticVirtualTextError", { fg = colors.error_fg, bg = colors.error_bg, blend = 50 })
  hi(0, "DiagnosticVirtualTextInfo", { fg = colors.info_fg, bg = colors.info_bg, undercurl = false, sp = colors.blue })
  hi(0, "DiagnosticVirtualTextWarn", { fg = colors.warning_fg, bg = colors.warning_bg, sp = colors.yellow })
  hi(0, "DiagnosticVirtualTextHint", { fg = colors.hint_fg, bg = colors.hint_bg, sp = colors.cyan })

  -- GitSigns
  hi(0, "GitSignsAdd", { fg = colors.green, bg = colors.green_bg })
  hi(0, "GitSignsAddNr", { fg = colors.green })
  hi(0, "GitSignsAddLn", { bg = colors.green_bg })
  hi(0, "GitSignsChange", { fg = colors.blue, bg = colors.blue_bg })
  hi(0, "GitSignsChangeNr", { fg = colors.blue })
  hi(0, "GitSignsChangeLn", { bg = colors.blue_bg })
  hi(0, "GitSignsDelete", { fg = colors.red, bg = colors.red_bg })
  hi(0, "GitSignsDeleteNr", { fg = colors.red })
  hi(0, "GitSignsDeleteLn", { bg = colors.red_bg })

  -- Flash
  -- hi(0, "FlashBackdrop", { fg = colors.fg1, bg = colors.bg2 })
  hi(0, "FlashMatch", { fg = colors.bg0, bg = colors.magenta })
  hi(0, "FlashCurrent", { fg = colors.bg0, bg = colors.yellow })
  hi(0, "FlashLabel", { fg = colors.yellow, bg = colors.yellow_bg })
  hi(0, "FlashCursor", { fg = colors.bg0, bg = colors.yellow })

  -- Fugitive
  hi(0, "diffAdded", { bg = colors.green_bg })
  hi(0, "diffRemoved", { bg = colors.red_bg })
  hi(0, "diffChanged", { bg = colors.blue_bg })

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
  hi(0, "@tag", { fg = colors.tag, bold = true })
  hi(0, "@tag.attribute", { fg = colors.fg0, italic = true })
  hi(0, "@tag.delimiter", { fg = colors.fg1 })
  hi(0, "@variable", { fg = colors.variable })
  hi(0, "@field", { fg = colors.field, italic = true })
  hi(0, "@function", { fg = colors.blue, italic = false })
  hi(0, "@function.call", { fg = colors.function_call, italic = true })
  hi(0, "@constructor", { fg = colors.blue })
  hi(0, "@punctuation.string.delimiter", { fg = colors.string_delimiter, nocombine = true })
  hi(0, "@include.javascript", { fg = colors.fg1, italic = true })
  hi(0, "@include.source.javascript", { fg = colors.fg0, italic = true })
  hi(0, "@include.identifier.javascript", { fg = colors.fg3, italic = false })
  hi(0, "@include.typescript", { link = "@include.javascript" })
  hi(0, "@include.source.typescript", { link = "@include.source.javascript" })
  hi(0, "@include.identifier.typescript", { link = "@include.identifier.javascript" })
  hi(0, "@include.typescriptreact", { link = "@include.javascript" })
  hi(0, "@include.source.typescriptreact", { link = "@include.source.javascript" })
  hi(0, "@include.identifier.typescriptreact", { link = "@include.identifier.javascript" })
  hi(0, "@include.tsx", { link = "@include.javascript" })
  hi(0, "@include.source.tsx", { link = "@include.source.javascript" })
  hi(0, "@include.identifier.tsx", { link = "@include.identifier.javascript" })

  hi(0, "@keyword.jsdoc", { fg = colors.green, italic = false })
  hi(0, "@type.jsdoc", { fg = colors.yellow, bold = true })

  -- LSP
  hi(0, "@lsp.type.parameter", { link = "@variable" })
  hi(0, "@lsp.type.variable", { link = "@variable" })
  hi(0, "@lsp.type.property", { link = "@field" })
  hi(0, "@lsp.type.function", { link = "Function", italic = false })

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
