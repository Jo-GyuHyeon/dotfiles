local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    -- on_attach = require("setup.lsp.handlers").on_attach,
    -- capabilities = require("setup.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("setup.lsp.server_config.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("setup.lsp.server_config.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "tsserver" then
    local tsserver_opts = require("setup.lsp.server_config.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server.name == "kotlin_language_server" then
    local kotlin_opts = require("setup.lsp.server_config.kotlin_server")
    opts = vim.tbl_deep_extend("force", kotlin_opts, opts)
  end


  server:setup(opts)
end)

