require'nvim-treesitter.configs'.setup {
    ensure_installed = { "help", "javascript", "typescript", "rust", "go", "c", "lua", "vim", "vimdoc", "query" },

    sync_install = false,
    ignore_install = { "help" },
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
