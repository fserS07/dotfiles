-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
theme = "onedark",

-- hl_override = {
-- Comment = { italic = true },
-- ["@comment"] = { italic = true },
-- },
}

M.plugins = "plugins" -- custom plugin folder
M.mappings = require("mappings")

-- M.plugins = "custom.plugins"

-- vim.o.mouse = "a"
-- vim.o.guicursor = ""- vim.o.mouse = "" -- This disables mouse support

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

vim.api.nvim_create_autocmd({"InsertEnter"}, {
  pattern = "*",
  callback = function()
    vim.o.mouse = "n"
  end,
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
  pattern = "*",
  callback = function()
    vim.o.mouse = "a"
  end,
})

return M
