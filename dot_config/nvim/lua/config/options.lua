local g = vim.g
local opt = vim.opt

g.autoformat = true
g.lazyvim_eslint_auto_format = true
g.root_spec = { ".git", "lsp", "cwd" }
g.lazygit_config = false
opt.formatoptions = "jcroqlnt"
-- opt.textwidth = 140
opt.colorcolumn = "141"
opt.expandtab = true
opt.shiftwidth = 2
opt.swapfile = false
opt.conceallevel = 0
