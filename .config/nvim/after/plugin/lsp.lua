local cmp = require('cmp')
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
  },
}

require('mason').setup()

require('mason-lspconfig').setup({
	ensure_installed = {
		'gopls',
		'tsserver',
		'rust_analyzer',
	}
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()


local lsp_attach = function(client, bufnr)
	-- keybinds
	require("keymap").lsp_keys(client, bufnr)

  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end


local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
	function(server_name)
		opts = {
			on_attach = lsp_attach,
			capabilities = capabilities,
		}

		local require_ok, conf_opts = pcall(require, "lsp.configs."..server_name)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		lspconfig[server_name].setup(opts)
	end
})

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = false, -- disable virtual text
  signs = {
    active = signs, -- show signs
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
