local ok, notify = pcall(require, "notify")

if not ok then
    vim.notify("failed: notify overwrite")
    return
end

