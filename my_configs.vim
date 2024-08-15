" vim-plug configuration
call plug#begin('~/.vim_runtime/my_plugins/')

" 插件列表
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/a.vim'
"Plug 'mileszs/ack.vim'
" 其他插件...
call plug#end()

" 加载 filetype 插件
filetype on
filetype plugin on
filetype indent on
set number
set fileencodings=utf-8
set guifont=Consolas:h14
"set list
set colorcolumn=80
set mouse=
:map <ScrollWheelUp> :echo "Scroll up disabled"<CR>
:map <ScrollWheelDown> :echo "Scroll down disabled"<CR>
"set listchars=space:.,tab:>-

"coc配置
" 跳转到定义
nnoremap <silent> gd <Plug>(coc-definition)
" 跳转到声明
nnoremap <silent> gD <Plug>(coc-declaration)
" 跳转到类型定义
"nnoremap <silent> gt <Plug>(coc-type-definition)
" 跳转到引用
"nnoremap <silent> gr <Plug>(coc-references)

" 设置触发键为 Tab
let g:UltiSnipsExpandTrigger="<Tab>"
" 设置跳转到下一个字段的键
let g:UltiSnipsJumpForwardTrigger="<Tab>"
" 设置跳转到上一个字段的键
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"


" 全局设置
set expandtab       " 使用空格代替Tab
set shiftwidth=4    " 缩进时使用4个空格
set tabstop=4       " 一个Tab显示为4个空格
autocmd BufRead,BufNewFile *.cpp,*.h set filetype=cpp
" 为 C/C++ 文件设置 Tab 长度为 4
autocmd FileType c,cpp,h,java setlocal tabstop=2 shiftwidth=2 expandtab
" 为 Python 文件设置 Tab 长度为 4（Python 通常使用 4 个空格）
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
" 为 Makefile 文件设置 Tab 长度为 8 并保留 Tab 字符（Makefile 必须使用硬 Tab）
autocmd FileType make setlocal tabstop=8 shiftwidth=8 noexpandtab
" 为 YAML 文件设置 Tab 长度为 2（YAML 通常使用 2 个空格）
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab
" 为 JavaScript 文件设置 Tab 长度为 2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab


"LSP
" 使用 tab 键进行补全
"inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" 使用 Enter 键选择补全项并插入到编辑器中
"inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
" 选择建议时使用 Tab 键
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
" 确定建议项时使用 Enter 键
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"
" 切换头文件和源文件
imap jj <Esc>
imap kk <Esc>
" NERDTree配置
let mapleader=","
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
map <leader>z :A<cr>
"in visual mode
xnoremap <A-Up> :m '<-2<CR>gv=gv
"normal mode
nnoremap <A-Up> :m .-2<CR>==
xnoremap <A-Down> :m '>+1<CR>gv=gv
nnoremap <A-Down> :m .+1<CR>==
" 复制到系统剪贴板
noremap <leader>y "+y
noremap <leader>Y "+yy
vnoremap <leader>y "+y

" 粘贴系统剪贴板内容
noremap <leader>p "+p
noremap <leader>P "+P

"map <A-Up> :m-2<CR>
"map <A-Down> :m+1<CR>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
""打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 在切换缓冲区时自动保存
autocmd BufLeave,FocusLost * silent! wa
" 在插入模式退出时自动保存
autocmd InsertLeave * silent! write

" 使用 // 注释风格
let g:NERDCommenterCommentString = '// %s'

" 对 C 和 C++ 文件使用 // 注释
autocmd FileType c,cpp setlocal commentstring=//\ %s
nnoremap <expr> l col('.') == col('$') - 1 ? '' : 'l'
nnoremap <expr> h col('.') == 1 ? '' : 'h'
let g:coc_preferences = {'triggerCompletionWait': 500}
