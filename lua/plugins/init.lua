local fn = vim.fn

-- Auto install packer on new machine
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim'
    }

    -- Syntax highlighting for circom
    use {
	    'iden3/vim-circom-syntax'
    }

    -- Colorscheme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = "require('catppuccin-config')"
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        event = "BufWinEnter",
        config = "require('treesitter-config')"
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true},
        event = "BufWinEnter",
        config = "require('lualine-config')"
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        event = "BufWinEnter",
        config = "require('bufferline-config')"
    }

    -- This provides awesome rainbows {{{{}}}}
    use {
        'p00f/nvim-ts-rainbow',
        after = "nvim-treesitter"
    }

    use {
        'folke/which-key.nvim',
        config = "require('which-key-config')"
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        cmd = "NvimTreeToggle",
        config = "require('nvim-tree-config')"
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-tree/nvim-web-devicons',
        }},
        cmd = "Telescope",
        config = "require('telescope-config')"
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        }
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            { 'antosha417/nvim-lsp-file-operations', config = true },
        },
        config = "require('lsp')"
    }
    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/vim-vsnip'}
    use {'onsails/lspkind-nvim'}
    use {
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        config = "require('mason-config')"
    }
    use {'tami5/lspsaga.nvim', config = "require('lspsaga-config')"}

    use({'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'})

    --- Autodetect indentation
    use {'tpope/vim-sleuth'}

    --- Git utilities
    use {'tpope/vim-fugitive'}

    use { 'stevearc/dressing.nvim' }
--
--    use { 'stevearc/conform.nvim', config = "require('formatter-config')" }

    use { 'szw/vim-maximizer' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
