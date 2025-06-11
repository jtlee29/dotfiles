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
        dashboard = {
            preset = {
                header = headers.soft,
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },

        image = {},

        indent = {
            indent = {
                enabled = true,
                only_current = true,
            },
        },

        picker = {
            matcher = { frecency = true },
            win = {
                input = {
                    keys = {
                        ["<c-h>"] = { "edit_split", mode = { "i", "n" }, desc = "Open in horizontal split" },
                        ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" }, desc = "Open in vertical split" },
                        ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" }, desc = "Toggle hidden files" },
                        ["?"] = { "toggle_help_input", mode = { "n" }, desc = "Toggle help" },
                        ["G"] = { "list_bottom", mode = { "n" }, desc = "Goto bottom of list" },
                        ["gg"] = { "list_top", mode = { "n" }, desc = "Goto top of list" },
                    },
                },
                list = {
                    keys = {
                        ["<c-h>"] = { "edit_split", mode = { "i", "n" }, desc = "Open in horizontal split" },
                        ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" }, desc = "Open in vertical split" },
                        ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" }, desc = "Toggle hidden files" },
                        ["?"] = { "toggle_help_input", mode = { "n" }, desc = "Toggle help" },
                        ["G"] = { "list_bottom", mode = { "n" }, desc = "Goto bottom of list" },
                        ["gg"] = { "list_top", mode = { "n" }, desc = "Goto top of list" },
                    },
                },
            },
        },
    },

    config = function(_, opts) require("snacks").setup(opts) end,

    keys = {
        --[[ ---------- Search ---------- ]]
        { "<leader><space>", function() Snacks.picker.buffers({ layout = "ivy" }) end, desc = "search open buffers" },

        { "<leader>sf", function() Snacks.picker.files() end, desc = "[s]earch [f]iles" },
        { "<leader>s.", function() Snacks.picker.recent() end, desc = "[s]earch recent files (. for repeat)" },
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "[s]earch with [g]rep" },
        {
            "<leader>sw",
            function() Snacks.picker.grep_word() end,
            desc = "[s]earch current [w]ord",
            mode = { "n", "x" },
        },
        { "<leader>sr", function() Snacks.picker.resume() end, desc = "[s]earch [r]esume" },
        { "<leader>sc", function() Snacks.picker.colorschemes() end, desc = "[s]earch [c]olorschemes" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        {
            "<leader>sh",
            function() Snacks.picker.highlights({ pattern = "hl_group:^Snacks" }) end,
            desc = "snacks highlights",
        },
    },
}
