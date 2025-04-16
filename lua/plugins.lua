return {
    { 'rbong/vim-flog' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-surround' },
    -- Auto close pairs
    { "windwp/nvim-autopairs",      opts = {} },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    },
    { 'vim-airline/vim-airline-themes' },
    {
        'patstockwell/vim-monokai-tasty',
        init = function()
            -- Set theme to Monokai tasty
            vim.g.vim_monokai_tasty_italic = 1
            vim.cmd("colorscheme vim-monokai-tasty")
            vim.g.airline_theme = "monokai_tasty"
        end
    },
    -- Debugger
    { 'mfussenegger/nvim-dap' },
    -- { 'airblade/vim-gitgutter' },
    -- Git signs in editor
    { "lewis6991/gitsigns.nvim",       opts = {} },
    -- File search
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim' ,
            'nvim-telescope/telescope-frecency.nvim',
            -- Project manager
            'ahmedkhalf/project.nvim'
        },
        config = function()
            -- Telescope keybindings
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fr', ':Telescope frecency<CR>', { desc = 'Telescope frecency' })

            -- Load project_nvim
            require("project_nvim").setup({})
            require("telescope").load_extension("projects")

            -- Load frecency
            require("telescope").load_extension("frecency")
        end
    },
    -- Discord rich presence
    { 'andweeb/presence.nvim',   opts = {} },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
        },
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- Easily configure LSP
    { "neovim/nvim-lspconfig" },
    -- Mason, for managing 3rd party tools (LSP, DAP, linters, formatters)
    { "williamboman/mason.nvim", },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "williamboman/mason-lspconfig.nvim",
    },
    -- Semantic syntax highlighting and more
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "typescript", "rust", "go", "tsx", "dockerfile" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                auto_install = true
            })
        end
    },
    -- Code completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source
            "hrsh7th/cmp-buffer",       -- Buffer source
            "hrsh7th/cmp-path",         -- Path source
            "hrsh7th/cmp-cmdline",      -- Cmdline source
            "L3MON4D3/LuaSnip",         -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet completion
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                diagnostics = "nvim_lsp"
            }
        }
    },
    -- GitHub Copilot
    { "zbirenbaum/copilot.lua" },
    { "zbirenbaum/copilot-cmp" },

    -- Better terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
    },
    -- Dashboard
    {
        'goolord/alpha-nvim',
        config = function()
            require('alpha').setup(require 'alpha.themes.dashboard'.config)
        end
    },
}
