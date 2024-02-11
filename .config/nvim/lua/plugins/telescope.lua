return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/",       false },
    { "<leader><space>", false },
    {
      "<leader>e",
      function() require("telescope.builtin").find_files() end,
      desc = "Find files",
    },
    {
      "<leader>E",
      function() require("telescope.builtin").live_grep() end,
      desc = "Live grep",
    },
  },
}
