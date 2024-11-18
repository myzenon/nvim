return {
  {
    "kamykn/spelunker.vim",
    lazy = false,
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   opts = {
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = true,
  --       keymap = {
  --         accept = "<C-a>",
  --         accept_word = false,
  --         accept_line = false,
  --         next = "<C-]>",
  --         prev = "<C-[>",
  --         dismiss = "<C-s>",
  --       },
  --     },
  --   },
  -- },
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
    keys = function()
      local keys = {
        {
          "<space><space>",
          function()
            local harpoon = require("harpoon")
            harpoon:list():add()
            vim.notify("Add current file to Harpoon", vim.log.levels.INFO, { title = "Harpoon" })
          end,
          desc = "Add current file to Harpoon",
        },
        {
          "<space>q",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Toggle Harpoon List",
        },
      }
      for i = 1, 9 do
        table.insert(keys, {
          "<space>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
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
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
    keys = {
      "ga",
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    },
    cmd = {
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
    lazy = false,
  },
}
