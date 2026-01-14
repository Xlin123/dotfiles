-- Enhanced Native Neovim Configuration
-- 
-- Features:
--   • Mason for LSP server management
--   • Blink.cmp for fast completion
--   • Telescope for fuzzy finding
--   • Fugitive + Gitsigns for Git integration
--   • Oil.nvim for file exploration
--   • Quality of life plugins (Comment, Autopairs, Surround, etc.)
--
-- First run:
--   1. Open Neovim - plugins will auto-install
--   2. Run :Mason to install LSP servers
--   3. Restart Neovim
--
-- Key bindings:
--   <Space> = Leader key
--   <Space>pf = Find files
--   <Ctrl-p> = Git files
--   <Space>ps = Live grep
--   - = Open Oil file explorer
--   <Space>gs = Git status (Fugitive)
--   gcc = Comment line
--   ys<motion><char> = Surround
--   <Space>m = Open Mason
--
-- See individual config files in lua/board/ for more details

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.opt.winblend = 10
vim.opt.termguicolors = true

require("board")
