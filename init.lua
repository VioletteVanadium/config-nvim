--[[
lua help:
  - https://learnxinyminutes.com/docs/lua/
  - `:help lua-guide`
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua
-- (recommended when using nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
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
	-- tpope is the man
	"tpope/vim-surround",
	"tpope/vim-repeat",
	-- Detect tabstop and shiftwidth automatically
	-- 'tpope/vim-sleuth',

	-- remember cursor position
	"farmergreg/vim-lastplace",

  -- better python folding
  {
    'tmhedberg/SimpylFold',
    ft = 'python',
    dependencies = {
      'Konfekt/FastFold',
    },
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help indent_blankline.txt`
    main = "ibl",
    opts = {
      indent = {
        char = '┊',
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- godot external editor helper plugin
	{ "habamax/vim-godot", ft = "gdscript" },

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    Add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
	{ import = "plugins" },
}, {})

require("options")
require("keymaps")
require("autocommands")
