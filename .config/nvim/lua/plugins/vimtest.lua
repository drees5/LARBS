local _test_extensions = {
  ["cpp"] = true,
}

return {
  {
    "alfaix/neotest-gtest",
    is_test_file = function(file_path)
      local lib = require("neotest.lib")
      local elems = vim.split(file_path, lib.files.sep, { plain = true })
      local filename = elems[#elems]
      if filename == "" then -- directoryvimtest
        return false
      end
      local extsplit = vim.split(filename, ".", { plain = true })
      local extension = extsplit[#extsplit]
      local fname_last_part = extsplit[#extsplit - 1]
      local result = _test_extensions[extension]
          and (vim.startswith(filename, "test_") or vim.endswith(fname_last_part, "_test") or vim.endswith(
            fname_last_part,
            "t"
          ))
        or false
      return result
    end,
  },

  { "nvim-neotest/neotest-python" },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        "neotest-python",
        "neotest-rust",
        "neotest-gtest",
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
    },
  },

  {
    "mfussenegger/nvim-dap",
    configurations = {
      cpp = {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest"
      },
  },
  },
}
