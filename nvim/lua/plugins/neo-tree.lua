-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  opts = {
    window = {
      position = 'left',
      width = 35,
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function(arg)
          vim.cmd [[
          setlocal relativenumber
        ]]
        end,
      },
    },
    default_component_configs = {
      indent = {
        with_markers = true,
        indent_marker = '│',
        last_indent_marker = '└',
        indent_size = 2,

        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- 'thumbs.db',
          '.DS_Store',
        },
        never_show = {},
        never_show_by_pattern = { -- uses glob style patterns
          '.null-ls_*',
        },
      },
      window = {
        mappings = {
          ['<leader>r'] = 'refresh',
          ['l'] = 'open', -- open file/directory
          ['<CR>'] = 'open',
          ['h'] = 'close_node', -- close directory
          ['<BS>'] = 'close_node',
          ['gh'] = 'toggle_hidden', -- toggle hidden files
          ['?'] = 'show_help',

          -- File operations
          ['a'] = 'add',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['x'] = 'cut_to_clipboard',
          ['c'] = 'copy_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['<space>'] = 'none',
          ['P'] = { 'toggle_preview', config = { use_float = false } },
          ['O'] = {
            function(state)
              require('lazy.util').open(state.tree:get_node().path, { system = true })
            end,
            desc = 'Open with System Application',
          },
          -- Copy paths
          ['y'] = function(state)
            -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
            -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
            local node = state.tree:get_node()
            local filename = node.name
            vim.fn.setreg('"', filename)
            vim.notify('Copied: ' .. filename)
          end,
          ['Y'] = function(state)
            -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
            -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            vim.fn.setreg('"', filepath)
            vim.notify('Copied: ' .. filepath)
          end,
        },
      },
    },
  },
}
