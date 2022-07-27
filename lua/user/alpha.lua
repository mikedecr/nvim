local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
local section = dashboard.section

section.header.val = {
    [[	     ☝                                  ]],
    [[	    ＼＼                                ]],
    [[	     ＼＼                               ]],
    [[	      ＼(ಠ益ಠ)                          ]],
    [[	       /      \                          ]],
    [[	      /     へ ＼                       ]],
    [[	     /     /  ＼＼                      ]],
    [[	    /    ノ    ヽ_つ  ayy lmao          ]],
    [[	   /   /              welcome to neovim ]],
    [[	  /   / \  \                            ]],
    [[	 (   /   \  \                           ]],
    [[	 |  |      \ ＼                         ]],
    [[	 | 丿       ＼⌒)                        ]],
    [[	 | |         ) /                        ]],
    [[	 /  )        Lﾉ                         ]],
    [[	|  /                                    ]],
    [[	Lﾉ                                      ]],
}

section.buttons.val = {
	dashboard.button("f", "  file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  new", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  recent", ":Telescope oldfiles <CR>"),
	dashboard.button("p", "  project", ":Telescope projects <CR>"),
	dashboard.button("t", "  search", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  configure", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  quit", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "mikedecr.netlify.app"
end

section.footer.val = footer()

section.footer.opts.hl = "Type"
section.header.opts.hl = "Include"
section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
--
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

