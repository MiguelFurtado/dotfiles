local plugins = {}

function plugins.load()
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- When a file is opened, this will switch the vim workspace to the project's root
    use 'airblade/vim-rooter'

    -- git support
    use 'airblade/vim-gitgutter'

    -- highlights yanked region
    use 'machakann/vim-highlightedyank'

    -- nerdtree
    use 'preservim/nerdtree'
    use 'ryanoasis/vim-devicons'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- treesitter provides better syntax highlight
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', cmd = {'make'}}
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'kyazdani42/nvim-web-devicons'

    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    --
    -- lsp auto-completion
    use 'hrsh7th/nvim-cmp' -- the completion engine
    use 'hrsh7th/cmp-buffer' -- words from the curr buffer
    use 'hrsh7th/cmp-path' -- path auto-completion
    use 'hrsh7th/cmp-nvim-lsp' -- lsp
    use 'hrsh7th/cmp-nvim-lua' -- nvim lua api
    use 'L3MON4D3/LuaSnip' -- snippets engine
    use 'saadparwaiz1/cmp_luasnip' -- the luasnip driver for cmp

    -- auto-close pairs
    use 'windwp/nvim-autopairs'

    -- use 'simrat39/symbols-outline.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- themes
    use 'Mofiqul/vscode.nvim'
    use 'tamelion/neovim-molokai'
    use 'sainnhe/sonokai'
    use 'chriskempson/base16-vim'
    use 'folke/tokyonight.nvim'
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
            require("catppuccin").setup()
            vim.api.nvim_command "colorscheme macchiato"
        end
    }
end)
end

return plugins

