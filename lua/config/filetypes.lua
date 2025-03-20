vim.g.do_filetype_lua = 1

vim.filetype.add({
  extension = {
    envrc = 'sh',
    gotmpl = 'gotmpl',
    rofi = 'rasi',
    wofi = 'rasi',
    install = 'sh.install',
  },
  filename = {
    ['.git/ignore'] = 'gitignore',
    ['terragrunt.hcl'] = 'terragrunt',
    ['PKGBUILD'] = 'sh.PKGBUILD',
  },
  pattern = {
    ['.*%.hcl'] = 'terragrunt',
    ['.*terraform/.*%.hcl'] = 'terragrunt',

    ['openapi.*%.ya?ml'] = 'yaml.openapi',
    ['openapi.*%.json'] = 'json.openapi',

    ['.*%.gitlab%-ci%.ya?ml'] = 'yaml.gl-ci',
    ['.*%.github/workflows/.*.ya?ml'] = 'yaml.gh-action',

    ['.*%.tmpl'] = 'gotmpl',

    ['.*/templates/.*%.tpl'] = 'helm',
    ['.*/templates/.*%.ya?ml'] = 'helm',
    ['helmfile.*%.ya?ml'] = 'helm',

    ['.*/hypr/.*%.conf'] = 'hyprlang',
  },
})
