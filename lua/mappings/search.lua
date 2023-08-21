local map = vim.keymap.set

-- Очистить результат поиска
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape и очистка поиска" })

-- Искать слово под курсором
map({ "n", "x" }, "gw", "*N", { desc = "Искать слово под курсором", remap = true })
