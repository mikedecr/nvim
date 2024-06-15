return {
    "pappasam/nvim-repl",
    init = function()
        -- set shells
        local SHELL = "bash"
        vim.g['repl_default'] = SHELL
        -- for some reason python is pre-initialized in the pkg file
        vim.g['repl_filetype_commands'] = {
            python = SHELL
        }

        -- repl behaviors
        vim.g["repl_split"] = "right"
        vim.keymap.set("n", "<space>ro", "<CMD>ReplOpen<CR>", {})
        vim.keymap.set("n", "<space>rc", "<CMD>ReplClose<CR>", {})

        -- send maps
        local send_visual = "<Cmd>execute 'set operatorfunc=repl#noop'<CR>:<C-u>call repl#sendvisual(visualmode())<CR>g@l<Cmd>execute 'set operatorfunc=repl#sendline'<CR>"
        vim.keymap.set("x", "<space>rp", send_visual, {})
        vim.keymap.set("n", "<space>rp", "vip" .. send_visual, {})
        vim.keymap.set("x", "<space>rr", send_visual .. "]]", {})
        vim.keymap.set("n", "<space>rr", "vip" .. send_visual .. "]]", {})
    end
}

