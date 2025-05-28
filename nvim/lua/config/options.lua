vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true

vim.opt.number = true

vim.wo.relativenumber = true

vim.opt.cursorline = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.opt.updatetime = 250

vim.opt.timeoutlen = 800

vim.opt.inccommand = 'split'

vim.opt.scrolloff = 10

vim.opt.confirm = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Search related
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

-- Undo history related
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true
-- vim.opt.colorcolumn = "90"
