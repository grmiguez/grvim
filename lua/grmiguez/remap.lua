-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
  local options = { noremap = true , silent = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- logs according to filetype

vim.cmd([[
    autocmd Filetype php inoremap <buffer><C-l> complex_error_log();<ESC>hi
    autocmd Filetype java inoremap <buffer><C-l> System.out.println();<ESC>hi
    autocmd Filetype vue inoremap <buffer><C-l> console.log()<ESC>hi
    autocmd Filetype ts inoremap <buffer><C-l> console.log();<ESC>hi
    autocmd Filetype js inoremap <buffer><C-l> console.log()<ESC>hi
]])

-- === LEADER ===
map('n', '<Space>', '')
map('v', '<Space>', '')

-- resize
map('n', '<leader>ll', ':horizontal resize +10')
map('n', '<leader>kk', ':horizontal resize -10')
map('n', '<leader>l', ':vertical resize +5')
map('n', '<leader>h', ':vertical resize -5')

-- delete without sending deleted content to clipboard
vim.cmd([[
    nnoremap <silent> D "_d
    xnoremap <silent> D "_d
    nnoremap <silent> DD "_dd
]])

-- duplicate line
map('n', '<C-d>', 'yyp')

-- cleaning and replacing in vim search 
map('n', '<leader>nn', ':noh<CR>')
vim.cmd([[
    vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
]])

