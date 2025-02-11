" ============================================================================
" 基本设置
" ============================================================================

" ============================================================================
" 插件管理（以 Vim-Plug 为例）
" ============================================================================
" 请先确保已安装 Vim-Plug（参考：https://github.com/junegunn/vim-plug）
" 以下是一个简单的插件示例

call plug#begin('~/.vim/plugged')
" 示例插件：文件浏览器
Plug 'preservim/nerdtree'
" 示例插件：Git 状态显示
Plug 'airblade/vim-gitgutter'
" 示例插件：代码大纲导航
Plug 'majutsushi/tagbar'
" 示例插件：代码自动补全（你可以根据需求添加其他插件）
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'

call plug#end()

" 禁用 Vi 兼容模式，启用 Vim 的增强功能
set nocompatible

" 关闭文件类型检测，稍后手动开启
filetype off

" 设置 leader 键为空格
let mapleader = " "

" 使用空格代替 Tab，并设置缩进为 4 个空格
set expandtab
set shiftwidth=4
set tabstop=4

" 显示行号和相对行号
set number
set relativenumber

" 使用系统剪贴板
set clipboard=unnamedplus

" 开启真彩色支持（适用于终端支持真彩色的情况）
set termguicolors

" 搜索时忽略大小写，但遇到大写时启用智能匹配
set ignorecase
set smartcase

" 显示辅助对齐的颜色列（80 列）
set colorcolumn=80

" 延迟重绘以提升性能
set lazyredraw

" ============================================================================
" GUI 相关设置（如果使用 gvim 或支持 GUI 的 Vim）
" ============================================================================

if has("gui_running")
    set guifont=Consolas:h14
endif

" ============================================================================
" Python 3 支持
" ============================================================================

" 如果你的 Vim 支持 Python3，请确保设置了正确的 Python 3 解释器路径
if has("python3")
    " 注意：请将下面的路径替换为你本机 Python3 的实际路径
    let g:python3_host_prog = '/usr/bin/python3'
endif

" ============================================================================
" 文件类型、插件和缩进
" ============================================================================

" 开启文件类型检测、插件和缩进支持
filetype plugin indent on


" ============================================================================
" 插件及其他扩展设置
" ============================================================================

" 设置构建项目的命令（如使用 CMake 构建项目）
set makeprg=cmake\ --build\ build

" ============================================================================
" 快捷键映射
" ============================================================================

" 1. 复制整个文件到系统剪贴板（普通模式下 <leader>ca）
nnoremap <leader>ca gg"+yG

" 2. 移动选中文本块（可视模式）向上/向下移动一行，并自动缩进
xnoremap <A-Up>    :move '<-2<CR>gv=gv
xnoremap <A-Down>  :move '>+1<CR>gv=gv

" 3. 移动当前行（普通模式）向上/向下移动一行，并自动缩进
nnoremap <A-Up>    :move .-2<CR>== 
nnoremap <A-Down>  :move .+1<CR>==
inoremap jj <Esc>
inoremap kk <Esc>

nnoremap <leader>w <C-w>w
nnoremap gd <C-]>


" ============================================================================
" 其他个性化设置
" ============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width = 30
let g:tagbar_position = 'left'
let g:tagbar_autofocus = 1
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MarkdownPreview 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>mp : MarkdownPreview<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OneDark 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme onedark

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

""""""""""""""""""""""""""""""
" => A.vim
""""""""""""""""""""""""""""""
nnoremap <leader>z :A<CR>
nnoremap <A-o> :A<CR>
nnoremap <M-o> :A<CR>


" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


" 根据需要继续添加其他设置...
let g:airline#extensions#tabline#enabled = 1
