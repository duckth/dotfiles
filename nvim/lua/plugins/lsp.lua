return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        eslint = {},
        ruby_ls = {},
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
        ruby_ls = function()
          require("lazyvim.util").lsp.on_attach(function(client, buffer)
            local callback = function()
              local params = vim.lsp.util.make_text_document_params(buffer)

              client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
                if err then
                  return
                end

                vim.lsp.diagnostic.on_publish_diagnostics(
                  nil,
                  vim.tbl_extend("keep", params, { diagnostics = result.items }),
                  { client_id = client.id }
                )
              end)
            end

            callback()

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePre", "BufReadPost", "InsertLeave", "TextChanged" }, {
              buffer = buffer,
              callback = callback,
            })
          end)
        end,
      },
    },
  },
}
