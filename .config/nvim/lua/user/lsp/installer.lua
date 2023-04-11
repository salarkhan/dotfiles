local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require("user.lsp.lsp").on_attach
    }

    if server.name == "sumneko_lua" then
      local sumneko_opts = require("user.lsp.settings-lua")
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "gopls" then
      local f=io.open("./tools/bazel/gopackagesdriver.sh","r")
      if f~=nil then 
        io.close(f) 
        vim.fn.setenv("GOPACKAGESDRIVER", "./tools/bazel/gopackagesdriver.sh")
      end
      local gopls_opts = require("user.lsp.settings-gopls")
      opts = vim.tbl_deep_extend("force", gopls_opts, opts)
    end

    server:setup(opts)
end)
