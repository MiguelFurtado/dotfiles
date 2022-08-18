local o = vim.o
local wo = vim.wo
local g = vim.g
local A = vim.api
local cmd = vim.cmd
g.mapleader = ','

require('plugins').load()
local keybinds = require('keybinds')
require('lsp')


cmd[[colorscheme NeoSolarized]]
-- o.background=dark


keybinds.set_general_keybinds()

o.number = true
o.relativenumber = true
--o.laststatus =  -- hide status line
o.cul = true -- highlight current line
wo.wrap = false
o.spell = true
o.mouse = "a" --enable mouse cursor

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- fix base16 weird colors
o.termguicolors = true
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


-- Setup lsp auto-complete
-- ===================================================================
vim.opt.completeopt = {"menu","menuone","noselect"}

local cmp = require('cmp')

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' }, -- For luasnip users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})
-- ===================================================================
-- Done setting up lsp auto-complete


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
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {".git"},
        prompt_prefix = "> ",
        wrap_results = true
    }
}
