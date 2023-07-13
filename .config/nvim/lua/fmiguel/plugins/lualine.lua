return {
  {
    "nvim-lualine/lualine.nvim",
    config = {
        options = {
          globalstatus = true,
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff", "diagnostics"},
          lualine_c = {{"filename", path = 1}},
          lualine_x = {"filetype"},
          lualine_y = {"progress"},
          lualine_z = {"location"}
        },
      },
  },
}

