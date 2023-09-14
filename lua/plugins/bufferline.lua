local M = {
  'akinsho/bufferline.nvim',
  event = { 'BufReadPre', 'BufAdd', 'BufNew', 'BufReadPost' },
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
      'famiu/bufdelete.nvim',
      'gbprod/nord.nvim',
    },
  },
}
function M.config()
  require('bufferline').setup {
    options = {
      themeable = true,
      close_command = 'Bdelete %d', -- can be a string | function, see "Mouse actions"
      right_mouse_command = 'vertical sbuffer %d',
      middle_mouse_command = 'horizontal sbuffer %d',
      -- indicator = { style = 'underline' },
      diagnostics = 'nvim_lsp',
      offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
      get_element_icon = function(element)
        -- element consists of {filetype: string, path: string, extension: string, directory: string}
        -- This can be used to change how bufferline fetches the icon
        -- for an element e.g. a buffer or a tab.
        -- e.g.
        local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        return icon, hl
      end,
      separator_style = 'slant',
    },
    -- highlights = require("nord.plugins.bufferline").akinsho(),
  }
end

return M
