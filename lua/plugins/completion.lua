return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				-- Build step needed for regex support in snippets.
				-- Not supported in many Windows environments.
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			opts = {},
		},
	},
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			-- See `:help ins-completion` for why 'default' is recommended
			preset = "default",
		},
		appearance = {
			-- 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},
		sources = {
			default = { "lsp", "path", "snippets" },
		},
		snippets = { preset = "luasnip" },
		-- Use the Lua fuzzy matcher (vs optional rust binary via 'prefer_rust_with_warning')
		fuzzy = { implementation = "lua" },
		signature = { enabled = true },
	},
}
