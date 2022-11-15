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


-- theme setup
require('tokyonight').setup({
  style = 'night',
  on_colors = function(colors)
    colors.comment = '#818ab3'
    colors.fg_gutter = '#6d7497'
  end
})

cmd[[colorscheme tokyonight]]
o.termguicolors = true

o.number = true
o.relativenumber = true
o.cul = true -- highlight current line
o.hlsearch=false
wo.wrap = false
o.spell = false
o.mouse = "a" --enable mouse cursor
o.smartindent = true

-- hide default mode indicator because I'm using lualine
vim.opt.showmode = false
-- global status line
vim.opt.laststatus = 3

-- insert spaces for tabs like any civilized dev
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.encoding = 'UTF-8'

-- remove trailing spaces on save
A.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
})

-- Exit Vim if NERDTree is the only window remaining in the only tab.
A.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = { '*' },
  command = [[if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    always_divide_middle = true,
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
telescope.load_extension("file_browser")

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}

-- Autopairs
require('nvim-autopairs').setup({
    check_ts = true,
    disable_filetype = { 'TelescopePrompt' },
    -- do not trigger if a close pair is on the same line
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

