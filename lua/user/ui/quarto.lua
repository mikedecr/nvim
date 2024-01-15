local qok, quarto = pcall(require, "quarto")
if not qok then
    vim.notify("failed: quarto-nvim")
    return
end

quarto.setup({
    codeRunner = {
        enabled = true,
        default_method = "molten"
    }
})

local runner = require("quarto.runner")

vim.keymap.set("n", "<Space>rc", runner.run_cell)
vim.keymap.set("n", "<Space>ra", runner.run_above, { desc = "run cell and above", silent = true })


