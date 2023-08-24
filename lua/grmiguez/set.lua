local opt = vim.opt

-- leader
vim.g.mapleader = " "

opt.syntax = 'enable'
opt.hidden = true
opt.errorbells = false
opt.shiftwidth = 4
opt.expandtab = true
opt.mouse = 'a'
-- misc
opt.wrap = false
opt.swapfile = false
opt.incsearch = true
opt.encoding = 'utf-8'
opt.clipboard = 'unnamedplus'
opt.incsearch = true
opt.foldlevel = 1
opt.foldclose = 'all'
-- completition
opt.completeopt = 'menu,menuone,noselect'
-- vimWiki
opt.compatible = false
opt.filetype = 'enable'
-- numbers
opt.number = true
opt.relativenumber = true
-- indent
opt.autoindent = true
opt.smartindent = true
-- perfomance
opt.updatetime = 50
opt.timeoutlen = 400
opt.redrawtime = 1500
opt.ttimeoutlen = 10
-- theme
opt.termguicolors = true
opt.background = 'dark'
opt.showmode = false

require('setup.dadbod')
