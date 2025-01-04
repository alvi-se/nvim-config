vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.guifont = "JetBrainsMono_Nerd_Font:h11"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


-- Map leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Toggle Neo-tree
vim.keymap.set("n", "<C-n>", "<Cmd> Neotree toggle<CR>")
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
vim.keymap.set("n", "<Leader>t", ":split<CR><C-W>j:terminal<CR>")
-- TODO: make it open in another buffertab
vim.keymap.set("n", "<Leader>T", ":tabnew<Bar>terminal<CR>")

vim.opt.clipboard = "unnamedplus"

-- Telescope keybindings
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })


-- Set theme to Monokai tasty
vim.g.vim_monokai_tasty_italic = 1
-- vim.cmd("colorscheme vim-monokai-tasty")
-- vim.g.airline_theme = "monokai_tasty"

-- Airline
vim.g.airline_powerline_fonts = 1

