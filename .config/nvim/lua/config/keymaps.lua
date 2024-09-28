-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- increment or decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- dw but from the end of the word
keymap.set("n", "dw", "vbd")

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- tab keymaps
keymap.set("n", "te", ":tabedit<cr>", opts)
keymap.set("n", "<tab>", ":tabnext<cr>", opts)
keymap.set("n", "<S-tab>", ":tabprevious<cr>", opts)

-- open splits
keymap.set("n", "ss", ":split<cr>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- move windows around
keymap.set("n", "sh", "<C-w>H")
keymap.set("n", "sk", "<C-w>K")
keymap.set("n", "sj", "<C-w>J")
keymap.set("n", "sl", "<C-w>L")

keymap.set("n", "<C-cr>", function()
  if vim.bo.filetype == "cpp" then
    vim.cmd("w")
    vim.cmd(":FloatermNew --title=Compiled_Output --autoclose=0 g++ % -o %< && ./%<")
  elseif vim.bo.filetype == "cs" then
    vim.cmd("w")
    vim.cmd(":FloatermNew --title=Compiled_Output --autoclose=0 dotnet run %")
  elseif vim.bo.filetype == "markdown" then
    vim.cmd("w")
    vim.cmd("!pandoc % -o %<.pdf")
    vim.api.nvim_feedkeys("<CR>", "n", true)
  end
end)
