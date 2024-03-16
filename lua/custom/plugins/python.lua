vim.g.python3_host_prog = '~/devs/python/venv/nvim/bin/python'
return {
  'mfussenegger/nvim-dap-python',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  -- Language-specific.
  require('dap-python').setup(),
}
