local wk = require('which-key')

wk.setup({
    window = {
        border = "single",
    },
    layout = {
        align = "center",
    }
})

wk.register(
    {
        f = {
            name = "Files",
            f = { ':lua require(\'telescope.builtin\').find_files(require(\'telescope.themes\').get_ivy({hidden = true}))<CR>', 'Find Files' },
            g = { ':lua require(\'telescope.builtin\').live_grep(require(\'telescope.themes\').get_ivy({hidden = true}))<CR>', 'Grep' },
            s = { ':lua require(\'telescope.builtin\').grep_string(require(\'telescope.themes\').get_ivy({hidden = true}))<CR>', 'Grep String' },
            h = { ':lua require(\'telescope.builtin\').resume(require(\'telescope.themes\').get_ivy({hidden = true}))<CR>', 'Last Search (includes git)' },
            m = { '<cmd>lua vim.lsp.buf.format()<CR>', 'Format File' },
            t = { ':TodoTelescope<CR>', 'To dos' },
            p = { ':lua require(\'telescope\').extensions.project.project{}<CR>', 'Find Projects' },
        },
        g = {
            name = "Git",
            b = { ':lua require(\'telescope.builtin\').git_branches()<CR>', 'Git Branches' },
            c = { ':lua require(\'telescope.builtin\').git_commits()<CR>', 'Git Commits' },
            s = { ':lua require(\'telescope.builtin\').git_stash()<CR>', 'Git Stashes' },
            d = { ':Gvdiffsplit<CR>', 'Git File Diff' },
            m = { ':Gvdiffsplit!<CR>', 'Merge conflicts' },
            o = { ':GitBlameOpenCommitURL<CR>', 'Open commit in browser' },
            l = { ':LazyGit<CR>', 'Lazy Git' },
            p = { ':GHSearchPRs<CR>', 'Lazy Git' },
        },
        k = {
            name = "Keymaps",
            m = { ':lua require(\'telescope.builtin\').keymaps()<CR>', 'Keymaps' }
        },
        l = {
            name = "Lsp",
            d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Lsp: Go to definition' },
            i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Lsp: Go to implementatios' },
            r = { ':lua require(\'telescope.builtin\').lsp_references()<CR>', 'Lsp: Go to references' },
            h = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Lsp: Show information' },
            e = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Lsp: Open Error' },
            n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Lsp: Next Error' },
            p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Lsp: Previous Error' },
            c = { '``', 'Last change' },
        },
        r = {
            name = "Rename and resize",
            n = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
            l = { ':horizontal resize +10', 'Horizontal resize + 10' },
            h = { ':horizontal resize -10', 'Horizontal resize - 10' },
            k = { ':vertical resize +5', 'Vertical resize + 5' },
            j = { ':vertical resize -5', 'Vertical resize - 5' },
        },
        c = {
            name = "Code",
            a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Actions' },
            m = { '<Plug>CommentaryLine<CR>', 'Comment (line or selection)' }
        },
        t = {
            name = "Tree and Tags",
            t = { ':TagbarToggle<CR>', 'View file tags' },
            r = { ':NvimTreeToggle<CR>', 'View file tree' },
        },
        i = {
            name = "ChatGPT",
            v = { ':GpChatToggle vsplit<CR>', 'Toggle ChatGPT in vsplit' },
            h = { ':GpChatToggle split<CR>', 'Toggle ChatGPT in vsplit' },
            t = { ':GpChatToggle tabnew<CR>', 'Toggle ChatGPT in a new tab' },
        },
        s = {
            name = "Splits",
            v = { ':vsplit<CR>', 'Vertical Split' },
            h = { ':split<CR>', 'Horizontal Split' },
        },
        d = {
            name = "Database && Debug",
            b = { ':DBUIToggle<CR>', 'View databases' },
            s = { '<Plug>(DBUI_SaveQuery)', 'Save query to fil' },
            t = { ':lua require("dapui").toggle()<CR>', 'Open dap-ui' },
            p = { ':lua require("dap").toggle_breakpoint()<CR>', 'Toggle breakpoint' },
            c = { ':lua require("dap").continue()<CR>', 'Continue/Start session' },
            o = { ':lua require("dap").step_over()<CR>', 'Step over' },
            i = { ':lua require("dap").step_into()<CR>', 'Step into' },
            r = { ':lua require("dap").run_to_cursor()<CR>', 'Run to cursor' },
            x = { ':lua require("dap").close()<CR>', 'close' },
            e = { ':lua require("dapui").eval()<CR>', 'Evaluate expression' }
        },

    },
    {
        prefix = "<leader>",
        silent = true,
        mode = "n",
        noremap = true,
    }
)

wk.register ({
        -- movement through splits
        ['<leader><Right>'] = { '<C-W><Right>', 'Go To Right Split'},
        ['<leader><Up>'] = { '<C-W><Up>', 'Go To Upper Split'},
        ['<leader><Down>'] = { '<C-W><Down>', 'Go To Bottom Split'},
        ['<leader><Left>'] = { '<C-W><Left>', 'Go To Left Split'},

        -- buffers
        ['<C-z>'] = { ':undo<CR>', 'Undo'},
        ['<C-y>'] = { ':redo<CR>', 'Redo'},
        ['<C-s>'] = { ':w<CR>', 'Save Buffer'},
        ['<C-q>'] = { ':BD<CR>', 'Close Buffer'},
        ['<C-h>'] = { ':bprev<CR>', 'Go to previous buffer'},
        ['<C-l>'] = { ':bnext<CR>', 'Go to next buffer'},
})

wk.register(
    {
        ['<C-Enter>'] = { '<Plug>(DBUI_ExecuteQuery)', 'Execute selected query' },
        ['<leader>em'] = { ':lua require(\'refactoring\').select_refactor()<CR>', 'Refactor' }
    },
    {
        mode = "v",
    }
)

wk.register(
    {
        c = {
            name = "Comment",
            m = { '<Plug>Commentary<CR>', 'Comment (line or selection)' }
        },
    },
    {
        prefix = "<leader>",
        silent = true,
        mode = "x",
        noremap = true,
    }
)
