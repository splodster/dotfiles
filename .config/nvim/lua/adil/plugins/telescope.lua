return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'joshmedeski/telescope-smart-goto.nvim', 'nvim-telescope/telescope-file-browser.nvim', },
    config = function()
        local builtin = require('telescope.builtin')
        local utils = require("telescope.utils")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set("n", "<space>fw", ":Telescope file_browser prompt_title=wiki prompt_prefix=search>  path=~/wiki<CR>")
        require('telescope').setup{
            extensions = {
                file_browser = {
                    theme = "dropdown",
                    hidden = 'true',
                },
            },
            defaults = {
                layout_strategy = 'vertical',
            },
            pickers = {
                find_files = {
                    themes = 'dropdown',
                    hidden = 'true',
                },

            },
            require("telescope").load_extension "file_browser"
        }
    end
}
