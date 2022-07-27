local ok, surround = pcall(require, "surround")
if not ok then vim.notify("surround fails") return end

-- https://github.com/ur4ltz/surround.nvim
surround.setup {
    mappings_style = "surround"
}


