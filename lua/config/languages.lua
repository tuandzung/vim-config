return {
  -- Programming languages
  bash = {
    filetypes = {
      'sh',
      'bats',
      'sh.PKGBUILD',
    },
    parsers = { 'bash' },
    lsp_servers = {
      bashls = {},
      harper_ls = {},
    },
    linters = { 'shellcheck' },
    formatters = {
      'shellcheck',
      { 'shfmt', opts = { prepend_args = { '-i', '2', '-ci', '-bn', '-sr' } } },
    },
    null_ls = {
      {
        'shellcheck',
        type = 'code_actions',
        command = 'shellcheck',
        custom = true,
      },
    },
    endwise = true,
  },
  cpp = {
    filetypes = { 'c', 'cpp' },
    parsers = { 'cpp' },
    lsp_servers = { 'clangd', 'harper_ls' },
    formatters = { 'clang-format' },
    test = { 'neotest-gtest' },
  },
  css = {
    filetypes = { 'css', 'less' },
    parsers = { 'css' },
    lsp_servers = { 'tailwindcss' },
    linters = { 'stylelint' },
    formatters = { 'prettier' },
  },
  fish = {
    filetypes = { 'fish' },
    parsers = { 'fish' },
    lsp_servers = { 'fish_lsp' },
    endwise = true,
  },
  go = {
    filetypes = { 'go', 'gomod', 'gowork', 'gosum' },
    parsers = { 'go', 'gomod', 'gowork', 'gosum' },
    lsp_servers = { 'gopls', 'harper_ls' },
    formatters = { 'goimports', 'gofumpt' },
    null_ls = {
      { 'gomodifytags', type = 'code_actions', command = 'gomodifytags' },
      { 'impl', type = 'code_actions', command = 'impl' },
    },
    test = { 'neotest-golang' },
    linguist = { 'go' },
  },
  html = {
    filetypes = { 'html' },
    parsers = { 'html' },
    lsp_servers = { 'tailwindcss', 'html', 'harper_ls' },
  },
  java = {
    filetypes = { 'java' },
    parsers = { 'java' },
    lsp_servers = { 'jdtls', 'harper_ls' },
    test = { 'neotest-java' },
  },
  latex = {
    filetypes = { 'tex' },
    parsers = { 'latex' },
    lsp_servers = { 'ltex', 'texlab', 'vale_ls' },
    linters = { 'vale' },
    formatters = { 'tex-fmt' },
  },
  lua = {
    filetypes = { 'lua' },
    parsers = { 'lua' },
    lsp_servers = { 'lua_ls', 'harper_ls' },
    formatters = { 'stylua' },
    endwise = true,
  },
  python = {
    filetypes = { 'python' },
    parsers = { 'python' },
    lsp_servers = { 'pyright', 'ruff', 'ty' },
    linters = {
      'ruff',
      { 'ty', command = 'ty check' },
    },
    formatters = {
      { 'ruff_fix', command = 'ruff' },
      { 'ruff_format', command = 'ruff' },
      { 'ruff_organize_imports', command = 'ruff' },
    },
    test = { 'neotest-python' },
  },
  rust = {
    filetypes = { 'rust' },
    parsers = { 'rust' },
    lsp_servers = { 'rust_analyzer', 'harper_ls' },
  },
  sass = {
    filetypes = { 'scss', 'sass' },
    parsers = { 'scss' },
    lsp_servers = { 'tailwindcss' },
    linters = { 'stylelint' },
    formatters = { 'prettier' },
  },
  scala = {
    filetypes = { 'scala', 'sbt' },
    parsers = { 'scala' },
  },
  sql = {
    filetypes = { 'sql', 'mysql', 'plsql' },
    parsers = { 'sql' },
    linters = { 'sqlfluff' },
    formatters = {
      { 'sqlfluff', opts = { args = { 'format', '--dialect=ansi', '-' } } },
    },
  },
  typescript = {
    filetypes = {
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'javascript.jsx',
      'typescript.tsx',
    },
    parsers = { 'javascript' },
    lsp_servers = { 'vtsls', 'harper_ls', 'eslint-lsp' },
    linters = { 'biome' },
    formatters = { 'biome' },
    dap = { 'js', 'firefox' },
    test = {
      'neotest-jest',
      'neotest-vitest',
      'neotest-playwright',
      'vim-test',
    },
    autopairs = function(filetypes, rule)
      return {
        -- Add parentheses in arrow function
        rule('=>', ' {  }', filetypes)
          :replace_endpair(function(opts)
            local prev_3char = opts.line:sub(opts.col - 3, opts.col - 2)
            local next_char = opts.line:sub(opts.col, opts.col)
            if prev_3char:match('%)$') then
              return '<BS><BS> => {  }' .. next_char
            end
            return ' {  }'
          end)
          :set_end_pair_length(2),
      }
    end,
  },
  -- Tools & Markup
  cmake = {
    filetypes = { 'cmake' },
    parsers = { 'cmake' },
    lsp_servers = { 'neocmake', 'harper_ls' },
    linters = { 'cmakelint' },
    formatters = { 'cmakelang' },
  },
  csv = {
    filetypes = { 'csv' },
    parsers = { 'csv' },
  },
  d2 = {
    filetypes = { 'd2' },
    parsers = {
      {
        'd2',
        install_info = {
          url = 'https://github.com/madmaxieee/tree-sitter-d2',
        },
      },
    },
  },
  dbml = {
    filetypes = { 'dbml' },
    parsers = {
      {
        'dbml',
        install_info = {
          url = 'https://github.com/dynamotn/tree-sitter-dbml',
        },
      },
    },
  },
  dockerfile = {
    filetypes = { 'dockerfile' },
    parsers = { 'dockerfile' },
    lsp_servers = { 'dockerls' },
    linters = { 'hadolint' },
  },
  gitcommit = {
    filetypes = { 'gitcommit' },
    parsers = { 'gitcommit' },
    lsp_servers = { 'harper_ls' },
    linters = { 'gitlint' },
    null_ls = {
      { 'jira', type = 'completion', command = 'jira', custom = true },
    },
  },
  gitrebase = {
    filetypes = { 'gitrebase' },
    parsers = { 'git_rebase' },
    null_ls = {
      {
        'gitrebase',
        type = 'code_actions',
        command = 'git',
        mason = { enabled = false },
      },
    },
  },
  gotmpl = {
    filetypes = { 'gotmpl' },
    parsers = { 'gotmpl' },
    formatters = {
      { 'injected', command = 'lua', mason = { enabled = false } },
    },
    autopairs = function(filetypes, rule)
      return {
        -- Add parentheses in function
        rule('{{', '  }', filetypes):set_end_pair_length(2),
        rule('{-', '{-  }', filetypes)
          :replace_endpair(function(_) return '<BS><BS>{{-  }' end)
          :set_end_pair_length(2),
      }
    end,
  },
  helm = { -- See `gotmpl`
    filetypes = { 'gotmpl' },
    parsers = { 'helm' },
    lsp_servers = { 'helm_ls' },
    linters = { 'trivy' },
    formatters = {
      { 'injected', command = 'lua', mason = { enabled = false } },
    },
    autopairs = function(filetypes, rule)
      return {
        -- Add parentheses in function
        rule('{{', '  }', filetypes):set_end_pair_length(2),
        rule('{-', '{-  }', filetypes)
          :replace_endpair(function(_) return '<BS><BS>{{-  }' end)
          :set_end_pair_length(2),
      }
    end,
  },
  hyprlang = {
    filetypes = { 'hyprlang' },
    parsers = { 'hyprlang' },
    lsp_servers = { 'hyprls' },
  },
  json = {
    filetypes = { 'json', 'jsonc', 'json5' },
    parsers = { 'json5' },
    lsp_servers = { 'jsonls' },
    linters = { 'jsonlint', 'trivy' },
  },
  justfile = {
    filetypes = { 'just' },
    parsers = { 'just' },
    lsp_servers = { 'just_lsp' },
  },
  make = {
    filetypes = { 'config', 'automake', 'make' },
    parsers = { 'make' },
    lsp_servers = { 'autotools_ls' },
  },
  markdown = {
    filetypes = { 'markdown', 'markdown.mdx', 'codecompanion' },
    parsers = { 'markdown', 'markdown_inline' },
    lsp_servers = { 'marksman', 'vale_ls', 'harper_ls' },
    linters = { 'markdownlint-cli2', 'vale' },
    formatters = {
      { 'injected', command = 'lua', mason = { enabled = false } },
      {
        'markdown-toc',
        opts = {
          condition = function(_, ctx)
            for _, line in
              ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false))
            do
              if line:find('<!%-%- toc %-%->') then return true end
            end
          end,
        },
      },
      {
        'markdownlint-cli2',
        opts = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(
              function(d) return d.source == 'markdownlint' end,
              vim.diagnostic.get(ctx.buf)
            )
            return #diag > 0
          end,
        },
      },
    },
    null_ls = {
      { 'jira', type = 'completion', command = 'jira', custom = true },
    },
  },
  openapi = {
    filetypes = { 'yaml.openapi', 'json.openapi' },
    parsers = { 'yaml', 'json5' },
    lsp_servers = { 'vacuum' },
    linters = { 'yq' },
    formatters = { 'yq' },
  },
  systemd = {
    filetypes = { 'systemd' },
    parsers = {},
    lsp_servers = { 'systemd_ls' },
  },
  terraform = {
    filetypes = { 'tf', 'terraform', 'terraform-vars' },
    parsers = { 'hcl', 'terraform' },
    lsp_servers = { 'terraformls' },
    linters = { 'tflint', 'trivy' },
  },
  terragrunt = {
    filetypes = { 'terragrunt' },
    parsers = { 'hcl' },
    lsp_servers = { 'terraformls' },
  },
  toml = {
    filetypes = { 'toml' },
    parsers = { 'toml' },
    lsp_servers = { 'taplo', 'harper_ls' },
    formatters = {
      'taplo',
      { 'injected', command = 'lua', mason = { enabled = false } },
    },
    otter = true,
  },
  treesitter = {
    filetypes = { 'scheme' },
    parsers = { 'query' },
  },
  xml = {
    filetypes = { 'xml' },
    parsers = { 'xml' },
  },
  yaml = {
    filetypes = {
      'yaml',
      'yaml.gl-ci',
      'yaml.gh-action',
      'yaml.docker-compose',
    },
    parsers = { 'yaml' },
    lsp_servers = {
      'yamlls',
      'gitlab_ci_ls',
      'gh_actions_ls',
      'docker_compose_language_service',
    },
    linters = { 'yamllint', 'trivy' },
    formatters = {
      'yamlfmt',
      { 'injected', command = 'lua', mason = { enabled = false } },
    },
  },
}
