local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- save and run current python script
keymap("n", "<leader>r", ":w<CR> :!python3 %<CR>", default_opts)


