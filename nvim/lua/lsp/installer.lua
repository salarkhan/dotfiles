local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require("lsp.lsp").on_attach
    }

    if server.name == "sumneko_lua" then
      local sumneko_opts = require("lsp.settings-lua")
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    server:setup(opts)
end)
