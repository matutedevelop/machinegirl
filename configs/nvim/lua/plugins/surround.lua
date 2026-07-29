return {
  {
    "echasnovski/mini.surround",
    version = "*", -- Use the stable version
    event = "VeryLazy", -- Lazy load on startup for performance
    config = function()
      require("mini.surround").setup({})
    end,
  },
}

