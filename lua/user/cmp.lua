-- video tutorial: https://www.youtube.com/watch?v=_DnmphIwnjo&t=523s


local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then 
    vim.notify('cmp fails')
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    vim.notify('luasnip fails')
    return
end

-- expanding function for `luasnip` engine.
local expand_snippets = function(args) luasnip.lsp_expand(args.body) end

require("luasnip/loaders/from_vscode").lazy_load()


---- map controls ---------

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
    -- Accept selected item. Set select = false to confirm only explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
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


--   פּ ﯟ   some other good icons
-- find more here: https://www.nerdfonts.com/cheat-sheets
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}


cmp.setup {
  -- we need a snippet engine
  snippet = { expand = expand_snippets },
  -- ordering affects search priority of snippet sources
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  },
  mapping = maps,
  confirm_opts = { behavior = cmp.ConfirmBehavior.Replace
                 , select = false },
  -- ::: controls the appearance of the snippet menu
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[NVIM_LUA]",
        luasnip = "[Snippet]",
        path = "[Path]",
        buffer = "[Buffer]",
      })[entry.source.name]
      return vim_item
    end,
  },
  window = {
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}

