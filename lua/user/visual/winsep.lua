-- adds highlight border to current buffer / window

local ok, winsep = pcall(require, 'colorful-winsep')
if not ok then vim.notify('winsep fails') return end

winsep.setup()

