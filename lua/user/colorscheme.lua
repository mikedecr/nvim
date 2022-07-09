local scheme = "nord"
-- local scheme = "everforest"
-- local scheme = "fairyfloss"
-- local scheme = "peachpuff"

-- scheme-specific settings.
-- activated if you load the scheme from `colorscheme [name]`

-- nord
vim.g.nord_borders = true     -- vertical split border
vim.g.nord_contrast = true    -- popups/bars different background
vim.g.nord_italic = false     -- italic flourishes

-- everforest
if scheme == "everforest" then
    background = light
end

-- .set() the theme
-- scheme_ok describes state of the pcall
-- `_` is returned value from the call (in this case, we don't care what the value is)
local scheme_ok, _ = pcall(vim.cmd, "colorscheme " .. scheme)
if not scheme_ok then vim.notify("colorscheme " .. scheme .. " not found!") return end

