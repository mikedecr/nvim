local nvim_repl_config = {
    "pappasam/nvim-repl",
    config = function()
        local SHELL = "$SHELL"

        -- stateful
        require("repl").setup({
            filetype_commands = {
                python = {
                    cmd = SHELL
                }
            },
            open_window_default = "topleft vnew"
        })

        -- ::: keymaps :::
        local silent = {silent = true}
        -- open / close
        vim.keymap.set("n", "<space>ro", "<CMD>Repl<CR><C-w>h", silent)
        vim.keymap.set("n", "<space>ra", "<CMD>ReplAttach<CR><C-w>h", silent)
        vim.keymap.set("n", "<space>rc", "<CMD>ReplClose<CR>", silent)
        vim.keymap.set("n", "<space>rt", "<CMD>ReplToggle<CR>", silent)
        -- send visual / paragraph
        local send_visual = "<Cmd>execute 'set operatorfunc=repl#noop'<CR>:<C-u>call repl#sendvisual(visualmode())<CR>g@l<Cmd>execute 'set operatorfunc=repl#sendline'<CR>"
        vim.keymap.set("x", "<space>rp", send_visual, silent)
        vim.keymap.set("n", "<space>rp", "vip" .. send_visual, silent)
        -- send visual / paragraph ** with step forward **
        vim.keymap.set("x", "<space>rr", send_visual .. ")", silent)
        vim.keymap.set("n", "<space>rr", "vip" .. send_visual .. ")", silent)
        -- send line, no step fwd
        local send_line = "<Cmd>execute 'set operatorfunc=repl#noop'<CR><Cmd>call repl#sendline()<CR>g@l<Cmd>execute 'set operatorfunc=repl#sendline'<CR>"
        vim.keymap.set("n", "<space>sj", send_line, silent)
        vim.keymap.set("n", "<space>sl", send_line .. "k", silent)
    end

}


local iron_config = {
    "Vigemus/iron.nvim",
    config = function()
        local iron = require("iron.core")
        local common = require("iron.fts.common")
        iron.setup {
             repl_filetype = function(bufnr, ft)
                  return ft
                  -- or return a string name such as the following
                  -- return "iron"
            end,
             -- Your repl definitions come here
            repl_definition = {
              sh = {
                -- Can be a table or a function that
                -- returns a table (see below)
                command = {"zsh"}
              },
              python = {
                -- command = { "ipython", "--no-autoindent", "--gui=asyncio"},
                command = {"$SHELL"},
                format = common.bracketed_paste_python,
                block_dividers = { "# %%", "#%%" },
              }
            },
            keymaps = {
                toggle_repl = "<space>ro", -- toggles the repl open and closed.
                -- If repl_open_command is a table as above, then the following keymaps are
                -- available
                -- toggle_repl_with_cmd_1 = "<space>rv",
                -- toggle_repl_with_cmd_2 = "<space>rh",
                restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
                send_motion = "<space>sc",
                visual_send = "<space>rr",
                send_file = "<space>rf",
                send_line = "<space>rl",
                send_paragraph = "<space>rp",
                send_until_cursor = "<space>su",
                send_mark = "<space>sm",
                send_code_block = "<space>rb",
                send_code_block_and_move = "<space>rn",
                mark_motion = "<space>mc",
                mark_visual = "<space>mc",
                remove_mark = "<space>md",
                cr = "<space>s<cr>",
                interrupt = "<space>s<space>",
                exit = "<space>sq",
                clear = "<space>cl",
            }
        }
    end
}


return nvim_repl_config
