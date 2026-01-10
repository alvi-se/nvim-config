require("toggleterm").setup({
	open_mapping = "<Leader>t",
	insert_mappings = false,
	terminal_mappings = false,
	shade_terminals = false,
	autochdir = true,
	highlights = {
		Normal = {
			guibg = "#0f1012",
		},
		NormalFloat = {
			guibg = "#0f1012",
		},
		FloatBorder = {
			guibg = "#0f1012",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	display_name = "Lazygit",
	hidden = true,
	direction = "float",
})

vim.keymap.set("n", "<leader>G", function ()
		lazygit:toggle()
	end,
	{
		silent = true,
		desc = "Open Lazygit in floating terminal"
	})

local btop = Terminal:new({
	cmd = "btop",
	hidden = true,
	direction = "float",
})

vim.keymap.set("n", "<leader>B", function()
	btop:toggle()
end,
	{
		silent = true,
		desc = "Open btop in floating terminal"
	})

local lazydocker = Terminal:new({
	cmd = "lazydocker",
	display_name = "Lazydocker",
	hidden = true,
	direction = "float",
})


vim.keymap.set("n", "<leader>D", function ()
		lazydocker:toggle()
	end,
	{
		silent = true,
		desc = "Open Lazydocker in floating terminal"
	})

