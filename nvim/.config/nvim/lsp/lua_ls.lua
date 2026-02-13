return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".stylua.toml", ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
        },
    },
}
