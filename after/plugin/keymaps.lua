local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
-- local expr_opts = { noremap = true, expr = true, silent = true }


-- toggle nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- hybrid numbering
keymap("n", "<C-n>", ":set relativenumber!<cr>", default_opts)

-- fuzzy finder
keymap("n", "<leader>f", ":Files<CR>", default_opts)

