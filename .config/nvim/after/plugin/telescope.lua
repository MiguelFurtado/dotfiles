local telescope = require('telescope')
telescope.setup {
  defaults = {
    file_ignore_patterns = {'.git/', 'lib', 'bin', '__pycache__'},
    prompt_prefix = '→ ',
  }
}
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

