require("catppuccin").setup({
    flavour = "mocha",
    color_overrides = {
        mocha = {
            base = "#11111b",
            mantle = "#0b0b12",
            crust = "#0b0b12",
        },
    },
})

vim.cmd.colorscheme "catppuccin"
