vim.api.nvim_command("highlight clear")
vim.g.colors_name = "my_enhanced_theme"
vim.o.termguicolors = true
vim.o.background = "dark"

-- Палитра цветов
local colors = {
  bg_dark = "#133245",
  bg_float = "#14364a",
  white = "#FFFFFF",
  gray = "#A0A0A0",
  green = "#a1e232",
  pink = "#f92663",
  yellow = "#e6d565",
  purple = "#D19AFF",
  cyan = "#5ffff6",
  orange = "#fd8033",
  blue = "#4A90E2",
  red = "#FF5555",
  dark_gray = "#7A8C99",
  menu_bg = "#1E2B38",
  status_bg = "#2A4D6E",
  cursor_line = "#1A3A52",
  visual_bg = "#3A5F8A",
  cyan_alt = "#56B6C2",
}

-- Упрощённая функция для подсветки
local function set_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts or {})
end

-----------------------------
-- Базовые настройки
-----------------------------
set_hl("Normal", { bg = colors.bg_dark, fg = colors.white })
set_hl("NormalFloat", { bg = colors.bg_float, fg = "#E0E0E0" })
set_hl("FloatBorder", { fg = colors.cyan, bg = colors.bg_float })

-----------------------------
-- Основные синтаксические группы
-----------------------------
set_hl("Identifier", { fg = colors.white })
set_hl("Function", { fg = colors.green })
set_hl("Keyword", { fg = colors.pink })
set_hl("String", { fg = colors.yellow })
set_hl("Number", { fg = colors.purple })
set_hl("Type", { fg = colors.cyan })
set_hl("Operator", { fg = colors.pink })
set_hl("Special", { fg = colors.cyan })
set_hl("Comment", { fg = colors.gray })

-----------------------------
-- Treesitter группы
-----------------------------
set_hl("@variable", { fg = colors.white })
set_hl("@variable.builtin", { fg = colors.orange }) -- self/Self
set_hl("@variable.parameter", { fg = colors.white })
set_hl("@field", { fg = colors.white })
set_hl("@property", { fg = colors.white })
set_hl("@function", { fg = colors.green })
set_hl("@function.builtin", { fg = colors.green })
set_hl("@keyword", { fg = colors.pink })
set_hl("@string", { fg = colors.yellow })
set_hl("@number", { fg = colors.purple })
set_hl("@constant", { fg = colors.cyan })
set_hl("@type", { fg = colors.cyan })
set_hl("@lifetime", { fg = colors.gray })
set_hl("@type.builtin", { fg = colors.cyan })

-----------------------------
-- Интерфейс
-----------------------------
set_hl("Cursor", { fg = colors.bg_dark, bg = colors.blue })
set_hl("CursorLine", { bg = colors.cursor_line })
set_hl("Visual", { bg = colors.visual_bg, fg = colors.white })
set_hl("LineNr", { fg = colors.dark_gray })
set_hl("CursorLineNr", { fg = colors.blue })
set_hl("Pmenu", { bg = colors.menu_bg, fg = "#C0D0E0" })
set_hl("PmenuSel", { bg = colors.blue, fg = colors.white })
set_hl("StatusLine", { bg = colors.status_bg, fg = colors.white })

-----------------------------
-- Диагностика и ошибки
-----------------------------
set_hl("ErrorMsg", { fg = colors.red })
set_hl("DiagnosticError", { fg = colors.red, undercurl = true })
set_hl("DiagnosticWarn", { fg = colors.yellow })
set_hl("Todo", { fg = colors.red, underline = true })

-----------------------------
-- Автокоманды
-----------------------------
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*",
  callback = function()
    vim.fn.clearmatches()
    local todos = {"TODO", "FIXME", "NOTE"}
    for _, word in ipairs(todos) do
      vim.fn.matchadd("Todo", "\\<" .. word .. "\\>")
    end
    vim.fn.matchadd("TodoText", "\\<TODO\\>\\s*:\\?\\s*\\zs.*")
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-----------------------------
-- Rainbow Delimiters
-----------------------------
local rainbow_groups = {
  "RainbowDelimiterRed",    colors.pink,
  "RainbowDelimiterYellow", colors.yellow,
  "RainbowDelimiterBlue",   colors.cyan,
  "RainbowDelimiterOrange", colors.orange,
  "RainbowDelimiterGreen",  colors.green,
  "RainbowDelimiterViolet", colors.purple,
  "RainbowDelimiterCyan",   colors.cyan_alt,
}

for i = 1, #rainbow_groups, 2 do
  set_hl(rainbow_groups[i], { fg = rainbow_groups[i + 1] })
end

local ok, rainbow = pcall(require, "rainbow-delimiters")
if ok then
  rainbow.setup({
    strategy = { [""] = rainbow.strategy["global"] },
    query = { [""] = "rainbow-delimiters" },
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
  })
end
