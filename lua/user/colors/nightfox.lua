-- there are many fox themes
local scheme = 'nordfox'

local ok, msg = pcall(vim.cmd, 'colorscheme ' .. scheme)
if not ok then
    vim.notify(scheme .. ' fails because ' .. msg)
    return
end

