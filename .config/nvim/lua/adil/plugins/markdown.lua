return {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
        -- You will not need this if you installed the
        -- parsers manually
        -- Or if the parsers are in your $RUNTIMEPATH
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("markview").setup {
            highlight_group = {
                {
                    group_name = "Heading1",
                    value = { fg = "#1e1e2e", bg = "#a6e3a1" }
                },
                {
                    group_name = "Heading1Corner",
                    value = { fg = "#a6e3a1" }
                },
            },
            headings = {
                enable = true,
                shift_width = 0,

                heading_1 = {
                    style = "label",

                    padding_left = " ",
                    padding_right = " ",

                    corner_right = "",
                    corner_right_hl = "Heading1",

                    corner_left = "",
                    corner_left_hl = "Heading1",


                    hl = "MarkviewHeading1"
                },
                heading_2 = {
                    style = "label",

                    padding_left = " ",
                    padding_right = " ",

                    corner_right = "",
                    corner_right_hl = "Heading2",

                    corner_left = "",
                    corner_left_hl = "Heading2",


                    hl = "MarkviewHeading2"
                },
                heading_3 = {
                    style = "label",

                    padding_left = " ",
                    padding_right = " ",

                    corner_right = "",
                    corner_right_hl = "Heading3",

                    corner_left = "",
                    corner_left_hl = "Heading3",


                    hl = "MarkviewHeading3"
                },
                heading_4 = {
                    style = "label",

                    padding_left = " ",
                    padding_right = " ",

                    corner_right = "",
                    corner_right_hl = "Heading4",

                    corner_left = "",
                    corner_left_hl = "Heading4",


                    hl = "MarkviewHeading4"
                },
                heading_5 = {
                    style = "label",

                    padding_left = " ",
                    padding_right = " ",

                    corner_right = "",
                    corner_right_hl = "Heading5",

                    corner_left = "",
                    corner_left_hl = "Heading5",


                    hl = "MarkviewHeading5"
                },
                heading_6 = {
                    style = "label",

                    padding_left = " ",
                    padding_right = " ",

                    corner_right = "",
                    corner_right_hl = "Heading6",

                    corner_left = "",
                    corner_left_hl = "Heading6",


                    hl = "MarkviewHeading6"
                },
            },
            code_blocks = {
                style = "minimal",
                icons = true,
                position = nil,
                min_width = 70,

                pad_amount = 3,
                pad_char = " ",

                language_direction = "left",
                language_names = {},

                hl = "CursorLine",
                sign = true,
                sign_hl = nil
            },
            inline_codes = {
                enable = true,
                hl = "DiagnosticOk",

                corner_left = nil,
                corner_left_hl = nil,

                padding_left = " ",
                padding_left_hl = nil,

                padding_right = " ",
                padding_right_hl = nil,

                corner_right = nil,
                corner_right_hl = nil
            },
            latex = {
                enable = true,

                brackets = {
                    enable = true,
                    opening = {
                        { "(", "MarkviewHeading1Sign" },
                        { "{", "MarkviewHeading2Sign" },
                        { "[", "MarkviewHeading3Sign" },
                    },
                    closing = {
                        { ")", "MarkviewHeading1Sign" },
                        { "}", "MarkviewHeading2Sign" },
                        { "]", "MarkviewHeading3" },
                    },

                    -- scope = {
                        --  "DiagnosticVirtualTextError",
                        --  "DiagnosticVirtualTextOk",
                        --  "DiagnosticVirtualTextWarn",
                        -- }
                    },

                    -- Hides $$ inside lines
                    inline = {
                        enable = true
                    },

                    -- Highlights lines within $$ $$
                    block = {
                        hl = "DiagnosticOk",
                        text = { " Latex ", "Special" }
                    },

                    -- Symbols, e.g. \geq
                    symbols = {
                        enable = true,
                        -- Your own set of symbols, e.g.
                        -- {
                            --   name = "symbol"
                            -- }
                            overwrite = {}
                        },

                        subscript = {
                            enable = true
                        },
                        superscript = {
                            enable = true
                        },
                    }
                }
            end
        }
