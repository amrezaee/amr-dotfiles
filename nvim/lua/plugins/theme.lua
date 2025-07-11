return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    style = 'night',
    styles = {
      comments = { italic = false }, -- Disable italics in comments
    },
    terminal_colors = true,
    on_colors = function(colors)
      colors.fg_gutter = '#555595'
    end,
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight'
  end,
}
