return {
    "folke/which-key.nvim",
    event = "VimEnter",

    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        ---@type false | "classic" | "modern" | "helix"
        preset = "classic",
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },

    config = function(_, opts) -- This is the function that runs, AFTER loading
        require("which-key").setup(opts)

        -- Document existing key chains
        require("which-key").add({
            { "<leader>c", group = "[C]ode" },
            { "<leader>d", group = "[D]ocument" },
            { "<leader>r", group = "[R]ename" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>t", group = "[T]oggle" },
        })
    end,
}
