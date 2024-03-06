-- visual settings
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.o.termguicolors = true

-- tab settings
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smarttab = true

-- search settings
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- split settings
vim.opt.splitbelow = true
vim.opt.splitright = true

-- fold things by default
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- enable mouse mode
vim.o.mouse = 'a'

-- sync clipboard between os and neovim.
-- remove this option if you want your os clipboard to remain independent.
-- see `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- make line break and wrap at the indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 100

-- set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
