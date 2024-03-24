-- Suppress cursor line highlightning (set by kickstart).
vim.opt.cursorline = false
vim.go.filetype = 1
vim.g.markdown_folding = 1
return {
  {
    -- Additional keymaps for nvim-cmp.
    --
    require('which-key').register {
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    },
  },
}
