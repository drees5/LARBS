return {
  name = "Generate-cc",
  builder = function()
    -- Full path to current file (see :help expand())
    return {
      cmd = { "generate-cc" },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
