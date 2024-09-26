return {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
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
            headings = {
                enable = true,
                shift_width = 1,

                heading_1 = {
                    style = "simple",
                    hl = "MarkviewHeading3"
                },
                heading_2 = {
                    style = "simple",
                    hl = "MarkviewHeading3"
                },
                heading_3 = {
                    style = "simple",
                    hl = "MarkviewHeading3"
                },
                heading_4 = {
                    style = "simple",
                    hl = "MarkviewHeading3"
                },
                heading_5 = {
                    style = "simple",
                    hl = "MarkviewHeading3"
                },
                heading_6 = {
                    style = "simple",
                    hl = "MarkviewHeading3"
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

                hl = "cursorline",
                sign = true,
                sign_hl = nil
            },
            inline_codes = {
                enable = true,
                hl = "MarkviewInlineCode",
            },
            links = {
                enable = true,
                hyperlinks = {
                    hl = "DiagnosticOk",
                },
                images = {
                    hl = "DiagnosticOk",
                },
                emails = {}
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
                        { "]", "MarkviewHeading3Sign" },
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
