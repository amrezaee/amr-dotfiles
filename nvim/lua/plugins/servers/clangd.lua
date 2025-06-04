return {
  setup = {
    cmd = {
      'clangd',
      '--background-index',
      '--clang-tidy',
      '--header-insertion=iwyu',
      '--completion-style=detailed',
      -- '--function-arg-placeholders',
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
      semanticHighlighting = true,
    },
    flags = { debounce_text_changes = 150 },
  },
}
