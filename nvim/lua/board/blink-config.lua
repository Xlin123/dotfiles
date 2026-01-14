-- Blink.cmp - Fast completion plugin
local blink_ok, blink = pcall(require, "blink.cmp")
if not blink_ok then
	return
end

blink.setup({
	-- 'default' for mappings similar to built-in completion
	-- 'super-tab' for tab completion
	-- 'enter' for enter to accept
	keymap = {
		preset = "default",
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
		["<C-y>"] = { "select_and_accept" },

		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		-- Optionally disable cmdline completions
		-- cmdline = {},
	},

	completion = {
		accept = {
			auto_brackets = {
				enabled = true,
			},
		},

		menu = {
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
			},
		},

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
			window = {
				border = "rounded",
			},
		},

		ghost_text = {
			enabled = true,
		},
	},

	signature = {
		enabled = true,
		window = {
			border = "rounded",
		},
	},
})
