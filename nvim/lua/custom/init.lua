vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.tsx", "*.html", "*.css", "*.json", "*.md", "*.jsx", "*.java" },
  callback = function(args)
    require("conform").format({
      bufnr = args.buf,
      lsp_fallback = true,
      timeout_ms = 1000,
    })
  end,
})
