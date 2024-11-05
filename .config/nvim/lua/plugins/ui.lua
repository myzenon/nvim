return {
  {
    "rcarriga/nvim-notify",
    opts = {
      fps = 120,
      stages = "slide",
      render = "compact",
      top_down = false,
      timeout = 1000,
    },
  },
  {
    "folke/noice.nvim",
    enabled = true,
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      -- local focused = true
      -- vim.api.nvim_create_autocmd("FocusGained", {
      --   callback = function()
      --     focused = true
      --   end,
      -- })
      -- vim.api.nvim_create_autocmd("FocusLost", {
      --   callback = function()
      --     focused = false
      --   end,
      -- })
      -- table.insert(opts.routes, 1, {
      --   filter = {
      --     cond = function()
      --       return not focused
      --     end,
      --   },
      --   view = "notify_send",
      --   opts = { stop = false },
      -- })
      --
      -- opts.commands = {
      --   all = {
      --     -- options for the message history that you get with `:Noice`
      --     view = "split",
      --     opts = { enter = true, format = "details" },
      --     filter = {},
      --   },
      -- }
      --
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "markdown",
      --   callback = function(event)
      --     vim.schedule(function()
      --       require("noice.text.markdown").keys(event.buf)
      --     end)
      --   end,
      -- })

      opts.views = {
        hover = {
          position = {
            row = 2,
            col = 0,
          },
          border = {
            padding = { 0, 1 },
            style = "rounded",
          },
          win_options = {
            winblend = 10,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "onedark"
      opts.sections.lualine_z = {}
      table.insert(opts.sections.lualine_z, {
        function()
          local result = vim.fn["VMInfos"]()
          -- local current = result.current
          -- local total = result.total
          local ratio = result.ratio
          local patterns = result.patterns
          -- local status = result.status
          return "%#St_InsertMode# "
            .. " MULTI "
            .. "%#St_lspWarning#  "
            .. patterns[1]
            .. " "
            .. "%#StText#"
            .. " "
            .. ratio
        end,
      })
    end,
  },
  -- filename
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#99ad6a", guifg = "#3b3b3b" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "(*)" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "tamton-aquib/duck.nvim",
    config = function()
      vim.keymap.set("n", "<leader>dd", function()
        require("duck").hatch("😱", 1)
      end, {})
      vim.keymap.set("n", "<leader>dk", function()
        require("duck").cook()
      end, {})
      vim.keymap.set("n", "<leader>da", function()
        require("duck").cook_all()
      end, {})
    end,
  },
}
