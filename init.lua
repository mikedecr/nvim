local modules  = {
    -- vim/neovim only
    "options",
    "maps",
    -- third-party
    "pkg.alpha",
    "pkg.colors",
    "pkg.cmp",
    "pkg.git",
    "pkg.lsp",
    "pkg.oil",
    "pkg.pairs",
    "pkg.projects",
    "pkg.quarto",
    "pkg.slime",
    "pkg.supermaven",
    "pkg.telescope",
    "pkg.treesitter",
    "pkg.whichkey",
    "pkg.surround",
    "pkg.splitjoin",
    "pkg.symlink",
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
