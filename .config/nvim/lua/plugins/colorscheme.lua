return {
  { "nanotech/jellybeans.vim", lazy = true },
  { "tribela/vim-transparent", lazy = false },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
}
