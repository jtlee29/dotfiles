return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },

  opts = {
    options = {
      theme = "auto",
      component_separators = "",
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "neo-tree", "snacks_dashboard" },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { "mode", right_padding = 2 },
      },
      lualine_b = {
        {
          "branch",
          fmt = function(str)
            -- Match UNITY-XXX or XXX- patterns and return up to the numbers
            local unity_match = str:match("^UNITY%-(%d+)")
            if unity_match then
              return "UNITY-" .. unity_match
            end

            local number_match = str:match("^(%d+)%-")
            if number_match then
              return number_match
            end

            -- Return original string if no pattern matches
            return str
          end,
        },
      },
      lualine_c = {
        "%=",
        { "filename", path = 4, shorting_target = 40 },
      },

      lualine_x = {
        "diagnostics",
        "searchcount",
      },
      lualine_y = {
        { "diff", colored = true },
        { "filetype", icon_only = true },
      },
      lualine_z = {
        { "location", left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  },
}
