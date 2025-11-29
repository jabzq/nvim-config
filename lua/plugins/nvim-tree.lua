return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', 
    },
    
    config = function()
        local nvimtree = require("nvim-tree")

        nvimtree.setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
                preserve_window_proportions = true,
            },
            renderer = {
                root_folder_label = ":t",
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
                custom = {
                    "node_modules",
                    "vendor",
                    "build",
                },
            },
            actions = {
                open_file = {
                    quit_on_open = false, 
                },

            },
            git = {
                enable = true,
            },
        })
    end,
}
