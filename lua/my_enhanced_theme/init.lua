local M = {}

function M.setup(opts)
  opts = opts or {}
  -- Здесь можно добавить настройки темы
  vim.cmd("colorscheme my_enhanced_theme")
end

return M
