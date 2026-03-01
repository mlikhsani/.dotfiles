return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            -- All the command must available on path
            lua = { "stylua" },
            sh = { "shfmt" },
            bash = { "shfmt" },
            markdown = { "markdownfmt" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
