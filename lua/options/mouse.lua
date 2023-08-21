local opt = vim.opt

-- Поддерка мыши
opt.mouse = "a" -- Включить во всех режимах
-- opt.mouse = "n" -- Включить только в "Normal" режиме
-- opt.mouse = "v" -- Включить только в "Visual" режиме
-- opt.mouse = "c" -- Включить только в "Command-line" режиме
-- opt.mouse = "0" -- Выключить поддержку мыши

-- Скорость прокрутки мыши
opt.scroll = 4

-- Фокусировка окна под курсором мыши
opt.mousefocus = true

-- Скрыть курсор мыши при наборе текста
opt.mousehide = true

-- Использование мыши в редакторе
opt.mousemodel = "extend" -- Мышь можно использовать для выбора визуального режима и изменения размеров окон.
-- opt.mousemodel = "popup" -- Мышь можно использовать для всплывающих меню и плавающих окон.
-- opt.mousemodel = "popup_setpos" -- Подобно popup, но мышь также может устанавливать положение курсора.
-- opt.mousemodel = "popup_setpos_cursor" -- Подобно popup_setpos, но мышь также может перемещать курсор.