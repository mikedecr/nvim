local modules  = {
    "options",
    "maps",
    "pkg.alpha",
    "pkg.colors",
    "pkg.cmp",
    "pkg.git",
    "pkg.lsp",
    "pkg.markdown",
    "pkg.neoclip",
    "pkg.oil",
    "pkg.pairs",
    "pkg.projects",
    "pkg.quarto",
    "pkg.slime",
    "pkg.telescope",
    "pkg.termedit",
    "pkg.treesitter",
    "pkg.whichkey",
    "pkg.surround",
    "pkg.splitjoin",
    "pkg.symlink",
    "pkg.zen",

    -- drw-specific
    "pkg.codeium",
    "pkg.goose",
    "pkg.avante"
}

for _, module in ipairs(modules) do
    local ok, data_or_err = pcall(require, module)
    if not ok then
        print("Error loading module: " .. module)
        print(data_or_err)
    end
end
