local map = vim.keymap.set

-- Перемещение между окнами
map("n", "<C-h>", "<C-w>h", { desc = "Перейти к левому окну", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Перейти к нижнему окну", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Перейти к верхнему окну", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Перейти к правому окну", remap = true })

-- Изменение размера окна
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Увеличить высоту окна", remap = true })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Уменьшить высоту окна", remap = true })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Уменьшить ширину окна", remap = true })
map(
  "n",
  "<C-Right>",
  "<cmd>vertical resize +2<cr>",
  { desc = "Увеличить ширину окна", remap = true }
)

-- Разделить окно
map("n", "<leader>-", "<C-W>s", { desc = "Горизонтальное разделение окна", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Вертикальное разделение окна", remap = true })
