return {
    "sainnhe/gruvbox-material",
    priority = 1000,
    opts = {},
    config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_foreground = 'hard'
        vim.g.gruvbox_material_better_performance = true
        vim.g.gruvbox_material_transparent_background = 2
        vim.g.gruvbox_material_float_style = 'dim'
        vim.cmd("colorscheme gruvbox-material")
    end
}
