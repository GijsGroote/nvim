local api = vim.api
local g = vim.g
local opt = vim.opt
-- local cmd = vim.cmd

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.timeoutlen = 300 -- Time [miliseconds] for whichkey to open

-- Indentation
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.number = true

-- set current directory for fuzzy search
opt.path:remove "/usr/include"
opt.path:append "**"


g.python3_host_prog = "/usr/local/bin/python3"
