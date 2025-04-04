# My Enhanced Theme

Профессиональная цветовая схема для Neovim

![Screenshot](./screenshot.png)

## Установка

### Lazy.nvim
```lua
{
  "Chiptune11/my_enhanced_theme",
  lazy = false,
  priority = 1000,
  config = function()
    require("my_enhanced_theme").setup()
  end,
}
```

### Вручную
Скопируйте содержимое `colors/` в `~/.config/nvim/colors/`

## Особенности
- Оптимизированная цветовая палитра
- Поддержка Treesitter и LSP
- Интеграция с популярными плагинами
