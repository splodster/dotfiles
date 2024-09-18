vim.opt.nu  = true
vim.opt.rnu = true
vim.opt.cursorline = true
vim.opt.fillchars = {eob = " "}

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
 
vim.opt.smartindent  = true
vim.opt.numberwidth = 1
vim.opt.wrap = true
vim.opt.linebreak=true
vim.opt.breakindent=true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors =  true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.completeopt = {"menuone", "menu", "noselect"}
vim.opt.conceallevel = 2

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
