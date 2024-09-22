-- open floating file browser
vim.keymap.set('n', "<C-f>", ":Oil --float <cr>")
vim.keymap.set('n', "<Space>t", function()
    vim.cmd("vsplit | wincmd h | vertical resize 20")
    vim.cmd("Oil")
    vim.cmd("wincmd l")
    vim.cmd("split | wincmd j | resize 10")
    vim.cmd("term")
    vim.cmd("wincmd k")
end)

-- c++ compile and run
vim.keymap.set('n', "<C-cr>", function()
    if (vim.bo.filetype == "cpp") then
        vim.cmd("w")
        vim.cmd(':FloatermNew --title=Compiled_Output --autoclose=0 g++ % -o %< && ./%<')
    end
end
)

-- open obsidian file finder
vim.keymap.set('n', "<Space>ow", ":ObsidianQuickSwitch <cr>")
-- open calender
vim.keymap.set('n', "<Space>cc", ":Calendar -view=year -split=horizontal -position=below -height=12 <cr>")
-- alt to move cursor in insert mode
vim.keymap.set('i', "<M-h>", "<left>")
vim.keymap.set('i', "<M-j>", "<down>")
vim.keymap.set('i', "<M-k>", "<up>")
vim.keymap.set('i', "<M-l>", "<right>")

vim.keymap.set('t', "<Esc>", "<C-\\><C-n>")

-- todo comments *rmb to put ':' after keyword*
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
