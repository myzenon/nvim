return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css-lsp",
        "cssmodules-language-server",
        -- "eslint_d",
        "html-lsp",
        "vue-language-server",
        "json-lsp",
        "dockerfile-language-server",
        "intelephense",
        "stylua",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "graphql-language-service-cli",
      })
    end,
  },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cmake",
        "cpp",
        "css",
        "gitignore",
        "http",
        "php",
        "rust",
        "tsx",
        "toml",
        "json",
        "yaml",
        "html",
        "lua",
        "vue",
        "dart",
        "markdown",
        "markdown_inline",
        "scss",
        "sql",
        "graphql",
      },

      indent = {
        enable = true,
        disable = { "dart" },
      },

      -- https://github.com/nvim-treesitter/playground#query-linter
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },

      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = true, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    },
  },
}
