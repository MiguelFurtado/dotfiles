local o = vim.o
local wo = vim.wo
local g = vim.g
local A = vim.api
local cmd = vim.cmd
g.mapleader = ' '

require('plugins').load()
require('lsp')
require('keybinds').set_general_keybinds()
require('debugging').setup()


-- colorscheme setup
require'catppuccin'.setup {
    custom_highlights = function(colors)
        return {
            Comment = { fg = '#6c7389' },
            ['@comment'] = { fg = colors.surface2, style = { 'italic' }}
        }
    end
}
cmd[[colorscheme catppuccin]]
o.termguicolors = true

o.number = true
o.relativenumber = true
o.cul = true -- highlight current line
o.hlsearch=false
wo.wrap = false
o.spell = false
o.mouse = 'a' --enable mouse cursor
o.smartindent = true
-- hide default mode indicator because I'm using lualine
vim.opt.showmode = false
-- global status line
vim.opt.laststatus = 3

-- insert spaces for tabs like a civilized dev
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.encoding = 'UTF-8'

-- remove trailing spaces on save so I can sleep well at night
A.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
})

require('lualine').setup {
    options = {
        globalstatus = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
}

local telescope = require('telescope')
telescope.setup{
    defaults = {
        file_ignore_patterns = {'.git/', 'lib', 'bin', '__pycache__'},
        prompt_prefix = '→ ',
    }
}
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = 'all',

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true, -- enable syntax highlighting
    },
}

-- Autopairs
require('nvim-autopairs').setup({
    check_ts = true,
    disable_filetype = { 'TelescopePrompt' },
    -- do not trigger if a close pair is in the same line
    enable_check_bracket_line = false,
})

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

require'netrw'.setup{}

