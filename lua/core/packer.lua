vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)

    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "pmizio/typescript-tools.nvim"
    use "neovim/nvim-lspconfig"
    use "VonHeikemen/lsp-zero.nvim"
    use "williamboman/mason.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip"
    use "rebelot/kanagawa.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "folke/tokyonight.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "lewis6991/gitsigns.nvim"
    use { "nvim-telescope/telescope.nvim",tag = "0.1.6" }
    use ("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use "tpope/vim-commentary"
    use "Mofiqul/vscode.nvim"
    use "onsails/lspkind.nvim"

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }

    use { "nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	}

end)

