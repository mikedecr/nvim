local ok, com = pcall(require, 'Comment')
if not ok then vim.notify("failed: comment.nvim"); return; end

com.setup()

