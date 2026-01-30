return {
  "vague-theme/vague.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("vague").setup({
      -- transparent = true,
      -- optional configuration here
      colors = {
        bg = "#1d2021",
      },

      -- Override colors
      on_highlights = function(hl, c)
        hl.EndOfBuffer.fg = c.bg

        hl.WinBar = { fg = c.fg, bg = c.bg }
      end,
    })
    -- vim.cmd("colorscheme vague")
  end,
}
