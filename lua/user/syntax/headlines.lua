local ext_ok, headlines = pcall(require, "headlines")

if not ext_ok then
    vim.notify('headlines fails')
    return
end

-- this controls how markdown files are visually decorated.
-- The most obvious thing you'll notice is fenced code backgrounds
-- default <https://github.com/lukas-reineke/headlines.nvim>
local md_config = {
    query = vim.treesitter.query.parse(
        "markdown",
        [[
            (atx_heading [
                (atx_h1_marker)
                (atx_h2_marker)
                (atx_h3_marker)
                (atx_h4_marker)
                (atx_h5_marker)
                (atx_h6_marker)
            ] @headline)

            (thematic_break) @dash

            (fenced_code_block) @codeblock

            (block_quote_marker) @quote
            (block_quote (paragraph (inline (block_continuation) @quote)))
            (block_quote (paragraph (block_continuation) @quote))
            (block_quote (block_continuation) @quote)
        ]]
    ),
    headline_highlights = { "CodeBlock" },
    -- headline_highlights = false,
    bullet_highlights = {
    --     "@text.title.1.marker.markdown",
    --     "@text.title.2.marker.markdown",
    --     "@text.title.3.marker.markdown",
    --     "@text.title.4.marker.markdown",
    --     "@text.title.5.marker.markdown",
    --     "@text.title.6.marker.markdown",
    },
    -- bullets = { "◉", "○", "✸", "✿" },
    codeblock_highlight = "CodeBlock",
    dash_highlight = "Dash",
    dash_string = "-",
    quote_highlight = "Quote",
    quote_string = "┃",
    fat_headlines = false,
    fat_headline_upper_string = "▃",
    fat_headline_lower_string = "🬂",
    treesitter_language = "markdown"
}


headlines.setup({
    markdown = md_config,
    quarto = md_config,
    pandoc = md_config
})

