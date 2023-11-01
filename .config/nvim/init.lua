-- must be set before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('plugins')
require('style')
require('keymap').setup()
