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
