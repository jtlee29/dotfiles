local headers = {
  soft = [[
,--.  ,--.               ,-----.          ,--.  
|  ,'.|  | ,---.  ,---. '  .--./ ,--,--.,-'  '-.
|  |' '  || .-. :| .-. ||  |    ' ,-.  |'-.  .-'
|  | `   |\   --.' '-' ''  '--'\\ '-'  |  |  |  
`--'  `--' `----' `---'  `-----' `--`--'  `--'1.11]],
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = { { "echasnovski/mini.icons", opts = {} } },

  ---@module "snacks"
  ---@type snacks.Config
  opts = {
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

    notifier = { enabled = true },

    input = {
      enabled = true,
      win = {
        relative = "cursor",
        row = -3,
        col = 0,
      },
    },

    lazygit = { enabled = true },

    picker = {
      enabled = true,
      ui_select = true,
      layout = {
        -- layout = layout,
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
  },

  keys = {
    --[[ ---------- Search ---------- ]]
    {
      "<leader><space>",
      function() Snacks.picker.buffers({ layout = "ivy" }) end,
      desc = "search open buffers",
    },

    { "<leader>sf", function() Snacks.picker.files() end, desc = "[s]earch [f]iles" },
    { "<leader>s.", function() Snacks.picker.recent() end, desc = "[s]earch recent files (. for repeat)" },
    {
      "<leader>st",
      function() Snacks.picker.files({ ft = ".test.ts", title = "Test Files" }) end,
      desc = "[s]earch [t]ests",
    },
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

    --[[ ---------- LSP ---------- ]]
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
    { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  },

  config = function(_, opts) require("snacks").setup(opts) end,
}
