vim.pack.add({
    "https://github.com/goolord/alpha-nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-telescope/telescope.nvim"
})

local dash = require("alpha.themes.dashboard")
local alpha = require("alpha")

local bold_mikedecr = {
[[    ]],
[[███╗   ███╗██╗██╗  ██╗███████╗██████╗ ███████╗ ██████╗██████╗ ]],
[[████╗ ████║██║██║ ██╔╝██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗]],
[[██╔████╔██║██║█████╔╝ █████╗  ██║  ██║█████╗  ██║     ██████╔╝]],
[[██║╚██╔╝██║██║██╔═██╗ ██╔══╝  ██║  ██║██╔══╝  ██║     ██╔══██╗]],
[[██║ ╚═╝ ██║██║██║  ██╗███████╗██████╔╝███████╗╚██████╗██║  ██║]],
[[╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝ ╚═════╝╚═╝  ╚═╝]],
[[                                                              ]],
[[]],
}

-- required dependencies for this part...
require("md.telescope")
require("md.projects")

local quick_buttons = {
    dash.button("f", "  file", ":Telescope find_files <CR>"),
    dash.button("r", "  recent", ":Telescope oldfiles <CR>"),
    dash.button("t", "  search", ":Telescope live_grep <CR>"),
    dash.button("p", "  project", ":Telescope projects <CR>"),
    dash.button("c", "  configure", ":e ~/.config/nvim/init.lua <CR>"),
    dash.button("q", "  quit", ":q<CR>"),
}


-- different themes have different config schema...
local theme = require("alpha.themes.theta")
theme.header.val = bold_mikedecr
theme.buttons.val = quick_buttons
alpha.setup(theme.config)
