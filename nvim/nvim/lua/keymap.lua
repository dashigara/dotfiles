-- ====================
-- General
-- ====================
-- ESC連打でハイライト解除
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>")
-- バッファ切り替え
vim.keymap.set("n", "<C-p>", ":bnext<CR>")
vim.keymap.set("n", "<C-S-p>", ":bprevious<CR>")
-- バッファ閉じる
vim.keymap.set("n", "<C-S-w>", ":bdelete<CR>", {
    remap = true,
})
-- 上下移動基準を画面表示に
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
-- 検索のデフォルトを正規表現に
vim.keymap.set("n", "/", "/\\v")

-- 貼り付けのデフォルト位置を交換
vim.keymap.set("n", "p", "<S-p>")
vim.keymap.set("n", "<S-p>", "p")

-- <leader>キー
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ====================
-- Plugin
-- ====================
-- Neotree開閉
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
-- git status表示
vim.keymap.set("n", "<leader>g", ":Neotree float git_status<CR>")

-- -- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
