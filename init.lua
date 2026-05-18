local modules  = {
    "options",
    "maps",
    "pkg.ai",
    "pkg.alpha",
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
    "pkg.python_indent",
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
    "pkg.zen",
}

for _, module in ipairs(modules) do
    local ok, data_or_err = pcall(require, module)
    if not ok then
        print("Error loading module: " .. module)
        print(data_or_err)
    end
end
