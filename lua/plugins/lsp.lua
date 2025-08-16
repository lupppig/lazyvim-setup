return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        "clangd",
        "zls",
        "omnisharp",
        -- "dartls",
      },
    },
  },
}

