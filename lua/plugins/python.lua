return {
  -- Ensure tools are installed via mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "mypy",
        "basedpyright", -- faster alternative to pyright
      },
    },
  },

  -- LSP setup
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoImportCompletions = true, -- enables auto-import
                typeCheckingMode = "basic", -- or "strict"
              },
            },
          },
        },
      },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "ruff", "mypy" },
      }
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 1000,
      },
    },
  },
}

