ok, term_edit = pcall(require, "term-edit")
if not ok then vim.notify("failed: term-edit"); return; end

term_edit.setup({
    prompt_end = {"❯", "❮"}
})

