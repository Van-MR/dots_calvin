-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Exit insert mode without hitting Esc
keymap.set("i", "<C-c>", "<Esc>", { desc = "Esc" })

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- file operate
keymap.set("n", "S", ":w<Return>")
keymap.set("n", "Q", ":q!<Return>")

-- fase move line
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Toggle Transparent
keymap.set("n", "TT", ":TransparentToggle<CR>", { noremap = true })

-- Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", ":vertical resize -10<CR>", { noremap = true })
keymap.set("n", "<C-w><right>", ":vertical resize +10<CR>", { noremap = true })

-- Better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- telescope
-- keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>th", "<cmd>Telescope colorscheme<CR>")
keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>")

-- keymap.set("n", "<leader>r", function()
-- 	require("craftzdog.hsl").replaceHexWithHSL()
-- end)

-- Git
keymap.set("n", "<leader>gs", require("neogit").open, { silent = true, noremap = true })
keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true })
keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true })
keymap.set("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true })
keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true, noremap = true })
keymap.set("n", "<leader>gB", ":G blame<CR>", { silent = true, noremap = true })

-- debuger
vim.keymap.set("n", "<leader>bp", require("dap").toggle_breakpoint, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>bc", require("dap").continue, { silent = true, noremap = true })

keymap.set("n", "<leader>i", function()
  require("craftzdog.lsp").toggleInlayHints()
end)
