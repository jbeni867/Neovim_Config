require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "csharp_ls", "basedpyright" },
}

local on_attach = function(_, _)
	vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<c-;>', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', '<c-k><c-i>', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {on_attach = on_attach }
require("lspconfig").csharp_ls.setup {on_attach = on_attach }
require("lspconfig").basedpyright.setup {on_attach = on_attach }
