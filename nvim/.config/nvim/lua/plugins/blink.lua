return {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    version = "1.*",
    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = { documentation = { auto_show = true } },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "lua" },
    },
    opts_extend = { "sources.default" },
}
