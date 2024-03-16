return {
  {
    -- Additional keymaps for nvim-cmp.
    --
    require('which-key').register {
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    },
  },
}
