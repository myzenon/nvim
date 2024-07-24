return {
  {
    "kamykn/spelunker.vim",
    lazy = false,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-a>",
          accept_word = false,
          accept_line = false,
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-s>",
        },
      },
    },
  },
  {
    "echasnovski/mini.files",
    keys = {
      {
        "ml",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      { "<leader>fM", false },
    },
  },
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },
  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "+", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "-", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    keys = {
      {
        "+=",
        "<cmd>SymbolsOutline<cr>",
        desc = "Symbols Outline",
      },
    },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },
  {
    "gioele/vim-autoswap",
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
    keys = {
      {
        "<C-x>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():add()
          vim.notify("Add current file to Harpoon", vim.log.levels.INFO, { title = "Harpoon" })
        end,
        desc = "Add current file to Harpoon",
      },
      {
        "<C-c>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Toggle Harpoon List",
      },
      {
        "<C-q>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(1)
        end,
        desc = "Select Harpoon 1",
      },
      {
        "<C-w>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(2)
        end,
        desc = "Select Harpoon 2",
      },
      {
        "<C-e>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(3)
        end,
        desc = "Select Harpoon 3",
      },
      {
        "<C-z>",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(4)
        end,
        desc = "Select Harpoon 4",
      },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        silent_chdir = false,
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
      })
    end,
  },
  { "michaeljsmith/vim-indent-object" },
  {
    "aurum77/live-server.nvim",
    run = function()
      require("live_server.util").install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },
  {
    "jamestthompson3/nvim-remote-containers",
  },
}
