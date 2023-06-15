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

local plenary_dep = {
  'nvim-lua/plenary.nvim',
  version = "^0.1.3",
}

local plugins = {
  {
    'ahmedkhalf/project.nvim',
    config = require'fmiguel.pconfig.project'.setup,
  },

  -- git support
  {
    'lewis6991/gitsigns.nvim',
    version = "0.*",
    config = require'fmiguel.pconfig.gitsigns'.setup,
  },

  -- treesitter provides better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    version = '^0.9',
    build = ':TSUpdate',
    config = require'fmiguel.pconfig.treesitter'.setup,
  },

  'kyazdani42/nvim-web-devicons',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    version = '^0.1.1',
    dependencies = {
      plenary_dep,
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = require'fmiguel.pconfig.telescope'.setup,
  },

  -- Configurations for Nvim LSP, DAP and Linters
  {
    'williamboman/mason.nvim',
    version = '^1',
    config = require'fmiguel.pconfig.mason'.setup,
  },

  -- provides lspconfig compatibility to mason
  {
    'williamboman/mason-lspconfig.nvim',
    version = "^0.1",
    dependencies = {
      {
        'neovim/nvim-lspconfig',
        version = "^0.1",
        config = require'fmiguel.pconfig.lsp_config'.setup,
      },
    },
  },

  {
    'jayp0521/mason-nvim-dap.nvim',
    version = "^2",
    dependencies = {
      'mfussenegger/nvim-dap',
      version = "0.*",
    },
    config = require'fmiguel.pconfig.dap'.setup,
  },

  {
    'rcarriga/nvim-dap-ui',
    version = "^3",
    config = function()
      require'dapui'.setup()
    end,
  },

  'theHamsta/nvim-dap-virtual-text', -- inline values

  -- need this because the mason setup does not include running
  -- delve with args
  {
    'leoluz/nvim-dap-go',
    ft = "go",
    config = function()
      require('dap-go').setup()
    end,
  },

  {
    'j-hui/fidget.nvim', -- feedback while I wait for rust-analyzer
    config = function()
      require('fidget').setup()
    end,
  },

  -- lsp auto-completion
  {
    -- the latest release is from August 2022 but there were a lot of commits
    -- since and the project is very actively maintained so I'll wait till the
    -- next release to specify a version.
    -- TODO use a version on next release
    'hrsh7th/nvim-cmp', -- the completion engine
    config = require('fmiguel.pconfig.cmp').setup,
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = "^1",
      }, -- snippets engine
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
    config = require'fmiguel.pconfig.lualine'.setup,
  },

  -- proper tabs
  {
    'akinsho/bufferline.nvim',
    version = '^4',
    event = {'BufEnter'},
    config = require('fmiguel.pconfig.bufferline').setup,
  },

  {
    'saecki/crates.nvim',
    version = '^0.3',
    dependencies = { planary_dep },
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup()
    end,
  },

  -- netrw icons
  {
    'prichrd/netrw.nvim',
    config = function()
      require'netrw'.setup()
    end,
  },

  'ThePrimeagen/harpoon',

  -- themes
  {
    'EdenEast/nightfox.nvim',
    version = "^3",
  },

  'rebelot/kanagawa.nvim',

  -- detect system theme (dark/light)
  'vimpostor/vim-lumen',
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

