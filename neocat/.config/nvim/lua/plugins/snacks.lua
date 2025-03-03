---class
local layout = {
  box = "horizontal",
  backdrop = false,
  width = 0.8,
  height = 0.9,
  border = "none",
  {
    box = "vertical",
    { win = "list", title = " Results ", title_pos = "center", border = "single" },
    { win = "input", height = 1, border = "single", title = "{title} {live} {flags}", title_pos = "center" },
  },
  {
    win = "preview",
    title = "{preview:Preview}",
    width = 0.45,
    border = "single",
    title_pos = "center",
  },
}

local headers = {
  diagonals = [[
    /|    / /                   //   ) )                
   //|   / /  ___      ___     //         ___    __  ___
  // |  / / //___) ) //   ) ) //        //   ) )  / /   
 //  | / / //       //   / / //        //   / /  / /    
//   |/ / ((____   ((___/ / ((____/ / ((___( (  / /     ]],
  shadow = [[
███╗   ██╗███████╗ ██████╗  ██████╗ █████╗ ████████╗
████╗  ██║██╔════╝██╔═══██╗██╔════╝██╔══██╗╚══██╔══╝
██╔██╗ ██║█████╗  ██║   ██║██║     ███████║   ██║   
██║╚██╗██║██╔══╝  ██║   ██║██║     ██╔══██║   ██║   
██║ ╚████║███████╗╚██████╔╝╚██████╗██║  ██║   ██║   
╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝   ]],
  soft = [[
,--.  ,--.               ,-----.          ,--.  
|  ,'.|  | ,---.  ,---. '  .--./ ,--,--.,-'  '-.
|  |' '  || .-. :| .-. ||  |    ' ,-.  |'-.  .-'
|  | `   |\   --.' '-' ''  '--'\\ '-'  |  |  |  
`--'  `--' `----' `---'  `-----' `--`--'  `--'  ]],
}

return {
  "folke/snacks.nvim",
  ---@module "snacks"

  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    lazygit = {},
    image = {},

    indent = {
      indent = {
        enabled = true,
        only_current = true,
      },
    },

    -- animate = { duration = 20, easing = "linear", fps = 60 }, -- not working??

    picker = {
      enabled = true,
      layout = {
        layout = layout,
        cycle = false,
        reverse = true,
      },
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            ["<c-h>"] = { "edit_split", mode = { "i", "n" } }, -- open horizontal split
            ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } }, -- open vertical split
            ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } }, -- toggle hidden files
          },
        },
        list = {
          keys = {
            ["<c-h>"] = { "edit_split" }, -- open horizontal split
            ["<c-v>"] = { "edit_vsplit" }, -- open vertical split
            ["<a-h>"] = { "toggle_hidden" }, -- toggle hidden files
          },
        },
      },
    },

    dashboard = {
      enabled = true,
      preset = {
        header = headers.soft,
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },

  config = function(_, opts) require("snacks").setup(opts) end,

  keys = {
    --[[ ---------- Search ---------- ]]
    {
      "<leader><space>",
      function() Snacks.picker.buffers({ layout = "ivy" }) end,
      desc = "search open buffers",
    },

    { "<leader>sf", function() Snacks.picker.files() end, desc = "[s]earch [f]iles" },
    { "<leader>s.", function() Snacks.picker.recent() end, desc = "[s]earch recent files (. for repeat)" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "[s]earch with [g]rep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[s]earch current [w]ord", mode = { "n", "x" } },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "[s]earch [r]esume" },
    { "<leader>sc", function() Snacks.picker.colorschemes() end, desc = "[s]earch [c]olorschemes" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    {
      "<leader>sh",
      function() Snacks.picker.highlights({ pattern = "hl_group:^Snacks" }) end,
      desc = "snacks highlights",
    },

    --[[ ---------- LazyGit ---------- ]]
    { "<leader>lg", function() Snacks.lazygit.open() end, desc = "[l]azy[g]it" },

    -- For LSP based pickers, see nvim-lsp.lua
  },
}
