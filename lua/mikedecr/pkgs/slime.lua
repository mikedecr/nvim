return {
    "jpalardy/vim-slime",
    init = function()
        -- these two should be set before the plugin loads
        vim.g.slime_target = "neovim"
        vim.g.slime_no_mappings = true
    end,
    config = function()
        vim.g.slime_input_pid = false
        vim.g.slime_get_jobid = function()
            -- iterate over all buffers to find the first terminal with a valid job
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_get_option_value('buftype',{buf = bufnr}) == "terminal" then
                    local chan = vim.api.nvim_get_option_value( "channel",{buf = bufnr,})
                if chan and chan > 0 then
                    return chan
                end
              end
            end
            return nil
        end

        vim.g.slime_suggest_default = true
        vim.g.slime_menu_config = false
        vim.g.slime_neovim_ignore_unlisted = false
        -- options not set here are 
        -- g:slime_neovim_menu_order,
        -- g:slime_neovim_menu_delimiter,
        -- g:slime_get_jobid
        -- see the documentation above to learn about those options

        -- called MotionSend but works with textobjects as well
        vim.keymap.set("n", "gz", "<Plug>SlimeMotionSend", { remap = true, silent = false })
        vim.keymap.set("n", "gzz", "<Plug>SlimeLineSend", { remap = true, silent = false })
        vim.keymap.set("x", "gz", "<Plug>SlimeRegionSend", { remap = true, silent = false })
        vim.keymap.set("n", "gzc", "<Plug>SlimeConfig", { remap = true, silent = false })
    end
}
