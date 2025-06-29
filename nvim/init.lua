---------- Vim settings ----------
-- Indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.expandtab = true

-- Search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Display
vim.opt.conceallevel = 0
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100

-- Terminal
vim.keymap.set({'t', 'n'}, '<Esc>', '<C-\\><C-n>')
vim.api.nvim_create_autocmd('TermOpen', {
	callback = function()
		vim.cmd[[
			startinsert
			setl signcolumn=no
		]]
	end,
})
vim.env.NVIM_SERVERNAME = vim.v.servername

-- Data
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'
vim.opt.backup = false


---------- File type ----------
vim.cmd[[
	au FileType markdown setlocal sw=2 ts=2
	au FileType javascript,typescript,javascriptreact,typescriptreact,svelte setlocal sw=2 ts=2
	au FileType html,css setlocal sw=2 ts=2
	au FileType json,yaml setlocal sw=2 ts=2
	au FileType go setlocal noet
]]


---------- LSP ----------
local servers = {
	{'cssls', 'vscode-css-languageserver'},
	{'gopls', 'gopls'},
	{'html', 'vscode-html-languageserver'},
	{'lua_ls', 'lua-language-server'},
	{'pylsp', 'python-lsp-server'},
	{'ts_ls', 'typescript-language-server'},
	{'vacuum', 'vacuum'},
}
for _, server in ipairs(servers) do
	local name, cmd = unpack(server)
	if vim.fn.executable(cmd) then
		vim.lsp.enable(name)
	end
end

-- add filetypes for vacuum
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

---------- nvim-treesitter ----------
vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		vim.treesitter.start()
		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo.foldmethod = 'expr'
		vim.wo.foldlevel = 99
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

---------- Telescope.nvim ----------
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')

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

-- vim: ts=4 sw=4 noet
