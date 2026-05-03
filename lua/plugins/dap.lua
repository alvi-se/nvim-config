

local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	print("nvim-dap not installed!")
	return
end

require("dap").set_log_level("INFO") -- Helps when configuring DAP, see logs with :DapShowLog

require("mason-nvim-dap").setup({
	handlers = {},
	ensure_installed = {"python"},
})

require("nvim-dap-virtual-text").setup()


-----------------
-- Keybindings --
-----------------

-- Toggle breakpoint
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

-- Continue
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = "Continue" })

-- Run to cursor
vim.keymap.set('n', '<leader>dC', function() require('dap').run_to_cursor() end, { desc = "Run to Cursor" })

-- Step over
vim.keymap.set('n', '<leader>ds', function() require('dap').step_over() end, { desc = "Step Over" })

-- Step into
vim.keymap.set('n', '<leader>dS', function() require('dap').step_into() end, { desc = "Step Into" })

-- Terminate
vim.keymap.set('n', '<leader>dT', function() require('dap').terminate() end, { desc = "Terminate" })
