return {
  "Bekaboo/dropbar.nvim",
  depedencies = {
    "nvim-mini/mini.icons",
  },
  version = "^12",
  ---@class dropbar_configs_t
  opts = {
    icons = {
      separator = ">", -- Customize breadcrumb separator
    },
    symbol = {},
    bar = {},
    menu = {},
    fzf = {},
    sources = {
      path = {
        max_depth = 2,
      },
      treesitter = {
        max_depth = 5,
      },
      lsp = {
        max_depth = 5,
      },
    },
    truncate = true, -- Enable truncation
  },
}
