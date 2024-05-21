return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.6",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<space>ff", builtin.find_files, {desc = "Tele: files"})
        vim.keymap.set("n", "<space>fo", builtin.oldfiles, {desc = "Tele: files"})
        vim.keymap.set("n", "<space>gf", builtin.git_files, {desc = "Tele: git files"})
        vim.keymap.set("n", "<space>gc", builtin.git_commits, {desc = "Tele: git commits"})
        vim.keymap.set("n", "<space>fb", builtin.buffers, {desc = "Tele: buffers"})
        vim.keymap.set("n", "<space>fl", builtin.live_grep, {desc = "Tele: live grep"})
        vim.keymap.set(
            "n",
            "<space>fw",
            function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end,
            { desc = "Tele: find word" }
        )
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Tele: vim help tags"})
    end
}

