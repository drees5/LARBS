-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  {
    'stevearc/overseer.nvim',
    opts = {
      templates = {
        "builtin", "user.generate_cc"
      }
    },
  }
}
