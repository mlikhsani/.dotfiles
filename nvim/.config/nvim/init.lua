require("config.remap")
require("config.set")
require("config.lazy")

-- enable LSP based on file name on ./lsp/
vim.lsp.enable({
    "clangd",
    "lua_ls",
    "python",
    -- "ts_ls",
    -- "svelte",
})
