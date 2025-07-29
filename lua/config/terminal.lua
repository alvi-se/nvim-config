require("toggleterm").setup({
    open_mapping = [[<Leader>t]],
    insert_mappings = false,
    terminal_mappings = false,
    shade_terminals = true,
})


local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    display_name = "Lazygit",
    hidden = true,
    direction = "float",
})

vim.keymap.set("n", "<leader>g", function()
    lazygit:toggle()
end, { silent = true })


local btop = Terminal:new({
    cmd = "btop",
    hidden = true,
    direction = "float",
})

vim.keymap.set("n", "<leader>b", function()
    btop:toggle()
end, { silent = true })

local lazydocker = Terminal:new({
    cmd = "lazydocker",
    display_name = "Lazydocker",
    hidden = true,
    direction = "float",
})

vim.keymap.set("n", "<leader>d", function()
    lazydocker:toggle()
end, { silent = true })
