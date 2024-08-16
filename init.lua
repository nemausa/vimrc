-- 在你的 init.lua 文件中添加如下代码来安装 packer.nvim
local fn = vim.fn

-- 自动安装 packer.nvim
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd('packadd packer.nvim')
end

-- 在你的 init.lua 文件中添加如下代码来配置插件
require('packer').startup(function(use)
  -- Packer 可以管理自己
  use 'wbthomason/packer.nvim'
  -- coc.nvim 插件
  use {'neoclide/coc.nvim', branch = 'release'}
  -- vim-polyglot 插件
  use 'sheerun/vim-polyglot'
  -- vim-commentary 插件
  use 'tpope/vim-commentary'
  -- a.vim 插件
  use 'vim-scripts/a.vim'
  use 'ctrlpvim/ctrlp.vim'
  use 'mileszs/ack.vim'
  use 'preservim/nerdtree'
  use 'altercation/vim-colors-solarized'
end)

if vim.fn.has('nvim-0.8') == 1 then
    vim.g.do_filetype_lua = 1
    vim.g.did_load_filetypes = 0
end


-- 全局设置
vim.opt.expandtab = true      -- 使用空格代替Tab
vim.opt.shiftwidth = 4        -- 缩进时使用4个空格
vim.opt.tabstop = 4           -- 一个Tab显示为4个空格
vim.opt.number = true
vim.opt.fileencoding = 'utf-8'
vim.opt.guifont = 'Consolas:h14'
vim.opt.colorcolumn = '80'
vim.opt.mouse = ''            -- 关闭鼠标支持
-- vim.opt.list = true         -- 如果需要显示不可见字符，可以取消注释
-- vim.opt.listchars = {space = '.', tab = '>-'}

-- 键映射
vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', ':echo "Scroll up disabled"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', ':echo "Scroll down disabled"<CR>', { noremap = true, silent = true })

-- coc.nvim 配置
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', '<Plug>(coc-declaration)', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'gt', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })

-- UltiSnips 配置
vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'

-- 自动命令配置
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "cpp"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end
})

-- LSP 配置
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "<CR>"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', { expr = true, noremap = true, silent = true })

-- NERDTree 配置
vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<leader>nn', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nb', ':NERDTreeFromBookmark<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nf', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>z', ':A<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':copen<CR>', { noremap = true, silent = true })
-- Visual mode: move selected lines up
vim.api.nvim_set_keymap('x', '<A-Up>', ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Normal mode: move the current line up
vim.api.nvim_set_keymap('n', '<A-Up>', ":move .-2<CR>==", { noremap = true, silent = true })
-- Visual mode: move selected lines down
vim.api.nvim_set_keymap('x', '<A-Down>', ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Normal mode: move the current line down
vim.api.nvim_set_keymap('n', '<A-Down>', ":move .+1<CR>==", { noremap = true, silent = true })


-- NERDTree 其他设置
vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = '-'
vim.g.NERDTreeWinPos = 'left'
vim.g.NERDTreeSize = 30
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeHidden = 0

-- 自动打开 NERDTree
vim.cmd([[
  autocmd vimenter * if !argc() | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]])

-- 缓冲区自动保存
vim.cmd([[
  autocmd BufLeave,FocusLost * silent! wa
  autocmd InsertLeave * silent! write
]])

-- 使用 // 注释风格
vim.g.NERDCommenterCommentString = '// %s'

-- 对 C 和 C++ 文件使用 // 注释
vim.cmd('autocmd FileType c,cpp setlocal commentstring=//\\ %s')

-- 切换标签页
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<leader>' .. i, ':tabn ' .. i .. '<CR>', { noremap = true, silent = true })
end

-- 复制到系统剪贴板
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- 粘贴系统剪贴板内容
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true, silent = true })

-- 绑定 Ctrl+F 键进行文件搜索
vim.api.nvim_set_keymap('n', '<C-F>', ':CtrlP<CR>', { noremap = true, silent = true })
vim.cmd('colorscheme solarized')
