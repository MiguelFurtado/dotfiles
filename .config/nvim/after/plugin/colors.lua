require'rose-pine'.setup({
    --- @usage 'main' | 'moon'
    dark_variant = 'main',
})

require'catppuccin'.setup {
    custom_highlights = function(colors)
        return {
            Comment = { fg = '#6c7389' },
            ['@comment'] = { fg = colors.surface2, style = { 'italic' }}
        }
    end
}

