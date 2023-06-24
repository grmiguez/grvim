require('telescope').setup({
    pickers = {
        lsp_references = {
            show_line = false,
        },
    },
})

require('telescope').load_extension('gh')
