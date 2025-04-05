if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "my_enhanced_theme"

-- Очистка предыдущих настроек
vim.api.nvim_command("highlight clear")

-- Включение true color
vim.o.termguicolors = true

-- Упрощенная функция для установки подсветки
local function set_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-----------------------------
-- Базовые настройки
-----------------------------
set_hl("Normal", { 
  bg = "#133245", 
  fg = "#F0F0F0",
  blend = 0
})

set_hl("NormalFloat", { 
  bg = "#14364a", 
  fg = "#E0E0E0"
})

set_hl("FloatBorder", { 
  fg = "#5ffff6", 
  bg = "#14364a",
  bold = false
})

-----------------------------
-- Основные синтаксические группы
-----------------------------
set_hl("Identifier", { 
  fg = "#FFFFFF",  -- Все идентификаторы белые
  bold = false
})

set_hl("Function", { 
  fg = "#a1e232",  -- Зелёный для функций
  bold = false
})

set_hl("Keyword", { 
  fg = "#f92663",  -- Розовый для ключевых слов
  bold = false
})

set_hl("String", { 
  fg = "#e6d565",  -- Жёлтый для строк

})

set_hl("Number", { 
  fg = "#D19AFF",  -- Фиолетовый для чисел
  bold = false
})

set_hl("Type", { 
  fg = "#5ffff6",  -- Голубой для типов
  bold = false
})

set_hl("Operator", { 
  fg = "#f92663",  -- Розовый для операторов
  bold = false
})

set_hl("Special", { 
  fg = "#5ffff6",  -- Голубой для специальных символов
  bold = false
})

set_hl("Comment", { 
  fg = "#A0A0A0",  -- Серый для комментариев
  italic = false
})

-----------------------------
-- Treesitter группы
-----------------------------
-- Основные переменные
set_hl("@variable", { 
  fg = "#FFFFFF",  -- Белый для всех переменных
  bold = false
})

-- self/Self - единственные оранжевые
set_hl("@variable.builtin", { 
  fg = "#fd8033",  -- Оранжевый только для self/Self
  italic = false
})

-- Параметры функций теперь белые
set_hl("@variable.parameter", { 
  fg = "#FFFFFF",  -- Белый вместо оранжевого
  italic = false
})

-- Поля структур
set_hl("@field", { 
  fg = "#FFFFFF",  -- Белый
  bold = false
})

set_hl("@property", { 
  fg = "#FFFFFF",  -- Белый
  bold = false
})

-- Функции
set_hl("@function", { 
  fg = "#a1e232",  -- Зелёный
  bold = false
})

set_hl("@function.builtin", { 
  fg = "#a1e232",  -- Зелёный
  italic = false
})

-- Ключевые слова
set_hl("@keyword", { 
  fg = "#f92663",  -- Розовый
  bold = false
})

-- Строки и числа
set_hl("@string", { 
  fg = "#e6d565",  -- Жёлтый
  italic = false
})

set_hl("@number", { 
  fg = "#D19AFF",  -- Фиолетовый
  bold = false
})

-- Константы и типы
set_hl("@constant", { 
  fg = "#5ffff6",  -- Голубой
  bold = false
})

set_hl("@type", { 
  fg = "#5ffff6",  -- Голубой
  bold = false
})

-- Специальные группы для Rust
set_hl("@lifetime", { 
  fg = "#A0A0A0",  -- Серый для времён жизни
  italic = false
})

set_hl("@type.builtin", { 
  fg = "#5ffff6",  -- Голубой для встроенных типов
  bold = false
})

-----------------------------
-- Интерфейс
-----------------------------
-- Курсор и выделение
set_hl("Cursor", { 
  fg = "#133245", 
  bg = "#4A90E2", 
  bold = false
})

set_hl("CursorLine", { 
  bg = "#1A3A52"  -- Без подчёркивания
})

set_hl("Visual", { 
  bg = "#3A5F8A", 
  fg = "#FFFFFF"
})

-- Номера строк
set_hl("LineNr", { 
  fg = "#7A8C99"
})

set_hl("CursorLineNr", { 
  fg = "#4A90E2", 
  bold = false
})

-- Меню
set_hl("Pmenu", { 
  bg = "#1E2B38", 
  fg = "#C0D0E0"
})

set_hl("PmenuSel", { 
  bg = "#4A90E2", 
  fg = "#FFFFFF", 
  bold = false
})

-- Статусная строка
set_hl("StatusLine", { 
  bg = "#2A4D6E", 
  fg = "#FFFFFF", 
  bold = false
})

-----------------------------
-- Диагностика и ошибки
-----------------------------
set_hl("ErrorMsg", { 
  fg = "#FF5555", 
  bold = false
})

set_hl("DiagnosticError", { 
  fg = "#FF5555", 
  undercurl = true
})

set_hl("DiagnosticWarn", { 
  fg = "#e6d565"
})

-----------------------------
-- Специальные группы
-----------------------------
set_hl("Todo", { 
  fg = "#FF5555", 
  bold = false, 
  underline = true
})


-----------------------------
-- Автоматические команды
-----------------------------
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*",
  callback = function()
    vim.fn.clearmatches()
    vim.fn.matchadd("Todo", "\\<TODO\\>")
    vim.fn.matchadd("Todo", "\\<FIXME\\>")
    vim.fn.matchadd("Todo", "\\<NOTE\\>")
    vim.fn.matchadd("TodoText", "\\<TODO\\>\\s*:\\?\\s*\\zs.*")
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
      timeout = 200,
    })
  end,
})

-- Группы для rainbow-delimiters (согласованные с вашей темой)
set_hl("RainbowDelimiterRed",    { fg = "#f92663" })  -- Розовый (как Keyword)
set_hl("RainbowDelimiterYellow", { fg = "#e6d565" })  -- Жёлтый (как String)
set_hl("RainbowDelimiterBlue",   { fg = "#5ffff6" })  -- Голубой (как Type)
set_hl("RainbowDelimiterOrange", { fg = "#fd8033" })  -- Оранжевый (как variable.builtin)
set_hl("RainbowDelimiterGreen",  { fg = "#a1e232" })  -- Зелёный (как Function)
set_hl("RainbowDelimiterViolet", { fg = "#D19AFF" })  -- Фиолетовый (как Number)
set_hl("RainbowDelimiterCyan",   { fg = "#56B6C2" })  -- Бирюзовый (доп. цвет)


local ok, _ = pcall(require, "rainbow-delimiters")
if ok then
  require("rainbow-delimiters.setup")({
    strategy = { [""] = require("rainbow-delimiters").strategy["global"] },
    query = { [""] = "rainbow-delimiters" },
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      -- остальные цвета...
    }
  })
end
