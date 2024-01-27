local utils = require("solarized.utils")

local palette = {
  base04 = "#001217",
  base03 = "#002b36",
  base02 = "#073642",
  base01 = "#586e75",
  base00 = "#657b83",
  base0 = "#839496",
  base1 = "#93a1a1",
  base2 = "#eee8d5",
  base3 = "#fdf6e3",
  base4 = "#ffffff",

  yellow = "#b58900",
  orange = "#cb4b16",
  red = "#dc322f",
  magenta = "#d33682",
  violet = "#6c71c4",
  blue = "#268bd2",
  cyan = "#2aa198",
  green = "#859900",
}

local darken = utils.mix_with(palette.base03)
local lighten = utils.mix_with(palette.base3)

palette.yellow_darker = darken(palette.yellow, 0.85)
palette.yellow_dark = darken(palette.yellow, 0.25)
palette.yellow_light = lighten(palette.yellow, 0.25)
palette.yellow_lighter = lighten(palette.yellow, 0.85)

palette.orange_darker = darken(palette.orange, 0.85)
palette.orange_dark = darken(palette.orange, 0.25)
palette.orange_light = lighten(palette.orange, 0.25)
palette.orange_lighter = lighten(palette.orange, 0.85)

palette.red_darker = darken(palette.red, 0.85)
palette.red_dark = darken(palette.red, 0.25)
palette.red_light = lighten(palette.red, 0.25)
palette.red_lighter = lighten(palette.red, 0.85)

palette.magenta_darker = darken(palette.magenta, 0.85)
palette.magenta_dark = darken(palette.magenta, 0.25)
palette.magenta_light = lighten(palette.magenta, 0.25)
palette.magenta_lighter = lighten(palette.magenta, 0.85)

palette.violet_darker = darken(palette.violet, 0.85)
palette.violet_dark = darken(palette.violet, 0.25)
palette.violet_light = lighten(palette.violet, 0.25)
palette.violet_lighter = lighten(palette.violet, 0.85)

palette.blue_darker = darken(palette.blue, 0.85)
palette.blue_dark = darken(palette.blue, 0.25)
palette.blue_light = lighten(palette.blue, 0.25)
palette.blue_lighter = lighten(palette.blue, 0.85)

palette.cyan_darker = darken(palette.cyan, 0.85)
palette.cyan_dark = darken(palette.cyan, 0.25)
palette.cyan_light = lighten(palette.cyan, 0.25)
palette.cyan_lighter = lighten(palette.cyan, 0.85)

palette.green_darker = darken(palette.green, 0.85)
palette.green_dark = darken(palette.green, 0.25)
palette.green_light = lighten(palette.green, 0.25)
palette.green_lighter = lighten(palette.green, 0.85)

return palette
