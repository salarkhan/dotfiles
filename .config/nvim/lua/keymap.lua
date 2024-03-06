local m = {}


local opts = function(desc)
	local o = { noremap = true, silent = true, buffer = bufnr }
	if desc then o["desc"] = desc end
	return o
end

-- LSP on_attach
m.lsp_keys = function(client, bufnr)
	-- goto
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("go to definition"))
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("go to declaration"))
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts("go to implementation"))
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("go to reference"))
	-- lsp
	vim.keymap.set("n", '<leader>k', vim.lsp.buf.hover, opts("show docs"))
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts("diagnostic picker"))
	vim.keymap.set("n", "<leader>i", function() vim.cmd("LspInfo") end, opts("lsp info"))
	vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts("code action"))
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts("rename"))

	-- i dont think i really need these 
	-- vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next({ buffer = bufnr }) end, opts("next diagnostic"))
	-- vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev({ buffer = bufnr }) end, opts("prev diagnostic"))
	-- vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { inoremap=true } )
end


-- Telescope
m.telescope_keys = function(ts)
	vim.keymap.set('n', '<leader>f', ts.find_files, { desc = "file picker" })
	vim.keymap.set('n', '<leader>g', ts.git_files, { desc = "git files" })
	vim.keymap.set('n', '<leader>/', ts.live_grep, { desc = "global search" })
	vim.keymap.set('n', '<leader>b', ts.buffers, { desc = "buffer picker" })
end

m.setup = function()
	-- folds
	vim.keymap.set("n", "<leader>o", "zO", { noremap = true, desc = "open all folds at cursor" })
	vim.keymap.set("n", "<leader>c", "zC", { noremap = true, desc = "close all folds at cursor" })
	vim.keymap.set("n", "<leader>O", "zR", { noremap = true, desc = "open all folds in file" })
	vim.keymap.set("n", "<leader>C", "zM", { noremap = true, desc = "close all folds in file" })

	-- sometimes i fat finger :W for :w
	vim.api.nvim_create_user_command('W', 'w', {})
	vim.api.nvim_create_user_command('Wq', 'wq', {})

	-- leader
	vim.keymap.set("n", "<space>", '', {})
end

return m
