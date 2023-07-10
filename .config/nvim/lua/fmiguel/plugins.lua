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
    "folke/lazy.nvim",
    version = "^9",
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- order matters as latter ones are used as fallback
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        -- Show hidden files in telescope
        show_hidden = true,
      }
    end,
  },

  {
    "folke/noice.nvim",
    version = "^1",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      {
        "MunifTanjim/nui.nvim",
        version = "0.x.x"
      },
    },
    config = require"fmiguel.pconfig.noice".setup,
  },

  {
    "lewis6991/gitsigns.nvim",
    version = "0.x.x",
    config = function()
      require"gitsigns".setup {
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    version = "0.x.x",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
      require"nvim-treesitter.configs".setup {
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
        additional_vim_regex_highlighting = false,
      }
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = "0.x.x",
    config = require"fmiguel.pconfig.telescope".setup,
    keys = require"fmiguel.keybinds".telescope_keybinds,
    dependencies = {
      plenary_dep,
      devicons_dep,
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
        version = "0.x.x",
        dependencies = {
          {
            "neovim/nvim-lspconfig",
            version = "0.x.x",
          },
        },
      },
      {
        "jayp0521/mason-nvim-dap.nvim",
        version = "^2",
        dependencies = {
          "mfussenegger/nvim-dap",
          version = "0.x.x",
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
    config = function()
      require("nvim-autopairs").setup {
        check_ts = true,
        disable_filetype = { "TelescopePrompt" },
        -- do not trigger if a close pair is in the same line
        enable_check_bracket_line = false,
      }
    end,
    event = "InsertEnter",
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      devicons_dep,
    },
    config = function()
      require"lualine".setup {
        options = {
          globalstatus = true,
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff", "diagnostics"},
          lualine_c = {{"filename", path = 1}},
          lualine_x = {"filetype"},
          lualine_y = {"progress"},
          lualine_z = {"location"}
        },
      }
    end,
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

