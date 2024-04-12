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
        -- dash.section.buttons.val = {
        --     dashboard.button("f", "  file", ":Telescope find_files <CR>"),
        --     dashboard.button("n", "  new", ":ene <BAR> startinsert <CR>"),
        --     dashboard.button("r", "  recent", ":Telescope oldfiles <CR>"),
        --     dashboard.button("t", "  search", ":Telescope live_grep <CR>"),
        --     dashboard.button("p", "  project", ":Telescope projects <CR>"),
        --     -- dashboard.button("c", "  configure", ":e ~/.config/nvim/init.lua <CR>"),
        --     dashboard.button("l", "  lazy", ":Lazy<CR>"),
        --     dashboard.button("q", "  quit", ":qa<CR>"),
        -- }
        alpha.setup(dash.opts)
    end
}

