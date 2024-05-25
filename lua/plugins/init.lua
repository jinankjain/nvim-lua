local fn = vim.fn

-- Auto install packer on new machine
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim'
    }

    -- Colorscheme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = "require('catppuccin-config')"
    }

    -- LSP configuration
    use {
        "williamboman/mason.nvim",
        requires = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        config = "require('mason-config')"
    }

    --- Git utilities
    use { 'tpope/vim-fugitive' }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        event = "BufWinEnter",
        config = "require('treesitter-config')"
    }

    -- Bottom Line
    use {
        'hoob3rt/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        event = "BufWinEnter",
        config = "require('lualine-config')"
    }

    -- Tab Bar at the top
    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        event = "BufWinEnter",
        config = "require('bufferline-config')"
    }

    -- File explorer for the VIM
    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        cmd = "NvimTreeToggle",
        config = "require('nvim-tree-config')"
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
            'nvim-tree/nvim-web-devicons',
        } },
        config = "require('telescope-config')"
    }

    use {
        'ThePrimeagen/harpoon'
    }

    use {
        'neovim/nvim-lspconfig'
    }

    use {
        'hrsh7th/cmp-nvim-lsp'
    }

    use {
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = "require('lspsaga-config')"
    }

    --nvim-cmp
    use {
        'hrsh7th/cmp-buffer'
    }

    use {
        'hrsh7th/cmp-path'
    }

    use {
        'hrsh7th/cmp-cmdline'
    }

    use {
        'hrsh7th/nvim-cmp',
        config = "require('nvim-cmp-config')"
    }

    use {
        'hrsh7th/cmp-vsnip'
    }

    use {
        'hrsh7th/vim-vsnip'
    }

    use {
        'rafamadriz/friendly-snippets'
    }

    use {
        'folke/which-key.nvim',
        config = "require('which-key-config')"
    }

    use {
        'folke/flash.nvim',
        config = "require('flash-config')"
    }

    use {
        'numToStr/Comment.nvim',
        config = "require('comment-config')"
    }

    use {
        'nvim-pack/nvim-spectre',
        config = "require('spectre-config')"
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = "require('gitsigns-config')"
    }

    -- ufo, for code folding
    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = "require('ufo-config')"
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = "require('indentline-config')",
        after = "nvim-treesitter"
    }

    use {
        'mg979/vim-visual-multi',
        config = "require('vim-visual-multi-config')"
    }

    use {
        'mbbill/undotree'
    }

    use {
        'akinsho/toggleterm.nvim',
        config = "require('toggle-term-config')"
    }

    use {
        'Wansmer/treesj',
        config = "require('treesj-config')"
    }

    use {
        "sindrets/diffview.nvim",
        config = "require('diffview-config')"
    }

    use {
        'NeogitOrg/neogit',
        tag = 'v0.0.1',
        requires = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = "require('neogit-config')"
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
