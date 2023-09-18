local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.setup({})

	-- normal mode
	wk.register({
		["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "Toggle Comment" },
		["h"] = { "<cmd>nohlsearch<cr>", "Clear search highlights" },
		["e"] = { "<cmd>NvimTreeFocus<cr>", "File Explorer" },
		b = {
			name = "Buffers",
			b = { "<cmd>BufferLinePick<cr>", "Jump" },
			e = { "<cmd>BufferLineSortByExtension<cr>", "Sort by extension" },
			d = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
			f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
			h = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
			l = { "<cmd>BufferLineCycleNext<cr>", "Next" },
			H = { "<cmd>BufferLineMovePrev<cr>", "Move previous" },
			L = { "<cmd>BufferLineMoveNext<cr>", "Move next" },
			q = { "<cmd>Bdelete<cr>", "Close buffer (preserve split)" },
			Q = { "<cmd>Bdelete<cr>", "Close buffer (close split)" },
			x = { "<cmd>BufferLinePickClose<cr>", "Pick to close" },
		},
		f = {
			name = "+Telescope",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			t = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			p = { "<cmd>Telescope projects<cr>", "Projects" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
			-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
			-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
			-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
			-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
			-- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
		},
		g = {
			name = "+Git",
			g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>" },
		},
		l = {
			name = "+LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
			d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
			f = { "<cmd>lua vim.lsp.buf.format{async = true}<cr>", "Format" },
			i = { "<cmd>LspInfo<cr>" },
			I = { "<cmd>Mason<cr>" },
			j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next diagnostic" },
			k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous diagnostic" },
			l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line diagnostic" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			R = { "<cmd>lua require('telescope.builtin').lsp_references<cr>", "References" },
			s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		},
		t = {
			name = "+Terminal",
			t = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
			g = { "<cmd>lua lazygit_toggle()<cr>", "Open lazygit" },
		},
	}, { prefix = "<leader>" })

	-- visual or selection mode
	wk.register({
		["/"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", "Toggle Comment" },
	}, { prefix = "<leader>", mode = "x" })
end

return M
