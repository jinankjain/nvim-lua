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
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        event = "BufWinEnter",
        config = "require('lualine-config')"
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        event = "BufWinEnter",
        config = "require('bufferline-config')"
    }

    -- This provides awesome rainbows {{{{}}}}
    use {
        'p00f/nvim-ts-rainbow',
        after = "nvim-treesitter"
    }

    use {
        'b0o/mapx.nvim',
        before = "which-key.nvim",
        config = "require('mapx-config')"
    }

    use {
        'folke/which-key.nvim',
        config = "require('which-key-config')"
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        cmd = "NvimTreeToggle",
        config = "require('nvim-tree-config')"
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        cmd = "Telescope",
        config = "require('telescope-config')"
    }

    use {'neovim/nvim-lspconfig', config = "require('lsp')"}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/vim-vsnip'}
    use {'onsails/lspkind-nvim'}
    use {'williamboman/nvim-lsp-installer'}
    use {'tami5/lspsaga.nvim', config = "require('lspsaga-config')"}

    use({'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'})

    --- Autodetect indentation
    use {'tpope/vim-sleuth'}

    --- Git utilities
    use {'tpope/vim-fugitive'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
