local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
}

function M.config()
	local toggleterm = require("toggleterm")

	toggleterm.setup({
		size = 20,
		hide_numbers = true,
		direction = "float",
		float_opts = {
			border = "curved",
		},
		open_mapping = "<c-t>",
    persist_mode = false,
	})

	function _G.set_terminal_keymaps()
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	end

	function _G.lazygit_toggle()
		local t = require("toggleterm.terminal").Terminal
		t:new({
			cmd = "lazygit",
			hidden = true,
		}):toggle()
	end

	vim.cmd([[ autocmd! TermOpen term://* lua set_terminal_keymaps() ]])
end

return M
