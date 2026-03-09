return {
  name = 'kcl',
  description = 'KCL is an open-source, constraint-based record and functional language that enhances the writing of complex configurations, including those for cloud-native scenarios.',
  homepage = 'https://kcllang.io',
  licenses = {
    'Apache-2.0',
  },
  languages = { 'KCL' },
  categories = {
    'Compiler',
    'Formatter',
    'Linter',
  },
  source = {
    id = 'pkg:github/kcl-lang/cli@v0.12.3',
    asset = {
      {
        target = 'darwin_x64',
        file = 'kcl-{{version}}-darwin-amd64.tar.gz',
        bin = 'kcl',
      },
      {
        target = 'darwin_arm64',
        file = 'kcl-{{version}}-darwin-arm64.tar.gz',
        bin = 'kcl',
      },
      {
        target = 'linux_x64',
        file = 'kcl-{{version}}-linux-amd64.tar.gz',
        bin = 'kcl',
      },
      {
        target = 'linux_arm64',
        file = 'kcl-{{version}}-linux-arm64.tar.gz',
        bin = 'kcl',
      },
    },
  },
  bin = {
    kcl = '{{source.asset.bin}}',
  },
}
