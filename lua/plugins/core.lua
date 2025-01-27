return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- ...elided others
        "graphql-language-service-cli", -- required for graphql-lsp
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = { enabled = false },
        eslint = {},
        graphql = {},
        vtsls = {
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
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = nil
              client.server_capabilities.documentOnTypeFormattingProvider = nil
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = nil
              client.server_capabilities.documentOnTypeFormattingProvider = nil
            elseif client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = nil
              client.server_capabilities.documentOnTypeFormattingProvider = nil
            end
          end)
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
}
