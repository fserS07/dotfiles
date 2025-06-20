local util = require("conform.util")

require("conform").setup({
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
    async = false; 
  },

  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettjier" },
    markdown = { "prettier" },
    -- java = { "google-java-format" }, 
  },

  formatters = {
    prettier = {
     command = "prettier",
      args = {
        "--stdin-filepath",
        "$FILENAME",
      },
      stdin = true,
      cwd = util.root_file({ ".prettierrc", "package.json", ".git" }),
    },
  },
})
