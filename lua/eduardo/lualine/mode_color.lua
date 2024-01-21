local color = require("eduardo.lualine.colors").colors

return {
  mode_color = {
    n = color.red,
    i = color.green,
    v = color.blue,
    [""] = color.blue,
    V = color.blue,
    c = color.magenta,
    no = color.red,
    s = color.orange,
    S = color.orange,
    [""] = color.orange,
    ic = color.yellow,
    R = color.violet,
    Rv = color.violet,
    cv = color.red,
    ce = color.red,
    r = color.cyan,
    rm = color.cyan,
    ["r?"] = color.cyan,
    ["!"] = color.red,
    t = color.red,
  },
}
