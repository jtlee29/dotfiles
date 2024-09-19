return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  opts = {
    options = {
      theme = 'auto',
      component_separators = '',
      -- section_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { 'neo-tree' },
      globalstatus = true,
    },
    sections = {
      -- lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_a = {
        { 'mode', right_padding = 2 },
      },
      lualine_b = {
        'branch',
      },
      lualine_c = {
        '%=',
        { 'filename', path = 1 },
      },

      lualine_x = {
        { 'diff', colored = true },
        'diagnostics',
        'searchcount',
      },
      lualine_y = {
        { 'filetype', icon_only = true },
        'encoding',
      },
      lualine_z = {
        -- { 'location', separator = { right = '' }, left_padding = 2 },
        { 'location', left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  },
}
