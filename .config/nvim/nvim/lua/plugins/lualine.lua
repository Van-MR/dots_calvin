return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "buffers",
          },
        },
      },
    })
  end,
}
