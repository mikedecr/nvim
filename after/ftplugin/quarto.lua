local runner = require("quarto.runner")

local function silent_desc(text)
    return {silent = true, desc = text}
end

vim.keymap.set("n", "<Space>rc", runner.run_cell, silent_desc("run code chunk"))
vim.keymap.set("n", "<Space>ra", runner.run_above, silent_desc("run cell and above"))
vim.keymap.set("n", "<Space>rA", runner.run_all, silent_desc("run cell and above"))
vim.keymap.set("n", "<Space>rl", runner.run_line, silent_desc("run current line"))
vim.keymap.set("n", "<Space>sl", runner.run_line, silent_desc("run current line"))

