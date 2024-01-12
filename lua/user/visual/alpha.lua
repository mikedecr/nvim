local status_ok, alpha = pcall(require, "alpha")
if not status_ok then return end


local dashboard = require("alpha.themes.dashboard")
local section = dashboard.section

local ascii_self = {
-- [[ @  .............,;0888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88880GCLfti;;::::;;i1tL0@@@@0008 ]],
-- [[ @@@:............,,,;0888@@@@@@@@@@@@@@@@:;,...::,..::;ff@@@@@@@@@@@88@@@88880GGCLt1i;;::;ii1tLLC080000 ]],
-- [[ @@@@@G..........,,,,:,1i1@@@@@@@888@@@8fL1fCC0800CGfLC0GCf@@@@@@@@@@@@@@@@@8Cti1;:;:::,.,,::;i1ffCG0G0 ]],
[[                ..,,,,:i;;@@@@@@@888GL;LLC08G88880tf1@@@@@@GCt,::::;,,:::;tttffftf1tii::  ]],
[[               ...,,,,:;;L@@@@@@@@@Lf0G88@@@@@@@@@@@@@8@@@@@@t::::::;;i1tiiiiiLfLfttttt1i ]],
[[              .....,,,;t11i;1ii;;:t088@@@@@@@@808@@@@@01:;C@@@C:;1t1tffffftfLLfttCffffffft ]],
[[             @@...,,,,;;t1iiiiiiiC@@@@@@@@@@@@@@@@@Gf;.....,:8@@;tfLLfG88@@@@@@@@@@@@@@@80G ]],
[[            @@@@@,,,.t1t1tttt111t@@@@@@@@@8880GCCf;:,      ..,18@@@@@@@@888888888@@@888000GC ]],
[[           @@@@@@@@;,tt1LCLG88@@0@@@@@C80fGti;:,..          ..:C8800000008888888@@@@@@@88800G ]],
[[          @@@@@@@@@@@81tG@@@@@@@@@@@@11;:,;:. ...           ..,f880000888888888@@@@@@@@@@@@800 ]],
[[         @@@@@@@@@@@@@i10@@@@@@@8@@@t::,.  ........          ...C@88888888888@@@@@@@@@@@@@@@@88 ]],
[[        @@@@@@@@@@@@@@itG@@@@@@@8@@@f;,,... ....         .,,;.  .@@888888888@@@@@@@@@@@@@@@@@@@8 ]],
[[       @@@@@@@@@@@@@@8ifG@@@@@@@@@@@0t::,...,...,.,.,;Gf88L:;;;..,t08888888@@@@@@@@@@@@@@@@@@@@@@ ]],
[[      @@@@@@@@@@@@@@@01f0@@@@@@@@@@@8;:::;iLG80ifL1, CLC08@@0C;,.:8::88888@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[     @@@@@@@@@@@@@@@@G1f8@@@@@@@@@@@@;.;L80CGG8001t; ;:;t1i1;,.,.;,;L88888@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[    @@@@@@@@@@@@@@@@@Ltf8@@@@@@@@@@@81:;1iG@@@L80C1i  :.,,,.,,. ...;:88@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[   @@@@@@@@@@@@@@@@@@t1f8@@@@@@@@@@@88:,;1i11ii1t.i;   :.    .,   .:,8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[  @@@@@@@@@@@@@@@@@@@LfL@@@@@@@@@@8;:i:..:;i;:;:.:t;.  ..,.. .    .,:8888@@@@@@@@@@@@@@@@@@@@@@@@@@@@L ]],
[[ @@@@@@@@@@@@@@@@@@@@ffL@@@@@@@@@@@ff:;,.. ,:,,,:iL;,.  .,..      ..:88888@@@@@@@@@@@@@@@@@@@@@@@@@@@fC ]],
[[  @@@@@@@@@@@@@@@@@@@Lff@@@@@@@@@@@@Cif:::,,,..,;ti8@0L;G0:...    ..f@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L ]],
[[   @@@@@@@@@@@@@@@@@@GG8@@@@@@@@@@@@@G:i:::;:,,:;1iG88C00000LLi   ..t@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[    @@@@@@@@@@@@@@@@@GLG@@@@@@@@@@@@@@8;;::;:::;iL88@0GCCfLffff,..,.L@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[     @@@@@@@@@@@@@@@@tCG@@@@@@@@@@@@@@@@8;;;:::;L00fC00C;,....,...,:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[      @@@@@@@@@@@@@@@ffG@@@@@@@@@@@@@@@@@8;;;;:;;tGCf;;i1t;::::,,,;G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[       @@@@@@@@@@@@@@CG8@@@@@@@@@@@@@@@@@@@i;;;;;1t11tfLCC1;:,,,:;8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[        ;8G@@@@@@@@@8LG8@@@@@@@@@@@@@@@@@@@@Liiiii1fff1;,,,...,:C1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[         tLt@@:@@@,@@G8G@@@@@@@8@@@@@@@@@@@@@0t1111t1ittftLtiiLC;;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[          C:@8C8@Cf@8080@@@@@@G:i8@@@@@@@t,C@@iittttffftfffffLf::: i@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[           i@00ttG1@0GG0@@@@@@   .C@@@@Ct80@@:iiii11ttttffLLti:,,:ft;@@@@@@@@@@@@@@@@@@@@@@@@ ]],
[[            @t@110C@GGG8@@@@@@@CC@@@@@L0@@@@,;;;iiii1i11ttti;,,,::,@LtL@@@@@@@@@@@@@@@@@@@@@ ]],
[[             @@@@@@@0GC8@@@@@@@@@@@@tL@@@@8L:::;;;ii1i11t1;:,.,,,,.8@LLCC@@@@@@@@@@@@@@@@@@ ]],
[[              @@@@@@GCG@@@@@@@@L88i,1@0@@@G ,::;iii11111i;:,..,,   LC8Li1t@@C@@@@@@@@@@@@@ ]],
[[               @@@@@008@@@8,f@@;  i;tC0@@@@t    ;11ttt11;:         G@@8,   .,1: L@@@@@@@@ ]],
[[                @@@@GC  C@@Ct ,0Cf1,:i1G@@@;                      ;8@@@@i    :CL    .@@@  ]],
-- [[ @@@@@@@@@@@@@@@@@8.1tiCLf@@@@@@L1,    .iLt:                      tC@@@@@@@@@@@8@@.    1fL@@@@@@@@@@@@@ ]],
-- [[ @@@@@@@@@@@@@@@:  ;1:ttt1    .@0t1,    :fLi                      Ltt1LLt, .,1@0i,     t,  L@@@@@@@@@@@ ]],
-- [[ @@@@@@@@@@@@@@f  .tL@8Gf    ;8@@LG,   .,t80                     ;tti:. :   :fft1i.  ..ttC,;G@@@@@@@@@@ ]],
-- [[ @@@@@@@@@@@@@@;t:L@@@@@C:;;1G@@@@@tt1111G@@                     8@@t..81;:itC@@@@G1;:i@@@f1:G@@@@@@@@@ ]],
-- [[ @@@@@@@@@@@@@i8@tG@@@@@LtttL@@@@@@0LLGCL8@@                    i@@Li@@@Gf110@@@@@@C1;;i@@G1i;L@8@@@@@@ ]],
-- [[ @@@@@@@@@@@@i;@@1L@@@@81f1tG@@@@@@88CfLfL8@                    @@Cf@@@@8fttfL@@@@@@G1:;@@C.   i@@18@@@ ]],
-- [[ @@@@@@@@@@@t,t@@G0@@@0t11;:C@@@@@@GfCfGfLG@i               f   @0t@@@@@@L;t1if@8@@@Gi. @8t     .G@@@@@ ]],
-- [[ @@@@@@@@@@@  C@@@1@@f1,. ::C@@@@@@L;;ii1ifGGi0C C,GGLGC,L: CLC@0t8@@@@@8f;:,:1CGt8@G:  1t;      11@@@@ ]],
-- [[ @@@@@@@@@@i  ,@@@CtG       i0@GGC0;,.     :i Gf i: G, L L 0t G@:;f8@8fCf:.     ti;:1:  ,i;:     L00@@8 ]],
-- [[ @@@@@@@@@@:   i@L0Lf       i88GfLf:.      .1@ GC Lt @. CL  0,t1  .fGC1ii;.     t1ii1i, 1fCGt,   ;8@8@@ ]],
-- [[ @@@@@@@@@@..11ftiC@L      .18CGGt1:       ,t8             :      ,i0C1fLt,     ;@@@G08G@@@@8f:,;:f8@@@ ]],
-- [[ @@@@@@@@@@;1C0@8@f@@., . .L@@@@@LG1, .:i:iLG                 .: .;G@@@@@@fi;:i:i00t.  1@@@@@8ti;.;fC8@ ]],
-- [[ @@@@@@@@@@;1G@@@@@L1;f@@@@@@@@@@@@Gf;iii;iC@t                .t;;10@@@@@@@@@@8C0Gt,   ,@@@@@@C:,  . iC ]],
-- [[ @@@@@@@@@tit@@@@@@@ G8@@@@@@@@@G@@@GfCCtttG8@                titfC@@@@@@@@@@@@8t1i     @@@@@0Li      t ]],
-- @@@@@@@@@@i, ,f@@@@@@:,8@@8@@@@GCC@@@@0LfLfGff0@                i@@@f@@@@@@@@@@@@8@L:.    t8@@@Gf,    @@@ ]],
-- @@@@@@@@@;1,  .@@@@@@:tif@@@8CCfL8@@@@8ft8CfLLG@              : t1CtfG@@@@@@@@@@0@Gffi:   ;:ffi,i:    @@@ ]],
-- @@@@@8C00it:   t1L@@@f;;t1C0t:;f888@@@Gt11iiitC8              ;:i;::i1C@@@@@GG@@t;;1;Cft1t,;LCi1;,.   @@@ ]],
-- @@@@@@@@@@@Li. itt@@@@11t,.  ,,:L@8@@@Ci;,.,..;f              ii,     ;fLLCG@0t:,,;;,i1G08G;tft1fL01;,@@@ ]],
-- @@@@@@@@@@@G1;.1L@@@@@C1.      :tC@@Gt:       :t  .           1t      ,iLf1tft@@@@@@@@@@@@01C@@@8@0t:,@@@ ]],
-- @@@@@@@@@@@C11tL@@@@@@@@@@@@@@@8@@@@f1,     . ,1  .           1f      ,:tttLLi;f@@@@GG@LL0CfL@@@@@@f,.@@@ ]],
-- @@@@@@@@@@CLt1L0@@@@@@@@@@8GL1i..iG01i::     .;L              1L      .iCGG@@GG0@@Gf1fiC1:LLf8@@@@@t. @@@ ]],
-- @@@@@@@88Ci:.;t0@@@@@@@@@LCGLi;:tLGGG8fti1i1iift              1Li1;:,iiL@@@@@@@@@@@@Gtt1. f11@@0G8Gt, @@@ ]],
-- @@@@@@@;;.   .,L@@@@@@@,fGt1LL@@GC0@@@0t1fLLfLC;              iL1;;iitf8@@@@@@@@@@@@@8t,  ;CLL@C11::,,@@@ ]],
-- @@@@@@L;       tG@@@@@@ .;iL@@@@@@@@@@@CLCCGLff               iCLfLtLCL8@@@@@@@@@@@@8f1:. 1@GLtt1:ft@L@@@ ]],
-- @@@@@@;.        iCLC08C   :@@@@@@@@@@@@000fCCLL               :Ctf@@@Cf88@@@@@@@@@@8Gt;,:,,@@,1f@@00Li@0@ ]],
-- @@@@@@8:       .LC8Lt@@: .1C@@@@@@@@@@@GLC0GCfL                LLfLttfLL8@@@@@@@@@GLfitt;:t@; GL;ii;; 8@@} ]],
}

-- local ayy_lmao = {
--     [[	     ☝                                  ]],
--     [[	    ＼＼                                ]],
--     [[	     ＼＼                               ]],
--     [[	      ＼(ಠ益ಠ)                          ]],
--     [[	       /      \                         ]],
--     [[	      /     へ ＼                       ]],
--     [[	     /     /  ＼＼                      ]],
--     [[	    /    ノ    ヽ_つ  ayy lmao          ]],
--     [[	   /   /              welcome to neovim ]],
--     [[	  /   / \  \                            ]],
--     [[	 (   /   \  \                           ]],
--     [[	 |  |      \ ＼                         ]],
--     [[	 | 丿       ＼⌒)                        ]],
--     [[	 | |         ) /                        ]],
--     [[	 /  )        Lﾉ                         ]],
--     [[	|  /                                    ]],
--     [[	Lﾉ                                      ]],
-- }

-- local banner_neovim = {
--     [[ ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗ ]],
--     [[ ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║ ]],
--     [[ ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║ ]],
--     [[ ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║ ]],
--     [[ ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║ ]],
--     [[ ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝ ]],
-- }

local slant_mikedecr = {
[[              _ __            __              ]],
[[   ____ ___  (_) /_____  ____/ /__  __________]],
[[  / __ `__ \/ / //_/ _ \/ __  / _ \/ ___/ ___/]],
[[ / / / / / / / ,< /  __/ /_/ /  __/ /__/ /    ]],
[[/_/ /_/ /_/_/_/|_|\___/\__,_/\___/\___/_/     ]],
}

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
-- section.header.val = banner_neovim
-- section.header.val = ascii_self
section.header.val = bold_mikedecr

section.buttons.val = {
	dashboard.button("f", "  file", ":Telescope find_files <CR>"),
	dashboard.button("n", "  new", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  recent", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  search", ":Telescope live_grep <CR>"),
	dashboard.button("p", "  project", ":Telescope projects <CR>"),
	dashboard.button("c", "  configure", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("l", "  lazy", ":Lazy<CR>"),
	dashboard.button("q", "  quit", ":qa<CR>"),
}

-- footer
section.footer.val = "mikedecr.netlify.app"
section.footer.opts.hl = "Type"
section.header.opts.hl = "Include"
section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
--
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

