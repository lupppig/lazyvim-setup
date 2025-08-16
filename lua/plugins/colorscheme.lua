return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "darker"
      vim.cmd("colorscheme material")
      vim.opt.guicursor = "n-v-c-i:block"
    end,
  },
}
