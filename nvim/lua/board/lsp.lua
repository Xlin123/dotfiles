-- Native LSP Configuration with Mason
-- Mason will handle LSP server installation and basic setup
-- This file contains LSP keybindings and additional configuration

-- Disable inlay hints by default
vim.lsp.inlay_hint.enable(false)

-- LSP Keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		-- Helper function for setting keymaps
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
		end

		-- Navigation with telescope
		local builtin = require("telescope.builtin")
		map("n", "gd", builtin.lsp_definitions, "Go to definition")
		map("n", "gr", builtin.lsp_references, "Show references")
		map("n", "gi", builtin.lsp_implementations, "Go to implementation")
		map("n", "gt", builtin.lsp_type_definitions, "Go to type definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")

		-- Hover and help
		map("n", "K", function()
			vim.lsp.buf.hover({
				border = "rounded",
				close_events = {
					"CursorMoved",
					"CursorMovedI",
					"InsertCharPre",
					"BufWinLeave",
				},
			})
		end, "Hover documentation")
		map("n", "gK", vim.lsp.buf.signature_help, "Signature help")

		-- Actions
		map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
		map("n", "<leader>bf", vim.lsp.buf.format, "Format buffer")

		-- Format and save
		map("n", "<leader>bw", function()
			vim.lsp.buf.format()
			vim.cmd("write")
		end, "Format and save")

		-- Diagnostics
		map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostics")
		map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
		map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
		map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")

		-- Workspace
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, "List workspace folders")

		-- Highlight references on cursor hold
		if client.server_capabilities.documentHighlightProvider then
			local highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = highlight_group })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = bufnr,
				group = highlight_group,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = bufnr,
				group = highlight_group,
				callback = vim.lsp.buf.clear_references,
			})
		end

		-- Auto-format on save (optional - uncomment if desired)
		-- if client.server_capabilities.documentFormattingProvider then
		-- 	vim.api.nvim_create_autocmd("BufWritePre", {
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			vim.lsp.buf.format({ async = false })
		-- 		end,
		-- 	})
		-- end
	end,
})

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Diagnostic signs
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- LSP handlers with borders
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

for k, v in pairs(handlers) do
	vim.lsp.handlers[k] = v
end


-- Customize Dart LSP
vim.lsp.config('dartls', {
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
      enableSnippets = true,
    }
  },
})

-- Customize Lua LSP
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- Enable after configuration
vim.lsp.enable('dartls')
vim.lsp.enable('lua_ls')
