local map = vim.keymap.set

map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Перейти к левому окну", remap = true })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Перейти к нижнему окну", remap = true })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Перейти к верхнему окну", remap = true })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Перейти к правому окну", remap = true })

map("t", "<esc>", "<c-\\><c-n>", { desc = "Переход Normal Mode" })
