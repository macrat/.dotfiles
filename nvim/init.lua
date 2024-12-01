---------- Vim settings ----------
-- Indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Display
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'n'
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100

-- Terminal
vim.keymap.set({'t', 'n'}, '<Esc>', '<C-\\><C-n>')

-- Data
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'
vim.opt.backup = false


---------- LSP ----------
require('lspconfig').cssls.setup{}  -- vscode-css-languageserver
require('lspconfig').gopls.setup{}  -- gopls
require('lspconfig').html.setup{}   -- vscode-html-languageserver
require('lspconfig').lua_ls.setup{} -- lua-language-server
require('lspconfig').pylsp.setup{}  -- python-lsp-server
require('lspconfig').ts_ls.setup{}  -- typescript-language-server
require('lspconfig').vacuum.setup{} -- vacuum

vim.filetype.add {
	pattern = {
		['.*%.schema%.json'] = 'json.openapi',
		['.*%.schema%.yaml'] = 'yaml.openapi',
		['.*%.openapi%.json'] = 'json.openapi',
		['.*%.openapi%.yaml'] = 'yaml.openapi',
		['openapi%.json'] = 'json.openapi',
		['openapi%.yaml'] = 'yaml.openapi',
	},
}


---------- Telescope.nvim ----------
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')

---------- Obsidian.nvim ----------
require('obsidian').setup({
    workspaces = {
        {
            name = 'notes',
            path = '~/notes',
        },
    },

    daily_notes = {
		folder = "daily",
		default_tags = { "daily" },
    },
})

---------- Oil.nvim ----------
require('mini.icons').setup()
require('oil').setup({
	columns = {
		'icon',
	},
	skip_confirm_for_simple_edits = true,
	watch_for_changes = true,
	show_hidden = true,
})

---------- CopilotChat.nvim ----------
require('CopilotChat').setup{}


---------- Tabular ----------
vim.g.no_default_tabular_maps = 1

vim.keymap.set({'n', 'v'}, [[\|]], [[:Tabularize /\|/l1<CR>]])
vim.keymap.set({'n', 'v'}, [[\:]], [[:Tabularize /^.\{-}:\zs/l0l1<CR>]])
vim.keymap.set({'n', 'v'}, [[\=]], [[:Tabularize /^.\{-}\zs=/l1<CR>]])
vim.keymap.set({'n', 'v'}, [[\,]], [[:Tabularize /,\zs/l0l1<CR>]])
vim.keymap.set({'n', 'v'}, [[\<Space>]], [[:Tabularize /[^ ]\+\zs /l0<CR>]])


---------- local vimrc ----------
if vim.loop.fs_stat(vim.fn.stdpath('config') .. '/lua/init_local.lua') then
	require('init_local')
end
