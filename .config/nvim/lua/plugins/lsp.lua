return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          settings = {
            ["pyright"] = {
              autoImportCompletion = true,
            },
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
                autoImportCompletions = true,
                diagnosticMode = "openFilesOnly",
              },
              pythonPath = "/opt/bb/bin/python3.11",
              venvPath = "/bb/data/tmp/drees36/",
            },
          },
        },
        clangd = {},
        rust_analyzer = {
          settings = {
            ["rust_analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      },
    },
  },
}
