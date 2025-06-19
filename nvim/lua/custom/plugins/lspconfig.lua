return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        jdtls = function()
          if vim.bo.filetype == "java" then
            require("custom.configs.jdtls").start()
            return true
          end
          return false
        end,
      },
    },
  },
}

