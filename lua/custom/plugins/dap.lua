return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    'nvim-telescope/telescope-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local d = require 'dap'
    local u = require 'dapui'
    u.setup()
    local function close_debugger()
      u.close()
      d.terminate()
    end
    -- Show variable values inline, as "virtual text".
    require('nvim-dap-virtual-text').setup {}

    require('which-key').register {
      ['<leader>cd'] = { name = '[d]ebugger', _ = 'which_key_ignore' },
    }
    vim.keymap.set('n', '<leader>cdO', u.open, { desc = '[o]pen' })
    vim.keymap.set('n', '<leader>cdC', close_debugger, { desc = '[c]lose' })
    vim.keymap.set('n', '<leader>cdb', require('dap').toggle_breakpoint, { desc = '[b]reakpoint' })
    vim.keymap.set('n', '<leader>cdc', require('dap').continue, { desc = '[c]ontinue' })
    vim.keymap.set('n', '<leader>cds', require('dap').step_into, { desc = '[s]tep into' })
    vim.keymap.set('n', '<leader>cdS', require('dap').step_out, { desc = '[S]tep out' })

    -- Language-specific.
    require('dap-python').setup()
  end,
}
