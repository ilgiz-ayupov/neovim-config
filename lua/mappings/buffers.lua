local map = vim.keymap.set

-- Переключение между вкладками
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Предыдущая вкладка" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Следующая вкладка" })
