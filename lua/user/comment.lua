local ok, com = pcall(require, 'Comment')

if not ok then
    vim.notify("comment.nvim fails")
    return
end

com.setup()

