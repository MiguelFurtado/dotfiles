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

function M.load()
return require('lazy').setup {
    -- When a file is opened, this will switch the vim workspace to the project's root
    'airblade/vim-rooter',

    -- git support
    'lewis6991/gitsigns.nvim',

    -- highlights yanked region
    'machakann/vim-highlightedyank',

    -- treesitter provides better syntax highlight
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-file-browser.nvim',
            'kyazdani42/nvim-web-devicons',
        }
    },

    -- Configurations for Nvim LSP, DAP and Linters
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jayp0521/mason-nvim-dap.nvim',
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text', -- inline values
    'mfussenegger/nvim-dap-python',
    'j-hui/fidget.nvim', -- feedback while I wait for rust-analyzer

    -- lsp auto-completion
    'hrsh7th/nvim-cmp', -- the completion engine
    'hrsh7th/cmp-buffer', -- words from the curr buffer
    'hrsh7th/cmp-path', -- path auto-completion
    'hrsh7th/cmp-nvim-lsp', -- lsp
    'hrsh7th/cmp-nvim-lua', -- nvim lua api
    'L3MON4D3/LuaSnip', -- snippets engine
    'saadparwaiz1/cmp_luasnip', -- the luasnip driver for cmp

    'windwp/nvim-autopairs', -- auto-close pairs

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },

    -- proper tabs
    {
        'akinsho/bufferline.nvim',
        version = 'v3.*',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },

    -- netrw icons
    'prichrd/netrw.nvim',

    -- themes
    'Mofiqul/vscode.nvim',
    'folke/tokyonight.nvim',
    {
        'catppuccin/nvim',
        name = 'catppuccin',
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },
    'vimpostor/vim-lumen', -- auto dark mode
}
end

return M
