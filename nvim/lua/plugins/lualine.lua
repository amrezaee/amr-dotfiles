return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'onedark',
      disabled_filetypes = {
        statusline = {
          'NvimTree',
          'neo-tree',
        },
      },
    },
  },
}
