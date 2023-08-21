local map = vim.keymap.set

-- Leader клавиша
vim.g.mapleader = " "

-- Сохранить файл
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Сохранить файл", remap = true })

-- Выход
map({ "i", "v", "n", "s" }, "<C-x>", "<cmd>q<cr>", { desc = "Выход" })

-- Открыть новый файл
map("n", "<C-n>", "<cmd>enew<cr>", { desc = "Новый файл" })

-- Отмена
map("n", "<C-z>", "<cmd>undo<cr>", { desc = "Отмена" })
map("i", "<C-z>", "<Esc><cmd>undo<cr>", { desc = "Отмена" })
