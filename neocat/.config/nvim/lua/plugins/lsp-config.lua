return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp", -- completion engine
        { "j-hui/fidget.nvim", opts = {} }, -- notifications for lsp info
    },

    config = function() end,
}
