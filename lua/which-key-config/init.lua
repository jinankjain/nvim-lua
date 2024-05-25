require("which-key").setup {
    plugins = {
        marks = true,     -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true,    -- adds help for operators like d, y, ...
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    operators = { gc = "Comments" },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
        border = "none",          -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000,            -- positive value to position WhichKey above other floating windows.
    },
}

local utils = require('utils')
local wk = require("which-key")
-- ToggleTerm Key Mappings
utils.map('i', [[<C-\>]], '<cmd>exe v:count1 . "ToggleTerm size=80 direction=vertical"<CR>')
utils.map('n', [[<C-\>]], '<cmd>exe v:count1 . "ToggleTerm size=80 direction=vertical"<CR>')

-- bufferline
utils.map('n', [[gb]], ':BufferLinePick<CR>')

-- Nvim Tree Key Mappings
utils.map('i', [[<C-n>]], ':NvimTreeToggle<CR>')
utils.map('n', [[<C-n>]], ':NvimTreeToggle<CR>')


-- toggle term
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-p>', [[<C-\><C-n><C-W>k]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- ufo code folding
vim.keymap.set('n', 'zN', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- telescope keymappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = "Find string under cursor in cwd" })

-- Relieve for my fingers
vim.keymap.set({ "n" }, ';', ':')
vim.keymap.set({ "n" }, ':', ';')

-- Easy movement across split panes
vim.keymap.set({ "n" }, '<C-h>', '<C-w>h')
vim.keymap.set({ "n" }, '<C-l>', '<C-w>l')
vim.keymap.set({ "n" }, '<C-j>', '<C-w>j')
vim.keymap.set({ "n" }, '<C-k>', '<C-w>k')

-- harpoon
-- vim.keymap.set('n', '<leader>hx', require('harpoon.mark').add_file)
vim.keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next)
vim.keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev)
utils.map('n', [[<leader>hm]], ':Telescope harpoon marks<CR>')

-- Harpoon Which-key mappings
wk.register({
    -- The first key you are pressing
    h = {
        name = "harpoon",
        -- the second key
        x    = { function()
            require('harpoon.mark').add_file()
        end, "Mark file" }
    },
}, { prefix = "<leader>" })

-- bufferline
utils.map(
    'n',
    [[<leader>bl]],
    ':BufferLinePick<CR>'
)

-- flash
wk.register({
    -- flash search
    l = {
        name = "flash",
        s = { function() require("flash").jump() end, "Flash Jump" },
        t = { function() require("flash").treesitter() end, "Flash Treesitter" },
        r = { function() require("flash").treesitter_search() end, "Flash Treesitter Search" },
    },
}, { prefix = "<leader>" })

wk.register({
    g = {
        name = "Gitsigns",
        s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk" },
        r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
        p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
        b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame Line" },
        f = { "<cmd>lua require('gitsigns').diffthis('~1')<cr>", "Diff This" },
        n = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Blame Line" },
    }
}, { prefix = "<leader>" })

-- spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

wk.register({
    l = {
        name = "Lspsaga",
        c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
        o = { "<cmd>Lspsaga outline<cr>", "Outline" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        d = { "<cmd>Lspsaga goto_definition<cr>", "Lsp GoTo Definition" },
        f = { "<cmd>Lspsaga finder<cr>", "Lsp Finder" },
        p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
        s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
        w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
    }
}, { prefix = "<leader>" })

local function visual_cursors_with_delay()
    -- Execute the vm-visual-cursors command.
    vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
    -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
    vim.cmd('sleep 200m')
    -- Press 'A' in normal mode after the delay.
    vim.cmd('silent! execute "normal! A"')
end

wk.register({
    m = {
        name = "Visual Multi",
        a = { "<Plug>(VM-Select-All)<Tab>", "Select All", mode = { "n" } },
        r = { "<Plug>(VM-Start-Regex-Search)", "Start Regex Search", mode = { "n" } },
        p = { "<Plug>(VM-Add-Cursor-At-Pos)", "Add Cursor At Pos", mode = { "n" } },
        v = { visual_cursors_with_delay, "Visual Cursors", mode = { "v" } },
        o = { "<Plug>(VM-Toggle-Mappings)", "Toggle Mapping", mode = { "n" } },
    }
}, { prefix = "<leader>" })

local mappings = {
    q = { ":q<cr>", "Quit" },
    Q = { ":wq<cr>", "Save & Quit" },
    w = { ":w<cr>", "Save" },
    c = { ":bdelete<cr>", "Close Buffer" },
    E = { ":e ~/.config/nvim/init.lua", "Edit nvim config file" },
}
local opt = { prefix = '<leader>' }
wk.register(mappings, opt)
