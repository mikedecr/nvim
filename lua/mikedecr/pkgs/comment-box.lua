return {
    "LudoPinelli/comment-box.nvim",
    config = function() 
        local opts = { noremap = true, silent = true }
        vim.keymap.set({"n", "v"}, "<Space>cl", "<Cmd>CBllline<CR>", opts)

        local line_chr = ":"
        local box = require("comment-box").setup({
            line_width = 50,
            lines = {
                line = line_chr,
                line_start = line_chr,
                line_end = line_chr,
                title_left = line_chr,
                title_right = line_chr,
            }
        })
    end
}
