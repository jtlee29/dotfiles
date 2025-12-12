-- [[ Basic Keymaps]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keep line centered when going down half page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Diagnostic Keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
vim.keymap.set(
  "n",
  "[d",
  function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = "Go to previous [D]iagnostic message" }
)
vim.keymap.set(
  "n",
  "]d",
  function() vim.diagnostic.jump({ count = 1, float = true }) end,
  { desc = "Go to next [D]iagnostic message" }
)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move focus to the upper window" })

-- Great keymap. Doesn't overrwite register when pasting
vim.keymap.set("x", "<leader>p", '"_dP')

-- Restart LSP
vim.keymap.set("n", "<leader>ls", "<cmd>LspRestart<CR>", { desc = "Restart [l]anguage [s]erver" })

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite buffer" })
