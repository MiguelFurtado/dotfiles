local M = {}

function M.setup()
  require'catppuccin'.setup {
    custom_highlights = function(colors)
      return {
        Comment = { fg = '#6c7389' },
        ['@comment'] = { fg = colors.surface2, style = { 'italic' }}
      }
    end
  }
end

return M
