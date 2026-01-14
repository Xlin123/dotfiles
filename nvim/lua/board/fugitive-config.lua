-- Fugitive - Git Integration
-- Fugitive is automatically loaded, just need to set up keymaps

-- Main Git command
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

-- Git operations
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gP", ":Git pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gf", ":Git fetch<CR>", { desc = "Git fetch" })

-- Git diff
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff split" })
vim.keymap.set("n", "<leader>gv", ":Gvdiffsplit<CR>", { desc = "Git diff vertical" })

-- Git blame
vim.keymap.set("n", "<leader>gB", ":Git blame<CR>", { desc = "Git blame" })

-- Git log
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>gL", ":Git log --oneline<CR>", { desc = "Git log oneline" })

-- Git write and read
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git add current file" })
vim.keymap.set("n", "<leader>gr", ":Gread<CR>", { desc = "Git checkout current file" })

-- Git mergetool - useful in merge conflicts
vim.keymap.set("n", "<leader>gm", ":Git mergetool<CR>", { desc = "Git mergetool" })

-- Quick commit
vim.keymap.set("n", "<leader>gcc", ":Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gca", ":Git commit --amend<CR>", { desc = "Git commit amend" })

-- In Fugitive buffers, these shortcuts are useful:
-- s - Stage file
-- u - Unstage file
-- = - Toggle diff
-- cc - Create commit
-- ca - Amend commit
-- ce - Extend commit
-- cw - Reword commit
