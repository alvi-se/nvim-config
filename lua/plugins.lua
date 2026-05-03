vim.pack.add({
	-- Colorscheme
	"https://github.com/scottmckendry/cyberdream.nvim",
	"https://github.com/tpope/vim-surround",
	"https://github.com/tpope/vim-fugitive",
	-- Auto close pairs
	"https://github.com/windwp/nvim-autopairs",
	-- Use Treesitter to close HTML tags
	"https://github.com/windwp/nvim-ts-autotag",
	-- Dependency for lualine.nvim and bufferline.nvim
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	-- External tool manager
	"https://github.com/williamboman/mason.nvim",
	-- Debugger
	"https://github.com/mfussenegger/nvim-dap",
	-- Bridges the gap between Mason and nvim-dap
	"https://github.com/jay-babu/mason-nvim-dap.nvim",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	-- Git signs in editor
	"https://github.com/lewis6991/gitsigns.nvim",
	-- Dependency of telescope.nvim and neo-tree.nvim
	"https://github.com/nvim-lua/plenary.nvim",
	-- File search and other stuff
	"https://github.com/nvim-telescope/telescope.nvim",
	-- Find frequent and recent files using Telescope
	"https://github.com/nvim-telescope/telescope-frecency.nvim",
	-- Discord rich presence
	"https://github.com/andweeb/presence.nvim",
	-- Tab-like buffers on top of editor
	"https://github.com/akinsho/bufferline.nvim",
	-- Dependency of neo-tree.nvim
	"https://github.com/MunifTanjim/nui.nvim",
	-- File manager
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	-- Easily configure LSP
	"https://github.com/neovim/nvim-lspconfig",
	-- Bridges the gap between lspconfig and Mason
	"https://github.com/williamboman/mason-lspconfig.nvim",
	-- Semantic syntax highlighting and more
	"https://github.com/nvim-treesitter/nvim-treesitter",
	-- Code completion
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range('1.x'),
	},
	-- Better terminal
	"https://github.com/akinsho/toggleterm.nvim",
	-- Dashboard
	"https://github.com/goolord/alpha-nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/which-key.nvim",
})

-------------------------------------------------

require("gitsigns").setup()
require("presence").setup()
require("ibl").setup()
require("trouble").setup()
require("which-key").setup()
require("nvim-ts-autotag").setup()
require("mason").setup()


require("plugins.lsp")
require("plugins.terminal")
require("plugins.dap")
require("plugins.telescope")

-------------------------------------------------

-- Colorscheme
vim.cmd("colorscheme cyberdream")

-------------------------------------------------

-- Autopairs
require("nvim-autopairs").setup({
	check_ts = true,
})

-------------------------------------------------

-- Lualine
require("lualine").setup({
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
})

-------------------------------------------------

local bufferline = require("bufferline")
-- Set Alt+x keybinding to view tab x
for i = 0, 9 do
	vim.keymap.set("n", "<M-" .. i .. ">", function()
		vim.cmd("BufferLineGoToBuffer " .. i)
		bufferline.go_to(i)
	end, { silent = true })
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
	},
})

-------------------------------------------------

-- Dashboard
require("alpha").setup(require("alpha.themes.dashboard").config)

-------------------------------------------------

-- Toggle Neo-tree
vim.keymap.set('n', '<C-n>', '<CMD>Neotree toggle reveal<CR>', { desc = "Toggle Neo-tree" })

-------------------------------------------------

-- Toggle Trouble (diagnostics)
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle focus=false win.position=bottom<cr>', { desc = "LSP Definitions / references / ... (Trouble)" })

-------------------------------------------------

-- Buffer Local Keymaps (which-key)
vim.keymap.set('n', '<leader>?', function() require('which-key').show({ global = false }) end, { desc = "Buffer Local Keymaps (which-key)" })
