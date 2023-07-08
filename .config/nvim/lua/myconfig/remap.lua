vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") 


vim.keymap.set("n", "<leader>y", "\"+y") 
vim.keymap.set("v", "<leader>y", "\"+y") 
vim.keymap.set("n", "<leader>Y", "\"+Y") 

vim.keymap.set("n", "<leader>ws", vim.cmd.split) 
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit) 
vim.keymap.set("n", "<leader>wd", vim.cmd.close) 
