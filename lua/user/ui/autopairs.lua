local autopairs_ok, ap = pcall(require, 'nvim-autopairs')
if not autopairs_ok then
    vim.notify('autopairs broken')
    return
end

local overrides = {}

ap.setup(overrides)

