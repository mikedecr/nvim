local check, notify = pcall(require, "notify")
if not check then
    vim.notify("notify overwrite fails, see lua/user/notify")
    return
end

