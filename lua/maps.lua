local keymap = vim.keymap.set

-- noremap is default, but nice to be explicit
local opts = { noremap = true, silent = true }

local merge_tables = function(tables)
    local new_table = {}
    for i, _ in pairs(tables) do
        for k, v in pairs(tables[i]) do
            new_table[k] = v
        end
    end
    return new_table
end

local with_opts = function(table)
    return merge_tables({opts, table})
end

-- :::: NORMAL ::::

-- edit config
vim.keymap.set("n", "<SPACE>cc", ":e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "n", "nzz")

-- write & quit
keymap("n", "<SPACE>ww", "<CMD>w<enter>", { desc = "Write file" })
keymap("n", "<SPACE>qq", "<CMD>q<enter>", { desc = "Quit file" })

-- clipboard things [[
--[[
    There is a delicate setup here.
    This map lets me write to system clipboard (which can be fwd'd over ssh)
    but the terminal (e.g. Kitty) may ask before reading from system clipboard.
    This is a security thing; the client doesn't know what could be in the clipboard.
    But we can manually paste text from the operating system's keymap
]]
-- yank to clipboard
keymap("n", "<SPACE>y", '"+y', opts)
keymap("v", "<SPACE>y", '"+y', opts)


-- SPLITS
-- create splits
keymap("n", "<SPACE>sh", "<CMD>split<CR>", opts)
keymap("n", "<SPACE>sv", "<CMD>vsplit<CR>", opts)
-- terminal in split
local hsplit_term = "<CMD>split term://$SHELL<CR>"
keymap("n", "<SPACE>th", hsplit_term .. "<C-w>H", with_opts({desc = "Terminal left"}))
-- split navigation
keymap("n", "sh", "<C-w>h", with_opts({desc = "Focus left split"}))
keymap("n", "sj", "<C-w>j", with_opts({desc = "Focus down split"}))
keymap("n", "sk", "<C-w>k", with_opts({desc = "Focus up split"}))
keymap("n", "sl", "<C-w>l", with_opts({desc = "Focus right split"}))
keymap("n", "sp", "<C-w>p", with_opts({desc = "Focus previous split"}))
-- resize splits
keymap("n", "<C-k>", "<CMD>resize +2<CR>", {desc = "Increase window height"})
keymap("n", "<C-j>", "<CMD>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-h>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-l>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width" })

-- source file
keymap("n", "<SPACE>sof", "<CMD>source %<Enter>", { desc = "Source current file" })

-- clear line text without deleting the line
keymap("n", "dc", "0D", { desc = "Delete text from line" })

-- TABS
-- creation
keymap("n", "<SPACE>tr", "<CMD>tabnew<CR><CMD>terminal<CR>", { desc = "New tab with terminal buffer" })
keymap("n", "<SPACE>tt", "<CMD>tabnew<CR>", { desc = "New tab" })
-- navigation
keymap("n", "<space>tp", "<CMD>tabprev<CR>", { desc = ":tabprev" })
keymap("n", "<space>tn", "<CMD>tabnext<CR>", { desc = ":tabnext" })
keymap("n", "tml", "<CMD>tabmove +1<CR>", { desc = ":tabmove +1" })
keymap("n", "tmh", "<CMD>tabmove -1<CR>", { desc = ":tabmove +1" })

-- chunk selection
-- TODO scope to filetype config
keymap("n", "vic", "/```<CR>NjVnk", opts) -- select chunk contents
keymap("n", "vac", "/```<CR>NVn", opts)   -- select chunk + delimiters


-- :::: VISUAL ::::

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)


-- :::: TERMINAL ::::

-- exit terminal mode to normal
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
