return {
  {
    'lervag/wiki.vim',
    -- Enable completion for wiki pages.
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-omni',
    },
    init = function()
      vim.g.wiki_root = '~/devs/vimwiki'
      vim.g.wiki_completion_case_sensitive = 0
      local cmp = require 'cmp'
      cmp.setup.filetype('markdown', {
        sources = cmp.config.sources {
          { name = 'omni' },
        },
      })
    end,
  },
}
