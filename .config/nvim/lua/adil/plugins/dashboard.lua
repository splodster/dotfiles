return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
        {'MaximilianLloyd/ascii.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons'}
    },
    config = function()
        require('dashboard').setup {
                theme = 'hyper',
                config = {
                    header = require('ascii').art.text.neovim.sharp;
                    shortcut = {
                        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = ' dotfiles',
                            group = 'Number',
                            action = 'e ~/dotfiles',
                            key = 'd',
                        },
                        {
                            desc = '  wiki',
                            group = 'Number',
                            action = 'e ~/wiki/index.md',
                            key = 'w',
                        },
                    },
                    mru = {cwd_only = true},
                    footer = {
                        '',
                        'unlocked modus operandi'},
                },
        }
    end,
}
