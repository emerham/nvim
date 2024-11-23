-- fat curosr
vim.opt.guicursor = ""
-- No more mouse mode
vim.opt.mouse = ""
-- Numbers, yes
vim.opt.number = true
-- Relative numbers, even more yes
vim.opt.relativenumber = true
-- We want 4 indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.showbreak = '⮡'
vim.opt.listchars = {
    leadmultispace='····|···¦···┆···┊',
    tab='→—',
    --eol='¬'
}
-- Wrap lines?
vim.opt.wrap = false
-- Don't keep showing the search after search
vim.opt.hlsearch = false
-- Show match while searching
vim.opt.incsearch = true
-- Good colors
vim.opt.termguicolors = true
-- Give me that column
vim.opt.colorcolumn = '80'
-- Don't scroll all to the top when scrolling
vim.opt.scrolloff = 8
-- Always keep that sign column gutter
vim.opt.signcolumn = "yes"
-- Fast updates
vim.opt.updatetime = 50
-- No more swap files, instead keep a permanent history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
