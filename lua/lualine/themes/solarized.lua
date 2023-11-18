local palette = require("palette")

local solarized = {}

solarized.normal = {
  a = { bg = palette.green, fg = palette.base03 },
  b = { bg = palette.base02, fg = palette.base0 },
  c = { bg = palette.base0, fg = palette.base03 },
}

solarized.inactive = {
  a = { bg = palette.base02, fg = palette.base01 },
  b = { bg = palette.base02, fg = palette.base01 },
  c = { bg = palette.base03, fg = palette.base01 },
}

solarized.insert = {
  a = { bg = palette.green, fg = palette.black },
  b = { bg = palette.fg_gutter, fg = palette.green },
}

solarized.command = {
  a = { bg = palette.yellow, fg = palette.black },
  b = { bg = palette.fg_gutter, fg = palette.yellow },
}

solarized.visual = {
  a = { bg = palette.magenta, fg = palette.black },
  b = { bg = palette.fg_gutter, fg = palette.magenta },
}

solarized.replace = {
  a = { bg = palette.red, fg = palette.black },
  b = { bg = palette.fg_gutter, fg = palette.red },
}

return solarized
