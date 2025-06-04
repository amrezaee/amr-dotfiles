return {
  filetypes = { 'python' },
  formatter = { 'ruff_format', 'ruff_organize_imports' },
  linter = { 'ruff' },
  setup = {
    -- Limit Ruff LSP to open files
    on_attach = function(client, bufnr)
      -- Optional: Disable workspace-wide diagnostics
      client.server_capabilities.diagnosticProvider = { workspaceDiagnostics = false }
      client.server_capabilities.hoverProvider = false
    end,
  },
}
