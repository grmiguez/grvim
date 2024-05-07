require('telescope').setup({
    pickers = {
        lsp_references = {
            show_line = false,
        },
    },
    extensions = {
        project = {
            base_dirs = {
                '~/projects'
            }
        },
    },
})

require('telescope').load_extension('gh')
require('telescope').load_extension('project')
