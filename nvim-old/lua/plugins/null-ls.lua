local null_ls = require("null-ls")
-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
-- local completion = null_ls.builtins.completion

-- register any number of sources simultaneously
local sources = {
	formatting.prettierd.with({
		filetypes = { "html", "json", "yaml", "markdown", "yaml.ansible" },
	}),
	diagnostics.rubocop,
	formatting.rubocop,
	code_actions.gitsigns,
	formatting.stylua,
	hover.dictionary,
	formatting.gofumpt,
	formatting.autopep8,
}

null_ls.setup({
	sources = sources,
})
