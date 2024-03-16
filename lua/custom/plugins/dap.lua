return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    'nvim-telescope/telescope-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'
    dapui.setup()
    --
    -- Show variable values inline, as "virtual text".
    require('nvim-dap-virtual-text').setup {}

    -- Help functions.
    -- Open/close cleanly.
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end
    require('which-key').register {
      ['<leader>cd'] = { name = '[d]ebugger', _ = 'which_key_ignore' },
    }
    vim.keymap.set('n', '<leader>cdO', dap.continue, { desc = '[O]pen' })
    vim.keymap.set('n', '<leader>cdC', dap.terminate, { desc = '[C]lose' })
    vim.keymap.set('n', '<leader>cdb', dap.toggle_breakpoint, { desc = '[b]reakpoint' })
    vim.keymap.set('n', '<leader>cdB', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = '[B]reakpoint (conditional)' })
    vim.keymap.set('n', '<leader>cdr', dap.repl.open, { desc = '[r]epl' })
    vim.keymap.set('n', '<leader>cds', dap.step_into, { desc = '[s]tep into' })
    vim.keymap.set('n', '<leader>cdS', dap.step_over, { desc = '[S]tep over' })
  end,
}
