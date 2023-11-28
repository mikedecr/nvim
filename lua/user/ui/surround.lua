local ok, surround = pcall(require, 'mini.surround')
if not ok then
    vim.notify("Failed: mini.surround")
    return
end

surround.setup({
    mappings = {
        highlight = 'ss' -- prevent conflict w/ goto-split-left
    }
})

