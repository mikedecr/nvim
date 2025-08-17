local modules  = {
    -- vim/neovim only
    "options",
    "maps",
    -- third-party
    "md.alpha",
    "md.colors",
    "md.cmp",
    "md.git",
    "md.lsp",
    "md.oil",
    "md.pairs",
    "md.projects",
    "md.quarto",
    "md.slime",
    "md.supermaven",
    "md.telescope",
    "md.treesitter",
    "md.whichkey",
    "md.surround",
    "md.splitjoin",
    "md.symlink",
    -- term-edit?
    -- zen
    -- trouble(?)
    -- neoclip
}

for _, module in ipairs(modules) do
    local ok, data_or_err = pcall(require, module)
    if not ok then
        print("Error loading module: " .. module)
        print(data_or_err)
    end
end
