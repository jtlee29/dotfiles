return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp", -- completion engine
        { "j-hui/fidget.nvim", opts = {} }, -- notifications for lsp info
    },

    opts = {
        servers = {
            lua_ls = {},
            vtsls = {},
        },
    },

    config = function(_, opts)
        for server, config in pairs(opts.servers) do
            vim.lsp.enable(server)
        end
        -- for server, config in pairs(opts.servers) do
        --   -- passing config.capabilities to blink.cmp merges with the capabilities in your
        --   -- `opts[server].capabilities, if you've defined it
        --   config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        --   lspconfig[server].setup(config)
        -- end
    end,
}
