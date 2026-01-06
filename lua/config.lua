vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.guifont = "JetBrainsMono_Nerd_Font:h11"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = 80

-- Map leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function toggle_space_indent()
	vim.opt.expandtab = not vim.opt.expandtab:get()
end

vim.keymap.set("n", "<Leader>s", toggle_space_indent)

-- Arrows to switch window
vim.keymap.set("n", "<Up>", "<C-w>k")
vim.keymap.set("n", "<Down>", "<C-w>j")
vim.keymap.set("n", "<Left>", "<C-w>h")
vim.keymap.set("n", "<Right>", "<C-w>l")
-- Shift + arrows to increase or reduce window size
vim.keymap.set("n", "<S-Up>", "<C-w>+")
vim.keymap.set("n", "<S-Down>", "<C-w>-")
vim.keymap.set("n", "<S-Left>", "<C-w><")
vim.keymap.set("n", "<S-Right>", "<C-w>>")
-- Leader + t open terminal and enter insert mode in it
-- vim.keymap.set("n", "<Leader>t", ":split<CR><C-W>j:terminal<CR>")
-- TODO: make it open in another buffertab
-- vim.keymap.set("n", "<Leader>T", ":tabnew<Bar>terminal<CR>")

-- Exit terminal with CTRL + q
vim.keymap.set("t", "<M-q>", "<C-\\><C-n>")

-- Close current buffer with Alt+w
vim.keymap.set("n", "<M-w>", function()
	-- Don't do anything if the buffer is unsaved
	if vim.bo.modified then
		print("Buffer is unsaved")
		return
	end

	local to_close = vim.api.nvim_get_current_buf()
	if #vim.api.nvim_list_bufs() == 1 then
		-- Only one empty buffer: we don't need to do anything
		if to_close == "" then
			return
		else
			vim.cmd("enew")
			vim.api.nvim_buf_delete(to_close, { force = false })
		end
	else
		vim.cmd("bprev")
		vim.api.nvim_buf_delete(to_close, { force = false })
	end
end, { silent = true })

-- Enable relative numbers by default
vim.opt.relativenumber = true

-- Toggle relative numbers with Leader r
vim.keymap.set("n", "<Leader>r", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end)

-- Sync clipboard with plus registry
vim.opt.clipboard = "unnamedplus"
