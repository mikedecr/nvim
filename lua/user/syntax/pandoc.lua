 -- disable conceal in markdown/quarto
vim.g['pandoc#syntax#conceal#use'] = false

-- embeds are already handled by treesitter injectons
vim.g['pandoc#syntax#codeblocks#embeds#use'] = false

vim.g['pandoc#syntax#conceal#blacklist'] = { 'codeblock_delim', 'codeblock_start' }

-- but allow some types of conceal in math reagions:
-- a=accents/ligatures d=delimiters m=math symbols
-- g=Greek  s=superscripts/subscripts
vim.g['tex_conceal'] = 'gm'

