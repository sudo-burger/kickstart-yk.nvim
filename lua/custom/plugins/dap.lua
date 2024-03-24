return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',
    --
    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    'nvim-telescope/telescope-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',

    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      -- handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      -- Update this to ensure that you have the debuggers for the langs you want
      -- ensure_installed = {},
    }

    dapui.setup()
    --
    -- Show variable values inline, as "virtual text".
    require('nvim-dap-virtual-text').setup {}

    -- Help functions.
    -- Open/close cleanly.
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

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
    --
    require('dap-python').setup()
  end,
}
