local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

function get_setup(name)
  return string.format('require(\'setup/%s\')', name)
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = get_setup('tree'),
  }
  -- explorer: Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-github.nvim',
    },
    config = get_setup('telescope'),
  }
  -- code navigation: flash nvim
  use {
      'folke/flash.nvim',
      config = get_setup('flash'),
  }
  -- git integration: fugitive, gitSigns, gh 
  use {
    'tpope/vim-fugitive',
    config = get_setup('fugitive'),
  }
  use {
  -- a este le voy a cambiar los simbolos
    'lewis6991/gitsigns.nvim',
    config = get_setup('gitsigns'),
  }
  use {
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = get_setup('lazygit'),
  }
  use {
    'ldelossa/gh.nvim',
    requires = {
      'ldelossa/litee.nvim'
    },
    config = get_setup('gh'),
  }
  use {
    'f-person/git-blame.nvim',
  }
  -- theme: catppuccin
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = get_setup('catppuccin'),
  }
  -- better identation
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = get_setup('indent-blankline')
  }
  -- status line & tabs line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    },
    config = get_setup('lualine'),
  }
  use {
    'kdheepak/tabline.nvim',
    requires = {
      { 'hoob3rt/lualine.nvim', opt=true },
      {'kyazdani42/nvim-web-devicons', opt = true}
    },
    config = get_setup('tabline'),
  }
  -- highlight comments
  use {
    'folke/todo-comments.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = get_setup('todo-comments'),
  }
  -- start screen
  use {
    'goolord/alpha-nvim',
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
    config = get_setup('alpha'),
  }
  -- better ui
  use {
    'stevearc/dressing.nvim',
    config = get_setup('dressing'),
  }
  use {
    'RRethy/vim-illuminate',
    config = get_setup('illuminate'),
  }
  -- file tags: tagbar
  use {
    'preservim/tagbar',
    config = get_setup('tagbar'),
  }
  -- which key
  use {
    'folke/which-key.nvim',
    config = get_setup('which-key'),
  }
  -- fuzzy finder
  use {
    'junegunn/fzf',
    run = ":call fzf#install()"
  }
  use {
    'junegunn/fzf.vim',
  }
  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- autocomplete
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
    config = get_setup('lsp-zero'),
  }
  -- multi line edition
  use {
    'mg979/vim-visual-multi',
  }
  -- autopairs
  use {
    'jiangmiao/auto-pairs',
  }
  -- vimwiki
  use {
    'vimwiki/vimwiki',
  }
  -- buff kill
  use {
    'qpkorr/vim-bufkill',
  }
  -- comments
  use {
    'tpope/vim-commentary',
  }
  -- chatgpt
  use {
    'MunifTanjim/nui.nvim',
  }
  use {
    'jackMort/ChatGPT.nvim',
    config = get_setup('chatgpt'),
  }
  -- dadbod 
  use {
    'tpope/vim-dadbod',
  }
  use {
    'kristijanhusak/vim-dadbod-ui'
  }
  -- debug
  use {
    'mfussenegger/nvim-dap',
    config = get_setup('dap'),
  }
  -- refactoring
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    },
    config = get_setup('refactoring'),
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
