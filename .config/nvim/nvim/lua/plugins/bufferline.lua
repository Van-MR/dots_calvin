return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        -- mod = "tabs",
        component_separators = "|",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
  end,
}
