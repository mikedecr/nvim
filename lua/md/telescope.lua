vim.pack.add({
    {src = "http://github.com/nvim-telescope/telescope.nvim",
     tag = "0.1.6"},
    "http://github.com/nvim-lua/plenary.nvim",
    "http://github.com/nvim-telescope/telescope-live-grep-args.nvim"
})

local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
telescope.setup({
    -- customize picker behavior
    pickers = {
        colorscheme = {enable_preview = true}
    },
    extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-space>"] = lga_actions.to_fuzzy_refine,
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        }
      }
})
-- grep w/ args
telescope.load_extension("live_grep_args")
local live_grep_args = require("telescope").extensions.live_grep_args.live_grep_args
-- keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space>ff", builtin.find_files, {desc = "Tele: files"})
vim.keymap.set("n", "<space>fo", builtin.oldfiles, {desc = "Tele: recent files"})
vim.keymap.set("n", "<space>gf", builtin.git_files, {desc = "Tele: git files"})
vim.keymap.set("n", "<space>gc", builtin.git_commits, {desc = "Tele: git commits"})
vim.keymap.set("n", "<space>fb", builtin.buffers, {desc = "Tele: buffers"})
vim.keymap.set("n", "<space>fl", live_grep_args, {desc = "Tele: live grep"})
vim.keymap.set("n", "<space>fc", builtin.colorscheme, {desc = "Tele: colorscheme"})
vim.keymap.set(
    "n",
    "<space>fw",
    function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
    end,
    { desc = "Tele: find word" }
)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Tele: vim help tags"})

