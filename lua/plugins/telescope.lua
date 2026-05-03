-- Live grep
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "Live grep" })

-- Find files
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = "Find files" })

-- Frecency extension
require("telescope").load_extension("frecency")
vim.keymap.set('n', '<leader>fr', '<CMD>Telescope frecency<CR>', { desc = "Frecency" })
