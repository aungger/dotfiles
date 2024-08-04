vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set tabstop=2")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.vim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' }},
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled == true },
})

-- Setup mason for lsp
require('mason').setup()
require('mason-lspconfig').setup({
  'lua_ls',
  'bashls',
  'pkgbuild_language_server',
  'clangd',
  'golangci_lint_ls',
  'gopls',
  'jsonls',
  'biome',
  'markdown_oxide',
  'marksman',
  'sqlls',
  'sqls',
  'gitlab_ci_ls',
  'yamlls',
  'hydra_lsp'
})
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({})
lspconfig.bashls.setup({})
lspconfig.pkgbuild_language_server.setup({})
lspconfig.clangd.setup({})
lspconfig.golangci_lint_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.jsonls.setup({})
lspconfig.biome.setup({})
lspconfig.markdown_oxide.setup({})
lspconfig.marksman.setup({})
lspconfig.sqlls.setup({})
lspconfig.sqls.setup({})
lspconfig.gitlab_ci_ls.setup({})
lspconfig.yamlls.setup({})
lspconfig.hydra_lsp.setup({})
vim.keymap.set('n', 'h', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

-- Setup treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "c", "lua", "go", "vim" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

-- Setup Neo tree
vim.keymap.set('n', '<leader>t', ':Neotree filesystem reveal left<CR>')

-- Setup catppuccin colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Setup Telescope and telescope ui select
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

require('telescope').setup({
  extension = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown({})
    }
  }
})
require('telescope').load_extension('ui-select')
