return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Load before all other start plugins
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			styles = {
				comments = { italic = false },
			},
		})
		-- Other styles: 'tokyonight-storm', 'tokyonight-moon', 'tokyonight-day'
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
