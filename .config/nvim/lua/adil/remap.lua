-- open floating file browser
vim.keymap.set('n', "<C-f>", ":Oil --float<cr>")
-- open obsidian file finder
vim.keymap.set('n', "<Space>ow", ":ObsidianQuickSwitch <cr>")
-- open calender
vim.keymap.set('n', "<Space>cc", ":Calendar -view=year -split=horizontal -position=below -height=12 <cr>")
--open NETRW
vim.keymap.set('n', "<Space>e", ":Ex<cr>")
-- alt to move cursor in insert mode
vim.keymap.set('i', "<M-h>", "<left>")
vim.keymap.set('i', "<M-j>", "<down>")
vim.keymap.set('i', "<M-k>", "<up>")
vim.keymap.set('i', "<M-l>", "<right>")

-- todo comments *rmb to put ':' after keyword*
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
