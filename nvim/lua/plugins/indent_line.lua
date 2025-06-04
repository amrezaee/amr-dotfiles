return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = '┊',
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    scope = {
      enabled = false,
    },
    exclude = {
      filetypes = {
        'help',
        'dashboard',
        'lazy',
        'NvimTree',
        'Trouble',
        'mason',
        'notify',
        'toggleterm',
        '',
      },
      buftypes = { 'terminal', 'nofile' },
    },
  },
}
