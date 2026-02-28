vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<leader>eh", ":nohlsearch<CR>", { desc = "Limpa o highlight da busca" })
