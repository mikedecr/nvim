-- these two should be set before the plugin loads
vim.g.slime_target = "neovim"
vim.g.slime_no_mappings = true

vim.pack.add({
    "https://github.com/jpalardy/vim-slime",
})

vim.g.slime_input_pid = false
vim.g.slime_suggest_default = true

vim.g.slime_menu_config = true
vim.g.slime_neovim_ignore_unlisted = false

-- options not set here are 
-- g:slime_neovim_menu_order,
-- g:slime_neovim_menu_delimiter,
-- g:slime_get_jobid
-- see the documentation above to learn about those options

-- vim.g.slime_get_jobid = function()
--     -- iterate over all buffers to find the first terminal with a valid job
--     for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
--         print(bufnr)
--         if vim.api.nvim_get_option_value('buftype',{buf = bufnr}) == "terminal" then
--             local chan = vim.api.nvim_get_option_value( "channel",{buf = bufnr,})
--             print(chan)
--         if chan and chan > 0 then
--             return chan
--         end
--         print("no valid chan")
--       end
--     end
--     return nil
-- end


-- called MotionSend but works with textobjects as well
vim.keymap.set("n", "<space>rr", "<Plug>SlimeMotionSend", { remap = true, silent = false })
vim.keymap.set("n", "<space>rl", "<Plug>SlimeLineSend", { remap = true, silent = false })
vim.keymap.set("x", "<space>rp", "<Plug>SlimeRegionSend", { remap = true, silent = false })
vim.keymap.set("n", "<space>rc", "<Plug>SlimeConfig", { remap = true, silent = false })
