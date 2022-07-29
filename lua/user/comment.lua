local ok, com = pcall(require, 'Comment')

if ok then com.setup()
else vim.notify("comment.nvim fails") end

--[[ if not ok then
    vim.notify("comment.nvim fails")
    return
else
    com.setup()
end ]]


