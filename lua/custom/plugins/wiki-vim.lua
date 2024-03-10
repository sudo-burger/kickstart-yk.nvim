return {
  {
    'lervag/wiki.vim',
    dependencies = {
      {
        'lervag/lists.vim',
        init = function()
          vim.g.lists_todo = { 'TODO', 'WIP', 'DONE', 'REJECTED' }
        end,
      },
    },
    init = function()
      vim.g.wiki_root = '~/devs/vimwiki'
      vim.g.wiki_completion_case_sensitive = 0
    end,
  },
}
