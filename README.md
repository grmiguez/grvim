# grvim
My personal config for neovim

## Requeriments
 * Neovim >= 0.9.0
 * Npm and typescript

## Installation
 * Make sure that neovim, npm and typescript are installed
 * Clone the repo in .config/nvim :
```
$ git clone git@github.com:grmiguez/grvim.git ~/.config/nvim
```
* Move to the plugins config file in neovim and open it:
```
$ cd ~/.config/nvim/lua/grmiguez && nvim plugins.lua
```
* This should have installed packer (plugins manager), so now close and reopen the file. Then run `:PackerInstall` to install all plugins.

## Database connections
* To add database connections for dadbod, create the file dadbod.lua inside the setup folder
```
$ touch ~/.config/nvim/setup/dadbod.lua
```
* Then add the database connections inside dadbod.lua like:
```vimL
vim.cmd([[
let g:dbs = {
\ 'example': 'mysql://user:password@host:port/database_name',
\ }
let g:db_ui_table_helpers = {
\   'mysql': {
\     'List': 'select * from {table} order by id desc'
\   }
\ }
let g:db_ui_auto_execute_table_helpers = 1
let g:db_ui_use_nerd_fonts = 1
]])
```

## Install Language Servers
* To install language servers open neovim and use mason with `:Mason`, then search for the one you need and press i to install it.
