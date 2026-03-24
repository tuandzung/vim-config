return {
  name = 'sqlfluff',
  description = 'SQLFluff is a dialect-flexible and configurable SQL linter.',
  homepage = 'https://github.com/sqlfluff/sqlfluff',
  licenses = {
    'MIT',
  },
  languages = {
    'SQL',
  },
  categories = {
    'Linter',
    'Formatter',
  },
  source = {
    id = 'pkg:pypi/sqlfluff[rs]@4.0.4',
  },
  bin = {
    sqlfluff = 'pypi:sqlfluff',
  },
}
