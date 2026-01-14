vim.pack.add{
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  -- LSP server installer
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },

  -- Completion
  { src = "https://github.com/saghen/blink.cmp", opts = { branch = "main" } },

  -- Fuzzy finder
  { src = "https://github.com/nvim-telescope/telescope.nvim", opts = { branch = "0.1.x" } },

  -- Git
  { src = "https://github.com/tpope/vim-fugitive" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" }, -- Git signs in gutter

  -- Quality of Life (Rust-based)
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- Maintained in Rust
  { src = "https://github.com/numToStr/Comment.nvim" }, -- Fast commenting
  { src = "https://github.com/windwp/nvim-autopairs" }, -- Auto close brackets
  { src = "https://github.com/kylechui/nvim-surround" }, -- Surround operations
  { src = "https://github.com/ThePrimeagen/harpoon", opts = { branch = "harpoon2" }},

  -- File explorer
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- Icons
  { src = "https://github.com/nvim-tree/nvim-tree.lua" }, -- file explorer
  -- UI improvements
  { src = "https://github.com/folke/which-key.nvim" }, -- Show keybindings
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" }, -- Indent guides
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  { src = "https://github.com/feline-nvim/feline.nvim" },
}
