local ok, zen = pcall(require, 'zen-mode')
if not ok then
    vim.notify('failed: zen-mode')
    return
end

-- put this in a function for keymap to call
local light_zen = function()
    zen.toggle({
        window = {
            width = 120,
            options = {
                cursorline = false,
                colorcolumn = "0",   -- rhs ruler
                signcolumn = "no"    -- no git stuff
            }
        }
    })
end

vim.keymap.set("n", "<space>zz", function() light_zen() end)

