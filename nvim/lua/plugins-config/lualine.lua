local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

lualine.setup({
	options = {
		theme = require("core.colorscheme").colorscheme,
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},

	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_c = {
			"filename",
			{
				"lsp_progress",
				spinner_symbols = { " ", " ", " ", " ", " ", " " },
			},
		},

		lualine_x = {
			-- "filesize",
			{
				"fileformat",
				symbols = {
					unix = " LF",
					dos = " CRLF",
					mac = " CR",
				},
			},
			"encoding",
			"filetype",
		},
	},
})
