vim.g.mapleader = ' '

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Easy movement across split panes
keymap.set({"n"}, '<C-h>', '<C-w>h')
keymap.set({"n"}, '<C-l>', '<C-w>l')
keymap.set({"n"}, '<C-j>', '<C-w>j')
keymap.set({"n"}, '<C-k>', '<C-w>k')

-- Relieve for my fingers
keymap.set({"n"}, ';', ':')
keymap.set({"n"}, ':', ';')

-- Better indentation
keymap.set({"v"}, '<', '<gv')
keymap.set({"v"}, '>', '>gv')

-- Toggle Nvim Tree
-- keymap.set({"n"}, '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)

-- Whichkey help
keymap.set({"n"}, '<leader>w', '<cmd>WhichKey<cr>', opts)

keymap.set({"n"}, "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set({"n"}, "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set({"n"}, "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set({"n"}, "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set({"n"}, "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find available buffers" })

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

--- Maximize a split
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })
