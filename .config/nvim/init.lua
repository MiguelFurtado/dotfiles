local o = vim.o
local wo = vim.wo
local g = vim.g
local A = vim.api
local cmd = vim.cmd
g.mapleader = ' '

require('plugins').load()
require('lsp')
require('keybinds').set_general_keybinds()

-- theme setup
cmd[[colorscheme catppuccin]]
o.termguicolors = true

o.number = true
o.relativenumber = true
o.cul = true -- highlight current line
wo.wrap = false
o.spell = false
o.mouse = "a" --enable mouse cursor

-- insert spaces for tabs like any civilized dev
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.encoding = 'UTF-8'

-- remove trailing spaces on save
A.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Exit Vim if NERDTree is the only window remaining in the only tab.
A.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = [[if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
})

-- hide default mode indicator because I'm using lualine
vim.opt.showmode = false


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {".git/"},
        prompt_prefix = "> ",
    }
}

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
require("nvim-autopairs").setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt" },
    -- do not trigger if a close pair is on the same line
    enable_check_bracket_line = false,
})

