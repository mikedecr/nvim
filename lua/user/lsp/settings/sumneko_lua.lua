return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },  -- makes lua LSP aware of the `vim` global
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
