local ok, neo = pcall(require, "neo-tree")
if not ok then vim.notify("failed: neo-tree"); return; end

neo.setup({
    default_component_configs = {
        mapping_options = { noremap = true,
                            nowait = true },
    },
    filesystem = {
        window = { width = 30 }
    }
})

-- NeoTree maps

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<space>nf", "<cmd>NeoTreeFloatToggle<cr>", opts)
keymap("n", "<space>nb", "<cmd>NeoTreeFocusToggle<cr>", opts)
keymap("n", "<space>ns", "<cmd>NeoTreeRevealInSplitToggle<cr>", opts)

