local M = {
	"kyazdani42/nvim-tree.lua",
	event = "VimEnter",
}

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- add default mapping
	api.config.mappings.default_on_attach(bufnr)

	-- append custom mappings
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Trash"))
	vim.keymap.set("n", "D", api.fs.trash, opts("Delete"))
	vim.keymap.set("n", "u", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end

function M.config()
	require("nvim-tree").setup({
		on_attach = on_attach,
		hijack_cursor = true,
		disable_netrw = true,
		hijack_netrw = true,
		-- hijack_directories = {
		--   enable = true,
		--   auto_open = true,
		-- },
		sort = {
			folders_first = true,
		},
		view = {
			number = true,
			relativenumber = true,
			width = {
				min = 30,
				max = 60,
			},
			side = "left",
		},
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		git = {
			enable = false,
		},
		diagnostics = {
			enable = false,
			icons = {
				hint = "󰌵",
				info = "",
				warning = "",
				error = "",
			},
		},
		actions = {
			use_system_clipboard = true,
			open_file = {
				quit_on_open = true,
			},
		},
	})
end

-- Open For Directories And Change Neovim's Directory
local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- change to the directory
	-- vim.cmd.cd(data.file)

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
return M
