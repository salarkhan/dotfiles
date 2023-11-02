local m = {}

-- LSP on_attach
m.lsp_keys = function(client, bufnr)
	-- (TODO) are these opts necessary for any of these keybinds?
	local opts = function(desc)
		local o = { noremap = true, silent = true, buffer = bufnr }
		if desc then o["desc"] = desc end
		return o
	end

	-- goto
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("go to definition"))
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("go to declaration"))
	vim.keymap.set("n", 'K', vim.lsp.buf.hover, opts("hover"))
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts("go to implementation"))
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("go to reference"))
	-- lsp
	vim.keymap.set("n", "<leader>lv", vim.diagnostic.open_float, opts("open float"))
	vim.keymap.set("n", "<leader>li", function() vim.cmd("LspInfo") end, opts("info"))
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts("code action"))
	vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next({ buffer = bufnr }) end, opts("next diagnostic"))
	vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev({ buffer = bufnr }) end, opts("prev diagnostic"))
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts("rename"))
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts("signature help"))
end

-- Telescope
m.telescope_keys = function(ts)
	vim.keymap.set('n', '<leader>ff', ts.find_files, { desc = "files" })
	vim.keymap.set('n', '<leader>fl', ts.git_files, { desc = "git files" })
	vim.keymap.set('n', '<leader>fg', ts.live_grep, { desc = "live grep" })
	vim.keymap.set('n', '<leader>fs', ts.grep_string, { desc = "string in buffer" })
	vim.keymap.set('n', '<leader>fb', ts.buffers, { desc = "buffers" })
end

m.setup = function()
	vim.keymap.set("n", "<space>", '', {})
end

return m
