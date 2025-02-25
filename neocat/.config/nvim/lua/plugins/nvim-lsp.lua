-- LSP servers and clients communicate which features they support through "capabilities".
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has _more_ capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275

return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    "saghen/blink.cmp", -- completion engine
    { "j-hui/fidget.nvim", opts = {} }, -- notifications for lsp info
  },

  opts = {
    -- Language Servers to ensure install
    servers = {
      lua_ls = {},
      ts_ls = {},
      yamlls = {},
      jsonls = {},
      terraformls = {},
    },
  },

  config = function(_, opts)
    local lspconfig = require("lspconfig")

    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
    --[[ ---------- Auto CMDs ---------- ]]
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("neocat-lsp-attach", { clear = true }),
      callback = function(event)
        -- map() creates a vim keymap
        local snacks = require("snacks")
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("<leader>ss", snacks.picker.lsp_symbols, "[s]earch document [s]ymbols")
        map("<leader>sS", snacks.picker.lsp_workspace_symbols, "[s]earch workspace [S]ymbols")
        map("<leader>sd", snacks.picker.diagnostics, "[s]earch [d]iagnostics")

        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        map("gd", snacks.picker.lsp_definitions, "[g]oto [d]efinition")
        map("gD", snacks.picker.lsp_declarations, "[g]oto [D]eclaration")
        map("gr", snacks.picker.lsp_references, "[g]oto [r]eferences")
        map("gi", snacks.picker.lsp_implementations, "[g]oto [i]mplementation")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup("neocat-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("neocat-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "neocat-lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map(
            "<leader>th",
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })) end,
            "[t]oggle inlay [h]ints"
          )
        end
      end,
    })

    --[[ ---------- Mason ---------- ]]
    require("mason").setup()

    -- Extra tools to install, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(opts.servers or {})
    vim.list_extend(ensure_installed, {
      "stylua", -- Used to format Lua code
      "eslint_d",
      "eslint-lsp",
      "prettierd",
    })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    require("mason-lspconfig").setup({
      ensure_installed = {}, -- explicitly set to an empty table (neocat populates installs via mason-tool-installer)
      automatic_installation = false,
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
      },
    })
  end,
}
