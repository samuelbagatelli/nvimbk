-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "pyright", "clangd", "rust_analyzer", "lua-language-server" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--fallback-style=webkit",
  },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Configuração do TypeScript Language Server
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    typescript = {
      preferences = {
        disableSuggestions = false,
      },
    },
    javascript = {
      preferences = {
        disableSuggestions = false,
      },
    },
  },
}

-- Configuração do Volar (Vue Language Server)
lspconfig.volar.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  init_options = {
    typescript = {
      tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
    },
  },
  settings = {
    volar = {
      completion = {
        autoImportComponent = true,
      },
      codeLens = {
        references = true,
        pugTools = true,
        scriptSetupTools = true,
      },
    },
  },
}
