local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- toggle nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", default_opts)

-- test for the config 
keymap("n", "tt", "<Cmd>echo 'you are in the minimal working example'<CR>", default_opts)



