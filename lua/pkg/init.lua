local modules  = {
    "pkg.alpha",
    "pkg.ai",
    "pkg.blink",
    "pkg.bufjump",
    "pkg.colors",
    "pkg.format",
    "pkg.git",
    "pkg.lsp",
    "pkg.markdown",
    "pkg.neoclip",
    "pkg.oil",
    "pkg.pairs",
    "pkg.projects",
    "pkg.quarto",
    "pkg.slime",
    "pkg.stan",
    "pkg.telescope",
    "pkg.termedit",
    "pkg.treesitter",
    "pkg.whichkey",
    "pkg.surround",
    "pkg.splitjoin",
    "pkg.symlink",
}

for _, module in ipairs(modules) do
    local ok, data_or_err = pcall(require, module)
    if not ok then
        print("Error loading module: " .. module)
        print(data_or_err)
    end
end
