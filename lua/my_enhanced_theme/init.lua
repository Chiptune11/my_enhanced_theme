local M = {}

function M.setup(opts)
  opts = opts or {}
  -- Передача настроек в цветовую схему
  vim.g.my_enhanced_theme_transparent = opts.transparent_background or false
  vim.cmd("colorscheme my_enhanced_theme")
end

return M
