return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        -- add any config here
      })
    end,
  },

    -- Telescope fuzzy finder native extension
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
  "stevearc/conform.nvim",
  config = function()
    require("custom.configs.conform")
  end,
  },
   {
    "NvChad/base46",
    lazy = false,
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },
}
