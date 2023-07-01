vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cul = true -- highlight current line
vim.o.hlsearch=false
vim.wo.wrap = false
vim.o.spell = false
vim.o.mouse = "a" --enable mouse cursor
vim.o.guicursor = "i:block"
vim.opt.showmode = false -- hide default mode indicator because I'm using lualine
vim.opt.swapfile = false
vim.o.encoding = "UTF-8"
vim.opt.scrolloff = 8

-- tabs and indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

require("fmiguel.plugins").load()
require("fmiguel.colors")
local keybinds = require("fmiguel.keybinds")
keybinds.set_general_keybinds()
keybinds.set_dap_keybinds()

-- remove trailing spaces on save so I can sleep well at night
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*"},
  command = [[%s/\s\+$//e]],
})

-- Highlight yanked region
vim.api.nvim_create_autocmd({"TextYankPost"}, {
  pattern = {"*"},
  callback = function()
    vim.highlight.on_yank {
      higroup=(vim.fn["hlexists"]("Highlightedya--Region") > 0 and "HighlightedyankRegion" or "IncSearch"),
      timeout=700
    }
	end
})

