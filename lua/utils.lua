-- Convert a color string to a table of RGB values
function hexToRGB(hex)
  hex = hex:gsub("#", "")
  return {
    r = tonumber(hex:sub(1, 2), 16) / 255,
    g = tonumber(hex:sub(3, 4), 16) / 255,
    b = tonumber(hex:sub(5, 6), 16) / 255,
  }
end

-- Convert RGB values to a color string
function RGBToHex(rgb)
  local r = math.floor(rgb.r * 255 + 0.5)
  local g = math.floor(rgb.g * 255 + 0.5)
  local b = math.floor(rgb.b * 255 + 0.5)
  return string.format("#%02X%02X%02X", r, g, b)
end

-- Mix two colors with a given ratio
function mix(color1, color2, ratio)
  local rgb1 = hexToRGB(color1)
  local rgb2 = hexToRGB(color2)

  local mixedColor = {
    r = rgb1.r * (1 - ratio) + rgb2.r * ratio,
    g = rgb1.g * (1 - ratio) + rgb2.g * ratio,
    b = rgb1.b * (1 - ratio) + rgb2.b * ratio,
  }

  return RGBToHex(mixedColor)
end

function blend_with(base_color)
  return function(color, ratio)
    return mix(color, base_color, ratio)
  end
end

return {
  mix = mix,
  mix_with = blend_with,
}
