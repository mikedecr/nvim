-- https://raw.githubusercontent.com/hkupty/iron.nvim/master/doc/iron.txt

local iron_ok, iron = pcall(require, "iron.core")
if not iron_ok then
    vim.notify("iron failed")
    return
end


-- table of filetype: REPL binary
local repls = {
    sh     = {command = {"zsh"}},
    r      = {command = {"radian"}},
    python = {command = {"ipython", "--no-autoindent"}},
    quarto = {command = {"zsh"}}
}

-- keymaps for sending cmds and controlling REPL behavior
local maps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
}


iron.setup {
  config = {
    repl_definition = repls,
    should_map_plug = false, -- expose `<plug>(...)` mappings for the plugins
    scratch_repl = true,     -- should a repl be discarded
    repl_open_cmd = 'belowright 20 split', -- the default is a float window, bottom, height 40
    highlight_last = false,
  },
  keymaps = maps, -- or use `should_map_plug = true` and map from you vim files
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  -- highlight = {
  --   italic = true
  -- }
}

--------------------------------------------------
-- other maps

local keymap = vim.api.nvim_set_keymap          -- fn to write a map
local opts = {noremap = true, silent = true}    -- table of map options

keymap('n', '<space>irh', '<cmd>IronReplHere<cr>', opts)
keymap('n', '<space>irs', '<cmd>IronRestart<cr>', opts)

