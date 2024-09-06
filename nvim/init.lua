local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.uv.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

local keys = require('pckr.loader.keys')

require('pckr').add{
    {'tpope/vim-commentary', cond = keys('n', 'gc') },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    'dyng/ctrlsf.vim',
    {
        'pocco81/auto-save.nvim',
        config = function()
            auto_save = require('auto-save')
            auto_save.setup({
                enabled = true,
                trigger_events = { "BufLeave", "FocusLost", "VimLeave", "BufWinLeave" },
            	write_all_buffers = true,
            })
        end
    },
    {
        'junegunn/fzf',
        run = function()
            vim.fn['fzf#install']()
        end
    },
    'junegunn/fzf.vim',
    {
      "pmizio/typescript-tools.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      config = function()
          require("typescript-tools").setup {}
      end,
    },
    'neovim/nvim-lspconfig',
}

vim.g.have_nerd_font = true
vim.g.mapleader = ' '

vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.inccommand = 'split'
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>ff', '<Plug>CtrlSFPrompt')
vim.keymap.set('n', '<leader>fv', '<Plug>CtrlSFVwordExec')
vim.keymap.set('n', '<leader>fc', '<Plug>CtrlSFCwordPath')
vim.keymap.set('n', '<leader>ft', '<cmd>CtrlSFToggle<CR>')

vim.keymap.set('n', '<leader>pp', '<cmd>Files<CR>')
vim.keymap.set('n', '<leader>pr', '<cmd>Rg<CR>')
vim.keymap.set('n', '<leader>pt', '<cmd>GFiles<CR>')
