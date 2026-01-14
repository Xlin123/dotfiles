-- Mason LSP Server Manager Configuration
local mason = require("mason")

-- Mason setup
mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- Keymaps for Mason
vim.keymap.set("n", "<leader>m", ":Mason<CR>", { desc = "Open Mason" })
