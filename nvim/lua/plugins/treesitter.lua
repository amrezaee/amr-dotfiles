return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require 'nvim-treesitter.configs'

      configs.setup {
        sync_install = true,
        modules = {},
        ignore_install = {},
        ensure_installed = {
          'bash',
          'diff',
          'cpp',
          'c',
          'lua',
          'vim',
          'vimdoc',
          'html',
          'go',
          'rust',
          'python',
          'html',
          'css',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
