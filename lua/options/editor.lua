local opt = vim.opt
local wo = vim.wo
local g = vim.g
local cmd = vim.cmd

-- Перенос длинных строк
opt.wrap = false

-- Частота обновления vim
opt.updatetime = 100

-- Отображать текущий режим в командной строке
opt.showmode = false

-- Оболочка терминала
opt.shell = "/bin/zsh"

-- Буфер обмена
opt.clipboard = "unnamedplus"

-- Сохранять историю отмены в файл (команда "u")
opt.undofile = true

-- Показывает полный путь до файла в правом верхнем углу
opt.winbar = "%=%m %f"
g.neotree_winbar = 0

-- Отображать столбец с символами меток
wo.signcolumn = "yes"

-- Не автокомментировать новые линии при переходе на новую строку
cmd("autocmd BufEnter * set fo-=c fo-=r fo-=o")
