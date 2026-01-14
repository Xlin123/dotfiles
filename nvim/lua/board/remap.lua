-- Core keymaps
local keymap = vim.keymap.set

-- Leader key is set in options.lua

-- File explorer (Oil.nvim replaces netrw)
keymap("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw (fallback)" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Better paste (don't yank replaced text)
keymap("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Center search results
keymap("n", "n", "nzzzv", { desc = "Next search result" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Keep cursor in place when joining lines
keymap("n", "J", "mzJ`z", { desc = "Join lines" })

-- Better escape
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Clear search highlighting
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlighting" })

-- Save file
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Quickfix navigation
keymap("n", "<leader>j", ":cnext<CR>zz", { desc = "Next quickfix item" })
keymap("n", "<leader>k", ":cprev<CR>zz", { desc = "Previous quickfix item" })
