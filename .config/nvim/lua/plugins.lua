-- install package manager - see `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

--  you can configure plugins using the `config` key.
--  you can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  'tpope/vim-fugitive', -- git
  'tpope/vim-rhubarb',  -- gbrowse
  'tpope/vim-surround', -- motions for surrounding text objects
  'tpope/vim-sleuth',   -- detect tabstop and shiftwidth automatically
  'mg979/vim-visual-multi', -- i am a heretic

  -- themes
  {
    'sainnhe/sonokai',
    lazy = false,
    config = function()
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'sonokai'
    end
  },
  {
   'projekt0n/github-nvim-theme',
    lazy = false,
    config = function()
      require('github-theme').setup({
        palettes={
          all = {}
        }
      })
      vim.o.background = 'light'
      -- vim.cmd.colorscheme 'github_light'
    end,
  },

  -- note: this is where plugins related to lsp can be installed.
  {
    -- lsp configuration & plugins
    'neovim/nvim-lspconfig', 
    dependencies = {
      -- auto install lsp to stdpath
      { 'williamboman/mason.nvim', config = true },            
      -- bridges mason vs lspconfig plugin
      'williamboman/mason-lspconfig.nvim',                      
      -- useful status updates for lsp
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} }, 
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      -- configs lua-ls for nvim API re: working in init.lua
      'folke/neodev.nvim',                                      
    },
  },

  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- snippet engine
      'L3MON4D3/LuaSnip',             
      -- nvim-cmp src for engine
      'saadparwaiz1/cmp_luasnip',    
      -- adds lsp completion capabilities
      'hrsh7th/cmp-nvim-lsp',        
      -- adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',    
    },
  },

  -- show pending keybinds
  { 'folke/which-key.nvim',  
    event = "VeryLazy",
    opts = {
      window = { 
        border = "single", 
        margin = { 1, 0, 0, 0.7 }, 
      },
      layout = { 
        height = { min = 4, max = 75 },
        width = { min = 5, max = 50 }, 
      },
    } 
  },

  -- statusline helper, see `:help lualine.txt`
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'nightfly',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_b = { 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } }
      },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- fuzzy finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
}, {})

