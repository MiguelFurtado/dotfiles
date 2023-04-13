local M = {}

function M.setup()
  local telescope = require('telescope')
  telescope.setup {
    defaults = {
      color_devicons = true,
      file_ignore_patterns = {'^.git/', '^lib/', '^bin/', '^__pycache__/', '^node_modules/'},
      prompt_prefix = '→ ',
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    }
  }
  telescope.load_extension('fzf')
  telescope.load_extension('file_browser')
end

return M
