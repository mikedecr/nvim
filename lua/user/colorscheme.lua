local scheme_name = "nord"

-- status_ok describes state of the pcall
-- `_` is returned value from the call (in this case, we don't care what the value is)
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. scheme_name)

if not status_ok then
  vim.notify("colorscheme " .. scheme_name .. " not found!")
  return
end
