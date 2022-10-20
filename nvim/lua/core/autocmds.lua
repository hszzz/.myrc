local nvimAutoGroup = vim.api.nvim_create_augroup("nvimAutoGroup", {
	clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
	nested = true,
	group = nvimAutoGroup,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

autocmd("BufWritePost", {
	group = nvimAutoGroup,
	callback = function()
		if vim.fn.expand("<afile>") == "lua/plugins.lua" then
			vim.api.nvim_command("source lua/plugins.lua")
			vim.api.nvim_command("PackerSync")
		end
	end,
})

autocmd("BufWritePre", {
	group = nvimAutoGroup,
	pattern = { "*.lua", "*.py", "*.sh", "*.c", "*.cc", "*.cpp", "*.h", "*.go" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

autocmd("TextYankPost", {
	group = nvimAutoGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})