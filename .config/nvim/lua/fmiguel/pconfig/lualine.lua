local M = {}

function M.setup()
  require"lualine".setup {
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {"branch", "diff", "diagnostics"},
      lualine_c = {{"filename", path = 1}},
      lualine_x = {},
      lualine_y = {"progress"},
      lualine_z = {"location"}
    },
  }
end

return M

