return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    -- dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = { preset = "default" },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = {
                    border = "single",
                    winblend = 5,
                },
            },
            menu = {
                border = "single",
                winblend = 5,
            },
            -- menu = {
            --   min_width = 20, -- Minimum width of the completion menu
            --   max_height = 15, -- Maximum height of the completion menu
            --   border = "single", -- Border style: 'none', 'single', 'double', 'rounded', 'padded'
            --   winblend = 5, -- Transparency of the menu (0-100)
            --   scrollbar = false, -- Display a scrollbar
            --   direction_priority = { "s", "n" }, -- Preferred directions for the menu
            --   auto_show = true, -- Automatically show the menu
            -- },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
