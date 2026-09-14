-- TreeSitter
vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- folds
vim.wo.foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation

-- Tab
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
