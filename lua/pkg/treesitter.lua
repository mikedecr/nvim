vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/MeanderingProgrammer/treesitter-modules.nvim"
})

local excluded_indentation_filetypes = {
    "python",
}


vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('treesitter.setup', {}),
    callback = function(args)
        local buf = args.buf
        local filetype = args.match

        -- if we don't have a parser, notify if it is installable.
        local language = vim.treesitter.language.get_lang(filetype) or filetype
        local parser_installed, err = vim.treesitter.language.add(language)
        if not parser_installed then
            local installable = require("nvim-treesitter").get_available()
            if vim.tbl_contains(installable, language) then
                print(err)
                print(language .. " parser can be installed using :TSInstall")
            end
            return
        end

        -- highlighting and indentation
        vim.treesitter.start(buf, language)

        -- only enable indentation if not in excluded filetypes
        if not vim.tbl_contains(excluded_indentation_filetypes, filetype) then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

    end,
})


local tsm = require("treesitter-modules")
tsm.setup({
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<S-CR>",
        },
    }
})
