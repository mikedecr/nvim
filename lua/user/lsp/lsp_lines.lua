local ok, lines = pcall(require, "lsp_lines")
if not ok then vim.notify("failed: lsp_lines") return end

lines.setup()

