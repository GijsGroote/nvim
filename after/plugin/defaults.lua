local api = vim.api
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
 
-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.timeoutlen = 300 -- Time [miliseconds] for whichkey to open
