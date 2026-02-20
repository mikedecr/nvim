vim.pack.add({
    "https://github.com/coder/claudecode.nvim"
})


local ok, claude = pcall(require, "claudecode")
if not ok then
    vim.notify("claude config broken")
    return
end

claude.setup()


vim.keymap.set("n", "<space>co", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
vim.keymap.set("n", "<space>cb", "<cmd>ClaudeCodeAdd %<CR>", { desc = "Add Buffer to Context" })
vim.keymap.set("v", "<space>cs", "<cmd>ClaudeCodeSend<CR>", { desc = "Claude Code: Send Vis. Selection to Context" })
vim.keymap.set("n", "<space>ca", "<cmd>ClaudeCodeDiffAccept<CR>", { desc = "Claude Code: Accept Current Diff" })
vim.keymap.set("n", "<space>cr", "<cmd>ClaudeCodeDiffDeny<CR>", { desc = "Claude Code: Reject Current Diff" })


-- claude hijacks the esc key which is crazy.
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    local buffer = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buffer)

    if name:match('claude') then
      -- Switch to normal mode when pressing Escape in terminal mode
      vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { buffer = buffer })

      -- Send Escape when pressing Ctrl-X in terminal mode
      vim.keymap.set('t', '<C-x>', '<Esc>', { buffer = buffer })
    end
  end
})
