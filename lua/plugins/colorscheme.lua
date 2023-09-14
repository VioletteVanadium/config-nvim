return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }

    -- setup must be called before loading
    vim.cmd.colorscheme 'catppuccin'
  end,
}
-- return {
--   'gbprod/nord.nvim',
--   lazy = false,
--   config = function()
--     require "nord".setup {
--       errors = { mode = 'fg' },
--     }
--     vim.cmd [[colorscheme nord ]]
--     vim.cmd [[ highlight WinSeparator gui=bold guifg=#4C566A ]]
--   end,
-- }
-- return {
--   'EdenEast/nightfox.nvim',
--   config = function()
--     require('nightfox').setup({
--       options = {
--         dim_inactive = true,
--         styles = {
--           comments = "italic",
--           keywords = "bold",
--           types = "italic,bold",
--         },
--         inverse = {
--           match_paren = false,
--           visual = false,
--           search = false,
--         },
--       },
--     })
--     -- vim.cmd [[ colorscheme terafox ]]
--     vim.cmd [[ colorscheme nordfox ]]
--   end
-- }
