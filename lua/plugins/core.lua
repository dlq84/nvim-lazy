return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- ...elided others
        "graphql-language-service-cli", -- required for graphql-lsp
        "oxfmt",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
  },
  { "geigerzaehler/tree-sitter-jinja2", config = true },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = { enabled = false },
        eslint = {},
        graphql = {},
        vtsls = {
          enabled = false,
          settings = {
            vtsls = { experimental = { completion = { enableServerSideFuzzyMatch = true, entriesLimit = 30 } } },
          },
        },
        typescript = {
          preferences = {},
        },
        rust_analyzer = {
          procMacro = { enable = true },
        },
      },
      setup = {
        eslint = function()
          -- let conform/prettier own formatting for these servers
          for _, name in ipairs({ "eslint", "tsserver", "vtsls", "tsgo", "tsc" }) do
            Snacks.util.lsp.on({ name = name }, function(_, client)
              client.server_capabilities.documentFormattingProvider = nil
              client.server_capabilities.documentOnTypeFormattingProvider = nil
            end)
          end
        end,
      },
      inlay_hints = {
        enabled = true,
        exclude = { "typescript", "typescriptreact" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- ...elided other configs
        "graphql",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 100,
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    specs = {
      {
        "catppuccin",
        optional = true,
        opts = { integrations = { rainbow_delimiters = true } },
      },
    },
    event = "User",
    main = "rainbow-delimiters.setup",
    opts = {},
  },
  {
    "jorlly-collado-castro/opencode-lazy.nvim",
  },
}
