local opt = vim.opt

-- Игнорировать регистр при поиске
opt.ignorecase = true

-- Не игнорировать регистр, если есть символы в верхнем регистре
opt.smartcase = true

-- Подсвечивать найденные текстовые объекты
opt.showmatch = true

-- Определять результаты поиска по мере ввода
opt.incsearch = true
