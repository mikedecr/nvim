return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'L3MON4D3/LuaSnip',
       'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local expand_snippets = function(args)
            luasnip.lsp_expand(args.body)
        end

        -- gets some "default" language snippets from vscode
        -- this probably should live in the snippets config though
        require("luasnip/loaders/from_vscode").lazy_load()

        -- source: Table of {name, other params}. 
        --         This is how cmp knows where to look for completions.
        -- menu: String. How the source is annotated in the cmp dropdown menu.
        local sources_menu = {
            {source = {name = 'luasnip'}, menu = 'Snip'},
            {source = {name = 'nvim_lsp'}, menu = 'lsp'},
            {source = {name = "supermaven"}, menu = "llm"},
            {source = {name = 'otter'}, menu = 'Otter'},
            -- items from the same buffer
            {source = {name = 'buffer', keyword_length = 5}, menu = 'Buf'},
            -- filepaths?
            {source = {name = 'path'}, menu = 'Path'},
            -- nvim's builtin Lua runtime API
            {source = {name = 'nvim_lua'}, menu = 'Nvim Lua'},
            -- latex keys to expand unicode string values
            {source = {name = 'latex_symbols', option = { strategy = 0 }}, menu = 'TeX'}
        }

        -- list of cmp sources
        local source_list = {}
        for _, v in ipairs(sources_menu) do
            table.insert(source_list, v.source)
        end

        -- map of source name -> cmp menu text
        local menu_map = {}
        for _, v in ipairs(sources_menu) do
            menu_map[v.source.name] = v.menu
        end

        -- used for Tab key
        local check_backspace = function()
          local col = vim.fn.col "." - 1
          return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
        end

        local maps = {
            -- navigate snippet menu
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            -- `cmp.config.disable` will remove the default `<C-y>` mapping.
            ["<C-y>"] = cmp.config.disable,
            ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort()
                                    , c = cmp.mapping.close() },
            -- Accept selected item.
            -- Set select = false to confirm only explicitly selected items.
            ["<CR>"] = cmp.config.disable,
            ["<C-l>"] = cmp.mapping.confirm { select = false },
            -- setting Tab to overloaded Super Tab
            -- see the LunarVim video for more details on this?
            -- also https://www.youtube.com/watch?v=_DnmphIwnjo&t=523s is opinionated about Tab
            ["<Tab>"] = cmp.mapping(
                function(fallback)
                    if     cmp.visible()                then cmp.select_next_item()
                    elseif luasnip.expandable()         then luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
                    elseif check_backspace()            then fallback()
                    else   fallback()
                    end
                end,
                { "i", "s", }
            ),
            -- shift-tab
            ["<S-Tab>"] = cmp.mapping(
                function(fallback)
                    if     cmp.visible()        then cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then luasnip.jump(-1)
                    else   fallback()
                    end
                end,
                { "i", "s" }
            )
        }

        -- these are LSP-recognized entities?
        -- (and the icons are from vscode(?)?)
        local kind_icons = {
            -- stuff that might matter to me
            File = "",
            Folder = "",
            Value = "",
            Text = "",
            Method = "m",
            Function = "",
            Keyword = "",
            Field = "",
            Variable = "",
            Constant = "",
            Class = "",
            Module = "",
            Operator = "",
            Snippet = "",
            -- less likely
            Interface = "",
            Struct = "",
            Constructor = "",
            Reference = "",
            Property = "",
            Enum = "",
            EnumMember = "",
            TypeParameter = "",
            Event = "",
            Unit = "",
            Color = "",
        }


        cmp.setup({

            -- source data and snippet functionality
            -- ordering affects search priority
            sources = source_list,
            snippet = { expand = expand_snippets },

            -- UI
            mapping = maps,
            confirm_opts = { behavior = cmp.ConfirmBehavior.Replace
                           , select = false },

            -- aesthetics of the completion menu
            formatting = {
                fields = { "kind", "abbr", "menu" }, -- left -> right order
                format = function(entry, vim_item)
                    -- maps / table lookups
                    vim_item.menu = menu_map[entry.source.name]
                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    -- concat kind icon w/ name
                    -- vim_item.kind = string.format('%s %s', 
                    --                               kind_icons[vim_item.kind],
                    --                               vim_item.kind)
                    return vim_item
                end,
          },
        })

    end
}

