return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>pf", "<cmd>FzfLua files<CR>", desc = "Find Files" },
        { "<C-p>", "<cmd>FzfLua git_files<CR>", desc = "Git Files" },
        {
            "<leader>/",
            "<cmd>FzfLua lgrep_curbuf<CR>",
            desc = "Grep Current Files",
        },
        {
            "<leader>g",
            "<cmd>FzfLua live_grep<CR>",
            desc = "Grep Files",
        },
    },
}
