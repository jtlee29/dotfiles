-- [[
-- Run `:help lsp-quickstart` for the neovim lsp docs
-- ]]

-- Disable global default lsp commands to use snacks ones instead
local disable = { "grn", "gra", "grr", "gri", "gO" }
for _, value in pairs(disable) do
    vim.keymap.del("n", value)
end

vim.lsp.enable({ "lua_ls", "vtsls" })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("neocat-lsp-attach", { clear = true }),

    callback = function(event)
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

        -- -- The following two autocommands are used to highlight references of the
        -- -- word under your cursor when your cursor rests there for a little while.
        -- --    See `:help CursorHold` for information about when this is executed
        -- --
        -- -- When you move your cursor, the highlights will be cleared (the second autocommand).
        -- local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
        --     local highlight_augroup = vim.api.nvim_create_augroup("neocat-lsp-highlight", { clear = false })
        --     vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        --         buffer = event.buf,
        --         group = highlight_augroup,
        --         callback = vim.lsp.buf.document_highlight,
        --     })
        --
        --     vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        --         buffer = event.buf,
        --         group = highlight_augroup,
        --         callback = vim.lsp.buf.clear_references,
        --     })
        --
        --     vim.api.nvim_create_autocmd("LspDetach", {
        --         group = vim.api.nvim_create_augroup("neocat-lsp-detach", { clear = true }),
        --         callback = function(event2)
        --             vim.lsp.buf.clear_references()
        --             vim.api.nvim_clear_autocmds({ group = "neocat-lsp-highlight", buffer = event2.buf })
        --         end,
        --     })
        -- end
    end,
})

vim.diagnostic.config({
    -- virtual_lines = true,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
