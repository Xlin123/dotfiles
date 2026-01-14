-- Install plugins first
require("board.plugins")

-- Core configuration
require("board.options")
require("board.remap")
require("board.indentation")
require("board.colorscheme")

-- LSP and completion
require("board.mason-config")
require("board.lsp")
require("board.blink-config")

-- Tools
require("board.telescope-config")
require("board.fugitive-config")
require("board.gitsigns-config")
require("board.oil-config")
require("board.nvim-tree-config")
--require("board.harpoon-config")
-- Quality of life
require("board.qol-config")
