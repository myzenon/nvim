return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- remove keymaps
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cA", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "gr", false }

      -- add keymaps
      keys[#keys + 1] = { "ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
      keys[#keys + 1] = {
        "cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
        has = "codeAction",
      }
      if require("lazyvim.util").has("inc-rename.nvim") then
        keys[#keys + 1] = {
          "cr",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename",
          has = "rename",
        }
      else
        keys[#keys + 1] = {
          "cr",
          vim.lsp.buf.rename,
          desc = "Rename",
          has = "rename",
        }
      end

      keys[#keys + 1] = {
        "E",
        vim.diagnostic.open_float,
        desc = "Open float diagnostic",
      }
      keys[#keys + 1] = {
        "gR",
        "<cmd>Telescope lsp_references<cr>",
        desc = "References",
      }
      opts.setup.eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" or client.name == "vtsls" or client.name == "volar" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    keys = {
      { "<leader>fs", "<cmd> FlutterRun<CR>", desc = "Flutter Run" },
      { "<leader>fe", "<cmd> FlutterEmulators<CR>", desc = "Flutter Emulators" },
      { "<leader>fc", "<cmd> FlutterLogClear<CR>", desc = "Flutter Log Clear" },
      { "<leader>fo", "<cmd> FlutterOutlineToggle<CR>", desc = "Flutter Outline Toggle" },
      { "<leader>fq", "<cmd> FlutterQuit<CR>", desc = "Flutter Quit" },
      { "<leader>fr", "<cmd> FlutterRestart<CR>", desc = "Flutter Restart" },
      { "<leader>fR", "<cmd> FlutterReload<CR>", desc = "Flutter Reload" },
      { "<leader>fd", "<cmd> FlutterVisualDebug<CR>", desc = "Flutter Visual Debug" },
      { "<leader>fC", '<cmd> lua require("telescope").extensions.flutter.commands()<CR>', desc = "Flutter Commands" },
    },
    config = function()
      local flutter_tools = require("flutter-tools")
      require("telescope").load_extension("flutter")

      flutter_tools.setup({
        ui = {
          -- the border type to use for all floating windows, the same options/formats
          -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
          border = "rounded",
        },
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = false,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
          },
        },
        widget_guides = {
          enabled = false,
        },
        dev_log = {
          enabled = true,
          open_cmd = "edit", -- command to use to open the log buffer
        },
        dev_tools = {
          autostart = false, -- autostart devtools server if not detected
          auto_open_browser = false, -- Automatically opens devtools in the browser
        },
        outline = {
          open_cmd = "30vnew", -- command to use to open the outline buffer
          auto_open = false, -- if true this will open the outline automatically when it is first populated
        },
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            foreground = true, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            enableSnippets = true,
          },
        },
      })
    end,
  },
  -- {
  --
  --   "napmn/react-extract.nvim",
  --   keys = {
  --     {
  --       "<leader>re",
  --       function()
  --         require("react-extract").extract_to_new_file()
  --       end,
  --       desc = "Extract JSX to component in a new file",
  --       mode = "v",
  --     },
  --     {
  --       "<leader>rc",
  --       function()
  --         require("react-extract").extract_to_current_file()
  --       end,
  --       desc = "Extract JSX to component in a current file",
  --       mode = "v",
  --     },
  --   },
  -- },
}
