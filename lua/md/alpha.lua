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


vim.pack.add({
    "https://github.com/goolord/alpha-nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-telescope/telescope.nvim"
})

-- bold_mikedecr
local dash = require("alpha.themes.dashboard")
dash.section.header.val = bold_mikedecr
dash.section.buttons.val = {
    dash.button("f", "  file", ":Telescope find_files <CR>"),
    dash.button("r", "  recent", ":Telescope oldfiles <CR>"),
    dash.button("t", "  search", ":Telescope live_grep <CR>"),
    dash.button("p", "  project", ":Telescope projects <CR>"),
    dash.button("c", "  configure", ":e ~/.config/nvim/init.lua <CR>"),
    dash.button("q", "  quit", ":q<CR>"),
}

local alpha = require("alpha")
alpha.setup(dash.opts)
