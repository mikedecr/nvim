return {
    "pappasam/nvim-repl",
    init = function()

        -- set shells
        -- for some reason python is set in pkg by default
        local SHELL = "$SHELL"
        vim.g['repl_filetype_commands'] = { python = SHELL }
        vim.g['repl_default'] = SHELL

        -- repl behavior
        vim.g["repl_split"] = "left"

        -- ::: keymaps :::
        local silent = {silent = true}
        -- open / close
        vim.keymap.set("n", "<space>ro", "<CMD>ReplOpen<CR><C-w>hi", silent)
        vim.keymap.set("n", "<space>rc", "<CMD>ReplClose<CR>", silent)
        vim.keymap.set("n", "<space>rt", "<CMD>ReplToggle<CR>", silent)
        -- send visual / paragraph
        local send_visual = "<Cmd>execute 'set operatorfunc=repl#noop'<CR>:<C-u>call repl#sendvisual(visualmode())<CR>g@l<Cmd>execute 'set operatorfunc=repl#sendline'<CR>"
        vim.keymap.set("x", "<space>rp", send_visual, silent)
        vim.keymap.set("n", "<space>rp", "vip" .. send_visual, silent)
        -- send visual / paragraph ** with step forward **
        vim.keymap.set("x", "<space>rr", send_visual .. "}j", silent)
        vim.keymap.set("n", "<space>rr", "vip" .. send_visual .. "}j", silent)
        -- send line, no step fwd
        local send_line = "<Cmd>execute 'set operatorfunc=repl#noop'<CR><Cmd>call repl#sendline()<CR>g@l<Cmd>execute 'set operatorfunc=repl#sendline'<CR>"
        vim.keymap.set("n", "<space>sl", send_line, silent)

    end
}

