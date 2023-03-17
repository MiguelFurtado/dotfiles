require'catppuccin'.setup {
  custom_highlights = function(colors)
    return {
      Comment = { fg = '#6c7389' },
      ['@comment'] = { fg = colors.surface2, style = { 'italic' }}
    }
  end
}

local dark_theme = 'carbonfox'
local light_theme = 'dawnfox'

function choose_theme()
  if vim.o.background == 'dark' then
    vim.cmd(string.format('color %s', dark_theme))
    return
  end
  vim.cmd(string.format('color %s', light_theme))
end

vim.api.nvim_create_autocmd('User', {
  pattern = {'LumenLight', 'LumenDark'},
  callback = function()
    choose_theme()
    -- Need to reset these plugins so colors don't look weird
    require'fmiguel.pconfig.lualine'.setup()
    require'fmiguel.pconfig.bufferline'.setup()
    require'fmiguel.pconfig.indent-blankline'.setup()
  end
})

choose_theme()
