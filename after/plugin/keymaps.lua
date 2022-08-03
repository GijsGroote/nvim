local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
-- local expr_opts = { noremap = true, expr = true, silent = true }


-- toggle nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- fuzzy finder
keymap("n", "<leader>f", ":Files<CR>", default_opts)

-- quote/unquote word     My first real remap :) it still qould use come work though
keymap("n", "<leader>i", '<lbi"<C-[><lea"<C-[>', default_opts)

