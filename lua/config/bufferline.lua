local bufferline = require("bufferline")

for i = 0, 9 do
	vim.keymap.set("n", "<M-" .. i ..">", function()
		vim.cmd("BufferLineGoToBuffer " .. i)
		bufferline.go_to(i)
	end, { silent = true })
end
