ok, term_edit = pcall(require, "term-edit")
if not ok then vim.notify("failed: term-edit"); return; end

-- these need to be kept up to date w/ starship prompt configuration
-- perhaps we could read from that file somehow...
term_edit.setup({
    prompt_end = {"❯", "❮"}
})

