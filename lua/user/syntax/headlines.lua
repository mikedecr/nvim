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
            ]]
        ),
        treesitter_language = "markdown",
        headline_highlights = { "Headline" },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        dash_string = "-",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headlines = false,
    }

headlines.setup {
    quarto = md_config,
    markdown = md_config
}

