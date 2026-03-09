return {
  name = 'kcl-language-server',
  description = 'KCL is an open-source, constraint-based record and functional language that enhances the writing of complex configurations, including those for cloud-native scenarios.',
  homepage = 'https://kcllang.io',
  licenses = {
    'Apache-2.0',
  },
  languages = { 'KCL' },
  categories = {
    'LSP',
  },
  source = {
    id = 'pkg:github/kcl-lang/kcl@v0.11.2',
    asset = {
      {
        target = 'darwin_x64',
        file = 'kclvm-{{version}}-darwin-amd64.tar.gz',
        bin = 'exec:kclvm/bin/kcl-language-server',
      },
      {
        target = 'darwin_arm64',
        file = 'kclvm-{{version}}-darwin-arm64.tar.gz',
        bin = 'exec:kclvm/bin/kcl-language-server',
      },
      {
        target = 'linux_x64_gnu',
        file = 'kclvm-{{version}}-linux-amd64.tar.gz',
        bin = 'exec:kclvm/bin/kcl-language-server',
      },
      {
        target = 'linux_arm64',
        file = 'kclvm-{{version}}-linux-arm64.tar.gz',
        bin = 'exec:kclvm/bin/kcl-language-server',
      },
    },
  },
  bin = {
    ['kcl-language-server'] = '{{source.asset.bin}}',
  },
  neovim = {
    lspconfig = 'kclls',
  },
}
