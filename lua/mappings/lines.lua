local map = vim.keymap.set

-- Перемещение линий
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Переместить наверх", remap = true })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Переместить вниз", remap = true })

map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Переместить наверх", remap = true })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Переместить вниз", remap = true })

map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Переместить наверх", remap = true })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Переместить вниз", remap = true })
