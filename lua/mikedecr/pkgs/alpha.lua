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


return {
    "goolord/alpha-nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope.nvim'
    },
    config = function()
        local alpha = require("alpha")
        local dash = require("alpha.themes.dashboard")
        dash.section.header.val = bold_mikedecr
        dash.section.buttons.val = {
            dash.button("f", "  file", ":Telescope find_files <CR>"),
            dash.button("n", "  new", ":ene <BAR> startinsert <CR>"),
            dash.button("r", "  recent", ":Telescope oldfiles <CR>"),
            dash.button("t", "  search", ":Telescope live_grep <CR>"),
            dash.button("p", "  project", ":Telescope projects <CR>"),
            dash.button("c", "  configure", ":e ~/.config/nvim/init.lua <CR>"),
            dash.button("l", "  lazy", ":Lazy<CR>"),
            dash.button("q", "  quit", ":q<CR>"),
        }

        alpha.setup(dash.opts)
    end
}

