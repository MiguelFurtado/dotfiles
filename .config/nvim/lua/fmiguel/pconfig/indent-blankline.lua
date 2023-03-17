local M = {}

function M.setup()
  vim.cmd [[highlight IndentBlanklineIndent1 guifg=#ebdfe4 gui=nocombine]]
  if vim.o.background == 'dark' then
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#353535 gui=nocombine]]
  end

  require'indent_blankline'.setup {
    char_highlight_list = { "IndentBlanklineIndent1" },
  }
end

return M
