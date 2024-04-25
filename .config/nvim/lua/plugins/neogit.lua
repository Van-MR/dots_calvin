-- This contains mainly Neogit but also a bunch of Git settings
-- like fetching branches with telescope or blaming with fugitive

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({
      kind = "tab",
    })
  end,
}
