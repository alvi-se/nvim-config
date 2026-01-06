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
	{ "tpope/vim-surround" },
	-- Auto close pairs
	{
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true,
		},
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
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
	-- Debugger
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},
			{
				"<leader>ds",
				function()
					require("dap").step_over()
				end,
			},
			{
				"<leader>dS",
				function()
					require("dap").step_into()
				end,
			},
			{
				"<leader>dT",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = true,
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
	},
	-- Git signs in editor
	{ "lewis6991/gitsigns.nvim", opts = {} },
	-- File search
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
		},
		keys = {
			{ "<leader>fr", require("telescope.builtin").live_grep, desc = "Live grep"},
			{ "<leader>fg", require("telescope.builtin").find_files, desc = "Find files" },
			{ "<leader>fr", "<cmd>Telescope frecency<CR>", desc = "Frecency"}
		},
		config = function()
			-- Load frecency
			require("telescope").load_extension("frecency")
		end,
	},
	-- Discord rich presence
	{ "andweeb/presence.nvim", opts = {} },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
			},
		},
		init = function()
			local bufferline = require("bufferline")
			-- Set Alt+x keybinding to view tab x
			for i = 0, 9 do
				vim.keymap.set("n", "<M-" .. i .. ">", function()
					vim.cmd("BufferLineGoToBuffer " .. i)
					bufferline.go_to(i)
				end, { silent = true })
			end
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<C-n>",
				"<Cmd>Neotree toggle<CR>",
				desc = "Toggle Neo-tree",
			},
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- Easily configure LSP
	{ "neovim/nvim-lspconfig" },
	-- Mason, for managing 3rd party tools (LSP, DAP, linters, formatters)
	{
		"williamboman/mason.nvim",
		lazy = true,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
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
	-- Better terminal
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
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
