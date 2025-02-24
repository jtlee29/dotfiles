return {
  "Bekaboo/dropbar.nvim",
  depedencies = {
    "nvim-tree/nvim-web-devicons",
  },
  ---@type dropbar_configs_t
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
  -- config = function()
  --   -- Configure Dropbar
  --   require("dropbar").setup({
  --     icons = {
  --       separator = ">", -- Customize breadcrumb separator
  --     },
  --     symbol = {},
  --     bar = {},
  --     menu = {},
  --     fzf = {},
  --     sources = {
  --       path = {
  --         -- max_depth = 2,
  --       },
  --       treesitter = {
  --         -- max_depth = 5,
  --       },
  --       lsp = {
  --         -- max_depth = 5,
  --       },
  --     },
  --     truncate = true, -- Enable truncation
  --   })
  -- end,
}
