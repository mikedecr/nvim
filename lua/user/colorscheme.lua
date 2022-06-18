local scheme_name = "nord"

-- scheme-specific settings.
-- activated if you load the scheme from `colorscheme [name]`
-
vim.g.nord_borders = true     -- vertical split border
vim.g.nord_contrast = true    -- popups/bars different background
vim.g.nord_italic = false     -- italic flourishes


-- status_ok describes state of the pcall
-- `_` is returned value from the call (in this case, we don't care what the value is)
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. scheme_name)

if not status_ok then
  vim.notify("colorscheme " .. scheme_name .. " not found!")
  return
end

