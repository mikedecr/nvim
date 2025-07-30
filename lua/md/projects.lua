-- detects "projects" in a file system
-- helpful for changing working directories when file-jumping
vim.pack.add({
    "https://github.com/ahmedkhalf/project.nvim"
})

local project = require("project_nvim")
project.setup({
    -- allow changing cwd
    manual_mode = false,
    ---@usage Methods of detecting the root directory
    --- Allowed values: **"lsp"** uses the native neovim lsp
    --- **"pattern"** uses vim-rooter like glob pattern matching. Here
    -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
    detection_methods = { "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    ---@ Show hidden files in telescope when searching for files in a project
    show_hidden = false,
    -- echoes the cwd notification to statusline
    silent_chdir = false,
    ---@usage list of lsp client names to ignore when using **lsp** detection. eg: { "efm", ... }
    ignore_lsp = {},
    ---@type string
    ---@usage path to store the project history for use in telescope
    datapath = vim.fn.stdpath("data"),
})

-- :::: register as a telescope extension ::::
local telescope = require("telescope")
telescope.load_extension('projects')
vim.keymap.set("n", "<space>fp", "<cmd>Telescope projects<cr>")
