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
  "nvim-lua/plenary.nvim",
  version = "^0.1.3",
}

local devicons_dep = "kyazdani42/nvim-web-devicons"

local plugins = {
  {
    "ahmedkhalf/project.nvim",
    config = require"fmiguel.pconfig.project".setup,
  },

  -- git support
  {
    "lewis6991/gitsigns.nvim",
    version = "0.*",
    config = require"fmiguel.pconfig.gitsigns".setup,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    version = "^0.9",
    build = ":TSUpdate",
    config = require"fmiguel.pconfig.treesitter".setup,
    event = "BufRead",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = "^0.1.1",
    config = require"fmiguel.pconfig.telescope".setup,
    keys = require"fmiguel.keybinds".telescope_keybinds,
    dependencies = {
      plenary_dep,
      devicons_dep,
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
  },

  -- Configurations for Nvim LSP, DAP and Linters
  {
    "williamboman/mason.nvim",
    version = "^1",
    config = require"fmiguel.pconfig.mason".setup,
    ft = require"fmiguel.pconfig.mason".ft,
    event = "CmdUndefined Mason",
    dependencies = {
      -- provides lspconfig compatibility to mason
      {
        "williamboman/mason-lspconfig.nvim",
        version = "^0.1",
        dependencies = {
          {
            "neovim/nvim-lspconfig",
            version = "^0.1",
          },
        },
      },
      {
        "jayp0521/mason-nvim-dap.nvim",
        version = "^2",
        dependencies = {
          "mfussenegger/nvim-dap",
          version = "0.*",
        },
      },
      {
        "rcarriga/nvim-dap-ui",
        version = "^3",
        config = function()
          require"dapui".setup()
        end,
      },
      "theHamsta/nvim-dap-virtual-text", -- inline values
      -- need this because the mason setup does not include running
      -- delve with args
      {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function()
          require("dap-go").setup()
        end,
      },
    },
  },

  {
    "j-hui/fidget.nvim", -- feedback while I wait for rust-analyzer
    tag = "legacy", -- don't break because plugin is being reworked
    config = function()
      require("fidget").setup()
    end,
    event = "LspAttach",
  },

  -- lsp auto-completion
  {
    -- the latest release is from August 2022 but there were a lot of commits
    -- since and the project is very actively maintained so I'll wait till the
    -- next release to specify a version.
    -- TODO use a version on next release
    "hrsh7th/nvim-cmp", -- the completion engine
    config = require("fmiguel.pconfig.cmp").setup,
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "^1",
      }, -- snippets engine
      "saadparwaiz1/cmp_luasnip", -- the luasnip driver for cmp
      "hrsh7th/cmp-buffer", -- words from the curr buffer
      "hrsh7th/cmp-path", -- path auto-completion
      "hrsh7th/cmp-nvim-lua", -- nvim lua api
      "hrsh7th/cmp-nvim-lsp",
      "rafamadriz/friendly-snippets", -- a bunch of preconfigured snippets for various languages
    },
  },

  {
    "windwp/nvim-autopairs", -- auto-close pairs
    config = require"fmiguel.pconfig.autopairs".setup,
    event = "InsertEnter",
  },

  {
    "nvim-lualine/lualine.nvim",
    config = require"fmiguel.pconfig.lualine".setup,
    dependencies = {
      devicons_dep,
    }
  },

  {
    "saecki/crates.nvim",
    version = "^0.3",
    dependencies = { planary_dep },
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  -- netrw icons
  {
    "prichrd/netrw.nvim",
    config = function()
      require"netrw".setup()
    end,
    ft = "netrw"
  },

  "ThePrimeagen/harpoon",

  -- themes
  {
    "EdenEast/nightfox.nvim",
    version = "^3",
  },

  -- detects system theme changes (dark/light)
  "vimpostor/vim-lumen",

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup {"*"}
    end,
    event = "BufRead",
  },
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

