return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- order matters as latter ones are used as fallback
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        -- Show hidden files in telescope
        show_hidden = true,
      }
    end,
  },
}

