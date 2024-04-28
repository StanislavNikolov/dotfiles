-- Load lazy.nvim, a package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- colors
	{ 'echasnovski/mini.base16', version = '*' },
	{ "ellisonleao/gruvbox.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ 'rose-pine/neovim', name = 'rose-pine' },

	{ 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{ 'mbbill/undotree' },

	-- lsp
	-- Uncomment the two plugins below if you want to manage the language servers from neovim
	-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 0
		end,
		opts = { }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "javascript", "typescript", "html", "css" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	}
})

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['gopls'] = {'go'},
  }
})
-- require('lspconfig').lua_ls.setup({})
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})
-- Make enter accept auto-complete options
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  })
})

local wk = require("which-key")

require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

local builtin = require('telescope.builtin')

wk.register({
  f = {
    name = "Telescope", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    w = { "<cmd>Telescope live_grep<cr>", "Search in file"},
    b = { "<cmd>Telescope buffers<cr>", "Buffers"},
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps"},
    c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes"},
  },
  l = {
	name = "LSP",
	r = { function() vim.lsp.buf.rename() end, "Rename symbol" },
	a = { function() vim.lsp.buf.code_action() end, "Code action" },
	d = { function() vim.lsp.buf.definition() end, "Go to definition" },
	i = { function() vim.lsp.buf.incoming_calls() end, "Incoming calls" }
  },
  e = { vim.cmd.NvimTreeToggle, "File Tree" },
  u = { vim.cmd.UndoTreeToggle, "Undo Tree" },
  c = { function() vim.cmd.wincmd('c') end, "Close window" },
  q = { function() vim.cmd('bdelete') end, "Close buffer" },
}, { prefix = "<leader>" })

wk.register({
  b = { function() vim.cmd('bprevious') end, "Previous Buffer" },
}, { prefix = "[" })
wk.register({
  b = { function() vim.cmd('bnext') end, "Next Buffer" },
}, { prefix = "]" })

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "101"

vim.api.nvim_set_option("clipboard","unnamed")
vim.cmd.colorscheme('catppuccin')
-- vim.cmd.colorscheme('darkblue')
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

-- Highlight long lines
-- vim.cmd('highlight OverLengthLine ctermbg=red ctermfg=white guibg=#FF6B6B')
-- vim.cmd([[
--   autocmd BufEnter * lua HighlightOverLengthLines()
-- ]])
-- function HighlightOverLengthLines()
--   vim.fn.clearmatches()
--   local pattern = '\\%>100v.'
--   vim.fn.matchadd('OverLengthLine', pattern)
-- end
