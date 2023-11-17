return {
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    keys = {
      {
        "<leader>gg",
        ":LazyGit<CR>",
        desc = "LazyGit",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>gb",
        ":Gitsigns blame_line<CR>",
        desc = "Git blame",
      },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = true,
    keys = {
      {
        "<leader>gd",
        ":Gvdiffsplit<CR>",
        desc = "Git Verical Diff",
      },
    },
  },
}
