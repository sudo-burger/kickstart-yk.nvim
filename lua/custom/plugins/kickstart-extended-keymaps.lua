return {
  {
    -- Additional keymaps for nvim-cmp.
    --
    require('cmp').setup {
      mapping = require('cmp').mapping.preset.insert {
        ['<C-b>'] = require('cmp').mapping.scroll_docs(-1),
        ['<C-f>'] = require('cmp').mapping.scroll_docs(1),
      },
    },
  },
}
