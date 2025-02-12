" ============================================================================
" 基本设置
" ============================================================================

" ============================================================================
" 插件管理（以 Vim-Plug 为例）
" ============================================================================
" 请先确保已安装 Vim-Plug（参考：https://github.com/junegunn/vim-plug）
" 以下是一个简单的插件示例

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'nemausa/friendly-snippets'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'RRethy/vim-hexokinase'
Plug 'tpope/vim-commentary'
call plug#end()

" 禁用 Vi 兼容模式，启用 Vim 的增强功能
set nocompatible
set timeoutlen=1000
set ttimeoutlen=100
set updatetime=300
let g:airline_detect_modified = 0
let g:airline_detect_spell = 0
let g:airline_detect_paste = 0
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" 仅在特定文件类型下设置 UltiSnips 的 <CR> 映射
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/friendly-snippets']
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : (UltiSnips#CanExpandSnippet() ? UltiSnips#ExpandSnippet() : "\<CR>")
set hidden

" 设置 leader 键为空格
let mapleader = ","

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
nnoremap <silent> <leader>e :NERDTreeFocus<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width = 30
let g:tagbar_position = 'left'
let g:tagbar_autofocus = 1
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 Tab 和 Shift-Tab 在补全菜单中进行选择
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<Tab>"

inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <silent><expr> <Tab>
"       \ coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"

" inoremap <silent><expr> <S-Tab>
"       \ coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


""""""""""""""""""""""""""""""
" => A.vim
""""""""""""""""""""""""""""""
nnoremap <leader>z :A<CR>
nnoremap <A-o> :A<CR>
nnoremap <M-o> :A<CR>

""""""""""""""""""""""""""""""
" => ctrlspace.vim
""""""""""""""""""""""""""""""
map <leader>cs :CtrlSpace<cr>

""""""""""""""""""""""""""""""
" => fzf.vim
""""""""""""""""""""""""""""""
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :Lines<CR>
let $FZF_DEFAULT_OPTS = '--ignore-case'
let $FZF_DEFAULT_COMMAND = 'find . -type f ! -path "*/build/*" ! -path "*/.git/*"'

" 根据需要继续添加其他设置...
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OneDark 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax_on
filetype plugin indent on
colorscheme onedark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocmd 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autowriteall
autocmd BufEnter * if &filetype == 'nerdtree' | inoremap <buffer> <CR> <CR> | endif
autocmd FocusLost * silent! wa

