local overrides = require("custom.configs.overrides")

local servers = {
  "jdtls", -- make sure it's listed
  -- other servers...
}

local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  for _, server in ipairs(servers) do
    local opts = {}

    local has_custom_opts, server_custom_opts = pcall(require, "custom.configs." .. server)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    lspconfig[server].setup(opts)
  end
end

return M

