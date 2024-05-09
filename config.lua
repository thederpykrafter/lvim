-- Vim settings
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

-- Lvim settings
--lvim.transparent_window = true

-- make branch default style
lvim.builtin.lualine.sections.lualine_b = { "branch" }

lvim.builtin.nvimtree.setup.filters.dotfiles = true

-- Enable markdown lsp
require('lvim.lsp.manager').setup("marksman")

-- Plugins
lvim.plugins = {
  { 'wakatime/vim-wakatime', lazy = false },
  { -- Transparent
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').clear_prefix 'NvimTree'
      require('transparent').clear_prefix 'lualine'
      require('transparent').clear_prefix 'BufferLine'
      require('transparent').clear_prefix 'Telescope'
      require('transparent').clear_prefix 'which'
      require('transparent').clear_prefix 'Explorer'
      require('transparent').setup {
        groups = { -- table: default groups
          'Normal',
          'NormalNC',
          'Comment',
          'Constant',
          'Special',
          'Identifier',
          'Statement',
          'PreProc',
          'Type',
          'Underlined',
          'Todo',
          'String',
          'Function',
          'Conditional',
          'Repeat',
          'Operator',
          'Structure',
          'LineNr',
          'NonText',
          'SignColumn',
          'CursorLine',
          'CursorLineNr',
          'StatusLine',
          'StatusLineNC',
          'EndOfBuffer',
        },
        extra_groups = {
          'NormalFloat', -- plugins which have float panel such as Lazy, Mason, LspInfo
          'TabLineFill', -- tab seperator
          'WinBarNC', -- Explorer label aboce NvimTree
        },
      }
    end,
  },
}
