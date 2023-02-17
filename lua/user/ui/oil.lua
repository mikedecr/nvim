local ok, oil = pcall(require, "oil")
if not ok then vim.notify("failed: oil") return end

oil.setup()

