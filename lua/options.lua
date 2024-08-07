vim.opt.compatible = false
-- creates a backup file
vim.opt.backup = true
-- enable persistent undo
vim.opt.undofile = true
-- clutter these directories insteadfalse
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo//"
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backup//"
vim.opt.directory = os.getenv("HOME") .. "/.vim/swp//"
-- promt to reload buffor when external change is detected
vim.opt.autoread = true
-- more space in the neovim command line for displaying messages
vim.opt.cmdheight = 1
-- mostly just for cmp
vim.opt.completeopt = { "menuone", "noselect" }
-- make tab completion in command line better
vim.opt.wildmode = "longest:list,full:list"
-- so that `` is visible in markdown files
vim.opt.conceallevel = 0
-- highlight all matches on previous search pattern
vim.opt.hlsearch = true
-- ignore case in search patterns
vim.opt.ignorecase = true
-- but be case sensitive if capitals are used
vim.opt.smartcase = true
-- allow the mouse to be used in neovim
vim.opt.mouse = "a"
-- pop up menu height
vim.opt.pumheight = 10
-- we don't need to see things like -- INSERT -- anymore
vim.opt.showmode = false
-- always show tabs
vim.opt.showtabline = 0
-- make indenting smarter again
vim.opt.smartindent = true
-- force all horizontal splits to go below current window
vim.opt.splitbelow = true
-- force all vertical splits to go to the right of current window
vim.opt.splitright = true
-- creates a swapfile
vim.opt.swapfile = false
-- set term gui colors (most terminals support this)
vim.opt.termguicolors = true
-- use a timeout for mappings
vim.opt.timeout = true
-- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 300
-- faster completion (4000ms default)
vim.opt.updatetime = 300
-- convert tabs to spaces
vim.opt.expandtab = true
-- the number of spaces inserted for each indentation
vim.opt.shiftwidth = 2
-- insert 2 spaces for a tab
vim.opt.tabstop = 2
-- highlight the current line
vim.opt.cursorline = true
-- show relative line numbers
vim.opt.relativenumber = true
-- but show the absolute line number for the current line
vim.opt.number = true
-- only the last window will always have a status line
vim.opt.laststatus = 3
-- hide (partial) command in the last line of the screen (for performance)
vim.opt.showcmd = false
-- hide the line and column number of the cursor position
vim.opt.ruler = false
-- minimal number of columns to use for the line number {default 4}
vim.opt.numberwidth = 4
-- always show the sign column, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"
-- turn on line wrapping
vim.opt.wrap = true
-- wrap indicator
vim.opt.showbreak = "↳ "
vim.opt.linebreak = true
vim.opt.breakindent = true
-- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8
-- treats words with `-` as single words
vim.opt.iskeyword:append "-"
-- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.formatoptions:remove { "t" }
-- Thicker split borders
vim.opt.fillchars:append('horiz:━')
vim.opt.fillchars:append('horizup:┻')
vim.opt.fillchars:append('horizdown:┳')
vim.opt.fillchars:append('vert:┃')
vim.opt.fillchars:append('vertleft :┫')
vim.opt.fillchars:append('vertright:┣')
vim.opt.fillchars:append('verthoriz:╋')
