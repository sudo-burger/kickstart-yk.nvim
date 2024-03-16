return {
  {
    'lervag/wiki.vim',
    init = function()
      vim.g.wiki_root = '~/devs/vimwiki'
      vim.g.wiki_completion_case_sensitive = 0
    end,
  },
}
