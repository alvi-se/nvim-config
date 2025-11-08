return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- Load the colorscheme here
			vim.cmd("colorscheme cyberdream")
		end,
	},
	-- Git wrapper
	{ "tpope/vim-fugitive" },
	-- Git graph
	{ "rbong/vim-flog" },
	{ "tpope/vim-surround" },
	-- Auto close pairs
	{
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true,
		},
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_x = {
					"encoding",
					function()
						if vim.opt.expandtab:get() then
							return "󱁐 " .. vim.opt.shiftwidth:get() .. " spaces"
						else
							return " tabs"
						end
					end,
					"fileformat",
					"filetype",
				},
			},
		},
	},
	{ "vim-airline/vim-airline-themes" },
	-- Debugger
	{ "mfussenegger/nvim-dap" },
	-- { 'airblade/vim-gitgutter' },
	-- Git signs in editor
	{ "lewis6991/gitsigns.nvim", opts = {} },
	-- File search
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			-- Project manager
			"ahmedkhalf/project.nvim",
		},
		config = function()
			-- Telescope keybindings
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fr", ":Telescope frecency<CR>", { desc = "Telescope frecency" })

			-- Load project_nvim
			require("project_nvim").setup({})
			require("telescope").load_extension("projects")

			-- Load frecency
			require("telescope").load_extension("frecency")
		end,
	},
	-- Discord rich presence
	{ "andweeb/presence.nvim", opts = {} },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- Easily configure LSP
	{ "neovim/nvim-lspconfig" },
	-- Mason, for managing 3rd party tools (LSP, DAP, linters, formatters)
	{ "williamboman/mason.nvim" },
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
				auto_install = true,
			})
		end,
	},
	-- Code completion
	{
		"saghen/blink.cmp",
		version = "1.*",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },
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
				diagnostics = "nvim_lsp",
			},
		},
	},
	-- GitHub Copilot
	{ "zbirenbaum/copilot.lua" },
	-- Better terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},
	-- Dashboard
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	-- Helm filetype detection for the LSP
	{ "qvalentin/helm-ls.nvim", ft = "helm" },
}
