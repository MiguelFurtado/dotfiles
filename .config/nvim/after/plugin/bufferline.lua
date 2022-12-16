require('bufferline').setup {
    options = {
        mode = 'tabs',
        numbers = 'ordinal',
        always_show_bufferline = false,
        max_name_length = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(_, level, _, _)
            local icon = level:match('error') and '' or ''
            return icon
        end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = false,
        separator_style = 'slant',
        enforce_regular_tabs = true,
    }
}

