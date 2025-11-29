vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Nvim-Tree mapping
vim.keymap.set("n", "\\", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover para a janela esquerda" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover para a janela direita" })
vim.keymap.set("n", "<C-a>", ":Alpha", {})
