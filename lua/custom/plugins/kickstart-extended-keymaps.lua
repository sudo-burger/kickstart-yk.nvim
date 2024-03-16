return {
  {
    -- Additional keymaps for nvim-cmp.
    --
    require('which-key').register {
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    },
    require('cmp').setup {
      mapping = require('cmp').mapping.preset.insert {
        ['<C-b>'] = require('cmp').mapping.scroll_docs(-1),
        ['<C-f>'] = require('cmp').mapping.scroll_docs(1),
      },
    },
  },
}
