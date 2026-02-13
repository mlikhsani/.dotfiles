return {
    cmd = { "clangd19" }, -- based on this OS (freebsd)
    filetypes = { "c", "cpp", "cc" },
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac", -- AutoTools
        ".git",
    },
}
