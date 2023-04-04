local M = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- When a file is opened, this will switch the vim workspace to the project's root
  'airblade/vim-rooter',

  -- git support
  {
    'lewis6991/gitsigns.nvim',
    config = require'fmiguel.pconfig.gitsigns'.setup,
  },

  -- treesitter provides better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = require'fmiguel.pconfig.treesitter'.setup,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', version = '0.1.0',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
      'kyazdani42/nvim-web-devicons',
    },
  },

  -- Configurations for Nvim LSP, DAP and Linters
  {
    'williamboman/mason.nvim',
    config = require'fmiguel.pconfig.mason'.setup,
    dependencies = {'williamboman/mason-lspconfig.nvim'},
  },

  {
    'neovim/nvim-lspconfig',
    config = require'fmiguel.pconfig.lsp_config'.setup,
  },


  {
    'jayp0521/mason-nvim-dap.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = require'fmiguel.pconfig.dap'.setup,
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function()
      require'dapui'.setup()
    end
  },
  'theHamsta/nvim-dap-virtual-text', -- inline values

  -- need this because the mason setup does not include running
  -- delve with args
  {
    'leoluz/nvim-dap-go',
    ft = "go",
    config = function()
      require('dap-go').setup()
    end
  },

  {
    'j-hui/fidget.nvim', -- feedback while I wait for rust-analyzer
    config = function()
      require('fidget').setup()
    end
  },

  -- lsp auto-completion
  {
    'hrsh7th/nvim-cmp', -- the completion engine
    config = require('fmiguel.pconfig.cmp').setup,
    dependencies = {
      'L3MON4D3/LuaSnip', -- snippets engine
      'saadparwaiz1/cmp_luasnip', -- the luasnip driver for cmp
      'hrsh7th/cmp-buffer', -- words from the curr buffer
      'hrsh7th/cmp-path', -- path auto-completion
      'hrsh7th/cmp-nvim-lua', -- nvim lua api
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets', -- a bunch of preconfigured snippets for various languages
    },
  },

  {
    'windwp/nvim-autopairs', -- auto-close pairs
    config = require'fmiguel.pconfig.autopairs'.setup,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    config = require'fmiguel.pconfig.lualine'.setup,
  },

  -- proper tabs
  {
    'akinsho/bufferline.nvim',
    version = 'v3.*',
    dependencies = 'kyazdani42/nvim-web-devicons',
    event = {'TabNew'},
    config = require('fmiguel.pconfig.bufferline').setup
  },

  {
    'saecki/crates.nvim',
    version = 'v0.3.*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup()
    end
  },

  -- netrw icons
  {
    'prichrd/netrw.nvim',
    config = function()
      require'netrw'.setup()
    end
  },

  -- themes
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = require'fmiguel.pconfig.catppuccin'.setup,
  },
  'EdenEast/nightfox.nvim',
  'rebelot/kanagawa.nvim',
  'vimpostor/vim-lumen', -- auto dark mode
}

local opts = {
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
  },
}

function M.load()
  require("lazy").setup(plugins, opts)
end

return M

