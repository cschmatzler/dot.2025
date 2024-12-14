local g = vim.g
local opt = vim.opt

g.autoformat = true
g.root_spec = { ".git", "lsp", "cwd" }
opt.formatoptions = "jcroqlnt"
opt.textwidth = 140
opt.colorcolumn = "141"
opt.expandtab = true
opt.shiftwidth = 2
opt.swapfile = false
opt.conceallevel = 0
