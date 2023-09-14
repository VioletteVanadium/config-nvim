-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<M-k>', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<M-j>', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true, desc = 'Focus window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true, desc = 'Focus window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true, desc = 'Focus window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true, desc = 'Focus window right' })
vim.keymap.set('n', '<C-q>', '<C-w>q', { silent = true, desc = 'Close window' })

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", {silent = true, desc = "Horizontal resize smaller"})
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true, desc = "Horizontal resize larger" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true, desc = "Vertical resize smaller" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true, desc = "Vertical resize larget" })

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrevious<CR>", { silent = true, desc = "Previous buffer" })
