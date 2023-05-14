local o = vim.o
local wo = vim.wo
local g = vim.g
local A = vim.api
local cmd = vim.cmd
local opt = vim.opt
g.mapleader = ' '

require('fmiguel.plugins').load()
local keybinds = require('fmiguel.keybinds')
keybinds.set_general_keybinds()
keybinds.set_dap_keybinds()
require('fmiguel.colors')

o.number = true
o.relativenumber = true
o.cul = true -- highlight current line
o.hlsearch=false
wo.wrap = false
o.spell = false
o.mouse = 'a' --enable mouse cursor
o.guicursor = "i:block"
-- hide default mode indicator because I'm using lualine
opt.showmode = false
-- global status line
opt.laststatus = 3
opt.swapfile = false

-- tabs and indentation
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.encoding = 'UTF-8'

-- remove trailing spaces on save so I can sleep well at night
A.nvim_create_autocmd({'BufWritePre'}, {
  pattern = {'*'},
  command = [[%s/\s\+$//e]],
})

-- Highlight yanked region
A.nvim_create_autocmd({'TextYankPost'}, {
  pattern = {'*'},
  callback = function()
    vim.highlight.on_yank {
      higroup=(vim.fn['hlexists']('Highlightedya--Region') > 0 and 'HighlightedyankRegion' or 'IncSearch'),
      timeout=700
    }
	end
})

