local wk = require('which-key')
wk.setup {
    plugins = {
        marks = false,
        registers = false,
        spelling = {enabled = false, suggestions = 20},
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false
        }
    }
}
local mappings = {
    q = { ":q<cr>", "Quit" },
    Q = { ":wq<cr>", "Save & Quit" },
    w = { ":w<cr>", "Save" },
    c = { ":bdelete<cr>", "Close Buffer" },
    E = { ":e ~/.config/nvim/init.lua", "Edit nvim config file" },
    f = {":Telescope find_files<cr>", "Telescope Find Files"},
    r = {":Telescope live_grep<cr>", "Telescope Live Grep"},
}
local opt = { prefix = '<leader>' }
wk.register(mappings, opts)
