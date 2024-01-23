-- there are many fox themes
local ok, nightfox = pcall(require, 'nightfox')
if not ok then
    vim.notify("Failed: Nightfox themes")
    return
end

