return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("TimUntersberger/neogit")
    use("ThePrimeagen/git-worktree.nvim")
    use("lewis6991/gitsigns.nvim")

    use("sbdchd/neoformat")

    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    use("gruvbox-community/gruvbox")

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-cmdline")
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use("ray-x/cmp-treesitter")
    use("f3fora/cmp-spell")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("williamboman/nvim-lsp-installer")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use("simrat39/symbols-outline.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context")
end)
