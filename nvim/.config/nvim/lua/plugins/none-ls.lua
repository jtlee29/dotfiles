return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },

  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,

        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "html",
            "css",
            "javascript",
            "javscriptreact",
            "typescript",
            "typescriptreact",
            "markdown",
            "json",
            "yaml",
          },
        }),
        require("none-ls.diagnostics.eslint_d").with({
          diagnostics_format = "[eslint] #{m}\n(#{c})",
        }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
