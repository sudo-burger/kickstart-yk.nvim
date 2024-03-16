return {
  'lervag/lists.vim',
  init = function()
    vim.g.lists_filetypes = { 'md' }
    vim.g.lists_todos = { 'TODO', 'WIP', 'DONE', 'REJECTED' }
  end,
}
