if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "my_enhanced_theme"

-- Очистка предыдущих настроек
vim.api.nvim_command("highlight clear")

-- Включение true color
vim.o.termguicolors = true

-- Упрощенная функция для установки подсветки (определена ДО использования)
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
  fg = "#fa3f75",  -- Розовый для ключевых слов
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
  fg = "#fa3f75",  -- Розовый для операторов
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
  fg = "#fa3f75",  -- Розовый
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
-- Разделители и границы
-----------------------------
set_hl("VertSplit", { 
  fg = "#2A4D6E", 
  bg = "#133245"
})

set_hl("WinSeparator", { 
  fg = "#2A4D6E", 
  bg = "#133245"
})

-- Номера строк (относительные)
set_hl("LineNrAbove", { 
  fg = "#5A6B78"
})

set_hl("LineNrBelow", { 
  fg = "#5A6B78"
})

-- Знаки в колонке (git, diagnostic)
set_hl("SignColumn", { 
  bg = "#133245"
})

set_hl("Folded", { 
  fg = "#8A9BAA", 
  bg = "#1A3A52"
})

set_hl("FoldColumn", { 
  fg = "#4A90E2", 
  bg = "#133245"
})

-- Поиск и подсветка
set_hl("Search", { 
  fg = "#133245", 
  bg = "#e6d565"
})

set_hl("IncSearch", { 
  fg = "#133245", 
  bg = "#fa3f75"
})

set_hl("CurSearch", { 
  fg = "#133245", 
  bg = "#5ffff6"
})

-- set_hl("MatchParen", { 
--   fg = "#133245", 
--   bg = "#D19AFF", 
--   bold = true
-- })

-- Вкладки
set_hl("TabLine", { 
  fg = "#8A9BAA", 
  bg = "#1A3A52"
})

set_hl("TabLineSel", { 
  fg = "#FFFFFF", 
  bg = "#2A4D6E", 
  bold = true
})

set_hl("TabLineFill", { 
  bg = "#133245"
})

-- Подсказки и сообщения
set_hl("Question", { 
  fg = "#5ffff6", 
  bold = true
})

set_hl("WarningMsg", { 
  fg = "#e6d565"
})

set_hl("ModeMsg", { 
  fg = "#a1e232", 
  bold = true
})

set_hl("MoreMsg", { 
  fg = "#4A90E2"
})

-- Цвета для diff/merge
set_hl("DiffAdd", { 
  bg = "#1A4A2A", 
  fg = "#a1e232"
})

set_hl("DiffChange", { 
  bg = "#2A4A6A"
})

set_hl("DiffDelete", { 
  bg = "#4A2A2A", 
  fg = "#FF5555"
})

set_hl("DiffText", { 
  bg = "#3A6A8A", 
  bold = true
})

-----------------------------
-- Группы для rainbow-delimiters
-----------------------------
set_hl("RainbowDelimiterRed",    { fg = "#fa3f75" })
set_hl("RainbowDelimiterYellow", { fg = "#e6d565" })
set_hl("RainbowDelimiterBlue",   { fg = "#5ffff6" })
set_hl("RainbowDelimiterOrange", { fg = "#fd8033" })
set_hl("RainbowDelimiterGreen",  { fg = "#a1e232" })
set_hl("RainbowDelimiterViolet", { fg = "#D19AFF" })
set_hl("RainbowDelimiterCyan",   { fg = "#56B6C2" })

-----------------------------
-- LSP References и подсветка
-----------------------------
set_hl("LspReferenceText", { 
  bg = "#3A5F8A"
})

set_hl("LspReferenceRead", { 
  bg = "#3A5F8A"
})

set_hl("LspReferenceWrite", { 
  bg = "#3A5F8A"
})

set_hl("LspSignatureActiveParameter", { 
  bg = "#2A4D6E", 
  bold = true
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

-- Настройка rainbow-delimiters если установлен
local ok, _ = pcall(require, "rainbow-delimiters")
if ok then
  require("rainbow-delimiters.setup")({
    strategy = { [""] = require("rainbow-delimiters").strategy["global"] },
    query = { [""] = "rainbow-delimiters" },
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    }
  })
end
