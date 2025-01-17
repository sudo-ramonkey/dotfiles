return {
    "A7lavinraj/assistant.nvim",
    dependencies = { "stevearc/dressing.nvim" }, -- optional but recommended
    opts = { -- you can also pass opts as {}, cpp and python are supported by default
        commands = {
            ruby = {
                extension = "rb",
                compile = nil,
                execute = {
                    main = "ruby",
                    args = { "$FILENAME_WITH_EXTENSION" }
                },
            },
            cpp = {
                extension = "cpp",
                compile = {
                    main = "g++",
                    args = { "$FILENAME_WITH_EXTENSION", "-o", "$FILENAME_WITHOUT_EXTENSION" }
                },
                execute = {
                    main = "./$FILENAME_WITHOUT_EXTENSION",
                    args = nil
                },
            },
        },
        time_limit = 5000,
        border = false, -- border is OFF by default, you can can pass true to enable borders
        theme = "dynamic" -- "gruvbox", "catppuccin" and "tokyonight" are also available
    }
}
