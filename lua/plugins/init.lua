return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "markdown",
        "c",
        "cpp",
        "javascript",
        "toml",
        "vue",
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        dap = {
          adapter = {
            type = "executable",
            command = "codelldb",
            args = { "--port", "${port}" },
          },
          configurations = {
            {
              type = "codelldb",
              request = "launch",
              name = "Launch file",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = true,
            },
          },
        },
        tools = {
          inlay_hints = {
            enable = true,
            auto = true,
            show_parameter_names = true,
            parameter_names_prefix = "",
            type_hints_prefix = ":",
            other_hints_prefix = "=>",
          },
        },
      }
    end,
  },

  { "rust-lang/rust.vim" },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup()
    end,
  },

  -- Para autocomplicação (se você ainda não tem um)
  -- Exemplo com nvim-cmp:
  -- {
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     'hrsh7th/cmp-nvim-lsp',
  --     'L3MON4D3/LuaSnip', -- ou outro motor de snippet
  --     'saecki/crates.nvim', -- Integração com crates.nvim
  --   },
  --   config = function()
  --     local cmp = require('cmp')
  --     cmp.setup({
  --       sources = cmp.config.sources({
  --         { name = 'nvim_lsp' },
  --         { name = 'luasnip' },
  --         { name = 'crates' }, -- Adiciona a fonte para crates
  --       }),
  --       -- Outras configurações cmp...
  --     })
  --   end,
  -- },
}
