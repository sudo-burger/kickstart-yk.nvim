return {
  {
    'nvim-telescope/telescope-bibtex.nvim',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
    init = function()
      require('telescope').setup {
        extensions = {
          bibtex = {
            -- Depth for the *.bib file
            depth = 1,
            -- Custom format for citation label
            custom_formats = {},
            -- Format to use for citation label.
            -- Try to match the filetype by default, or use 'plain'
            format = '',
            -- Path to global bibliographies (placed outside of the project)
            global_files = { '~/.local/share/bibliography.bib' },
            -- Define the search keys to use in the picker
            search_keys = { 'author', 'year', 'title' },
            -- Template for the formatted citation
            citation_format = '{{author}} ({{year}}), {{title}}.',
            -- Only use initials for the authors first name
            citation_trim_firstname = true,
            -- Max number of authors to write in the formatted citation
            -- following authors will be replaced by "et al."
            citation_max_auth = 2,
            -- Context awareness disabled by default
            context = true,
            -- Fallback to global/directory .bib files if context not found
            -- This setting has no effect if context = false
            context_fallback = true,
            -- Wrapping in the preview window is disabled by default
            wrap = false,
            -- user defined mappings
            mappings = {
              i = {
                -- ["<CR>"] = bibtex_actions.key_append('%s'), -- format is determined by filetype if the user has not set it explictly
                -- ["<C-e>"] = bibtex_actions.entry_append,
                -- ["<C-c>"] = bibtex_actions.citation_append('{{author}} ({{year}}), {{title}}.'),
              },
            },
          },
        },
      }
      pcall(require('telescope').load_extension, 'bibtex')
      vim.keymap.set('n', '<leader>sc', function()
        require('telescope').extensions.bibtex.bibtex()
      end, { desc = '[S]earch [C]itations' })
    end,
  },
}
