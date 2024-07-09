vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.g.mapleader = " "
vim.opt.guicursor = "n-i-v-c:block"

vim.keymap.set("n","<A-Up>",":m .-2<CR>==",{ noremap = true, silent = true })
vim.keymap.set("i","<A-Up>","<Esc>:m .-2<CR>==gi",{ noremap = true, silent = true })
vim.keymap.set("v","<A-Up>",":m '<-2<CR>gv=gv",{ noremap = true, silent = true })

vim.keymap.set("n","<A-Down>",":m .+1<CR>==",{ noremap = true, silent = true })
vim.keymap.set("i","<A-Down>","<Esc>:m .+1<CR>==gi",{ noremap = true, silent = true })
vim.keymap.set("v","<A-Down>",":m '>+1<CR>gv=gv",{ noremap = true, silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap("n", "<leader>hl", ":nohlsearch<CR>", { noremap = true, silent = true })

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    italic_comments = true,
    underline_links = true,
    disable_nvimtree_bg = true,
    group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

vim.cmd.colorscheme "vscode"

