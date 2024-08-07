local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.setup({})

	-- normal mode
  wk.add({
    { "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Toggle Comment" },
    { "<leader>b", group = "Buffers" },
    { "<leader>bH", "<cmd>BufferLineMovePrev<cr>", desc = "Move previous" },
    { "<leader>bL", "<cmd>BufferLineMoveNext<cr>", desc = "Move next" },
    { "<leader>bQ", "<cmd>Bdelete<cr>", desc = "Close buffer (close split)" },
    { "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Jump" },
    { "<leader>bd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
    { "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by extension" },
    { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
    { "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
    { "<leader>bl", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
    { "<leader>bq", "<cmd>Bdelete<cr>", desc = "Close buffer (preserve split)" },
    { "<leader>bx", "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "File Explorer" },
    { "<leader>f", group = "Telescope" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>g", group = "Git" },
    { "<leader>gg", desc = "<cmd>lua _LAZYGIT_TOGGLE()<cr>" },
    { "<leader>h", "<cmd>nohlsearch<cr>", desc = "Clear search highlights" },
    { "<leader>l", group = "LSP" },
    { "<leader>lI", desc = "<cmd>Mason<cr>" },
    { "<leader>lR", "<cmd>lua require('telescope.builtin').lsp_references<cr>", desc = "References" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async = true}<cr>", desc = "Format" },
    { "<leader>li", desc = "<cmd>LspInfo<cr>" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", desc = "Next diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Previous diagnostic" },
    { "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line diagnostic" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature help" },
    { "<leader>t", group = "Terminal" },
    { "<leader>tg", "<cmd>lua lazygit_toggle()<cr>", desc = "Open lazygit" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  })
	-- wk.register({
	-- 	["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "Toggle Comment" },
	-- 	["h"] = { "<cmd>nohlsearch<cr>", "Clear search highlights" },
	-- 	["e"] = { "<cmd>NvimTreeFocus<cr>", "File Explorer" },
	-- 	b = {
	-- 		name = "Buffers",
	-- 		b = { "<cmd>BufferLinePick<cr>", "Jump" },
	-- 		e = { "<cmd>BufferLineSortByExtension<cr>", "Sort by extension" },
	-- 		d = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
	-- 		f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
	-- 		h = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
	-- 		l = { "<cmd>BufferLineCycleNext<cr>", "Next" },
	-- 		H = { "<cmd>BufferLineMovePrev<cr>", "Move previous" },
	-- 		L = { "<cmd>BufferLineMoveNext<cr>", "Move next" },
	-- 		q = { "<cmd>Bdelete<cr>", "Close buffer (preserve split)" },
	-- 		Q = { "<cmd>Bdelete<cr>", "Close buffer (close split)" },
	-- 		x = { "<cmd>BufferLinePickClose<cr>", "Pick to close" },
	-- 	},
	-- 	f = {
	-- 		name = "+Telescope",
	-- 		f = { "<cmd>Telescope find_files<cr>", "Find File" },
	-- 		t = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
	-- 		p = { "<cmd>Telescope projects<cr>", "Projects" },
	-- 		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	-- 		r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
	-- 		-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
	-- 		-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
	-- 		-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
	-- 		-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
	-- 		-- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
	-- 	},
	-- 	g = {
	-- 		name = "+Git",
	-- 		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>" },
	-- 	},
	-- 	l = {
	-- 		name = "+LSP",
	-- 		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
	-- 		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
	-- 		f = { "<cmd>lua vim.lsp.buf.format{async = true}<cr>", "Format" },
	-- 		i = { "<cmd>LspInfo<cr>" },
	-- 		I = { "<cmd>Mason<cr>" },
	-- 		j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next diagnostic" },
	-- 		k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous diagnostic" },
	-- 		l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line diagnostic" },
	-- 		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	-- 		R = { "<cmd>lua require('telescope.builtin').lsp_references<cr>", "References" },
	-- 		s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
	-- 		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
	-- 	},
	-- 	t = {
	-- 		name = "+Terminal",
	-- 		t = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
	-- 		g = { "<cmd>lua lazygit_toggle()<cr>", "Open lazygit" },
	-- 	},
	-- }, { prefix = "<leader>" })

	-- visual or selection mode
	-- wk.register({
	-- 	["/"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", "Toggle Comment" },
	-- }, { prefix = "<leader>", mode = "x" })
  wk.add({
    { "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc = "Toggle Comment", mode = "x" },
  })
end

return M
