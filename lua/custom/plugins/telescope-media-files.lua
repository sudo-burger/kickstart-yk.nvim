return {
  {
    'sudo-burger/telescope-media-files.nvim',
    -- filetypes whitelist
    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    -- filetypes = {"png", "webp", "jpg", "jpeg"},
    -- find command (defaults to `fd`),
    find_cmd = 'rg',
    init = function()
      pcall(require('telescope').load_extension, 'media_files')
      vim.keymap.set('n', '<leader>sm', function()
        require('telescope').extensions.media_files.media_files()
      end, { desc = '[S]earch [M]edia Files' })
    end,
  },
}
