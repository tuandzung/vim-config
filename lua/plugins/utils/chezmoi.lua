return {
  -- Edit chezmoi managed files
  { import = 'lazyvim.plugins.extras.util.chezmoi' },
  -- Disable unused plugin
  { 'alker0/chezmoi.vim', enabled = false },
}
