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
Plug 'sheerun/vim-polyglot'
call plug#end()

" 禁用 Vi 兼容模式，启用 Vim 的增强功能
set nocompatible
set timeoutlen=1000
set ttimeoutlen=100
set updatetime=300
set autoread
autocmd FocusGained,BufEnter * checktime
let g:airline_detect_modified = 0
let g:airline_detect_spell = 0
let g:airline_detect_paste = 0
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OneDark 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax_on
filetype plugin indent on
" ============================================================================
" 加载 onedark 主题
" ============================================================================
" 如有需要，可以在这里设置 onedark 插件的选项，例如：
" let g:onedark_style = 'dark'      " 可选 'dark' 或 'light'（默认：dark）
" let g:onedark_transparent = 0     " 是否使用透明背景（0 为不透明，1 为透明）

colorscheme onedark

" ============================================================================
" 自定义覆盖设置（确保在主题加载后执行）
" ============================================================================
" 利用 ColorScheme 自动命令，在加载 onedark 主题后覆盖特定高亮组
" autocmd ColorScheme onedark call s:CustomOnedarkHighlights()

" function! s:CustomOnedarkHighlights() abort
"   " 设置基本颜色（可根据自己的需求微调）
"   highlight Normal       guifg=#abb2bf guibg=#282c34
"   highlight Comment      guifg=#5c6370 guibg=NONE
"   highlight String       guifg=#98c379 guibg=NONE
"   highlight Number       guifg=#d19a66 guibg=NONE

"   " 设置函数和关键字等颜色
"   highlight Function     guifg=#61afef guibg=NONE
"   highlight Keyword      guifg=#c678dd guibg=NONE
"   highlight Type         guifg=#e5c07b guibg=NONE

"   " 标识符和运算符（保持前景色）
"   highlight Identifier   guifg=#abb2bf guibg=NONE
"   highlight Operator     guifg=#abb2bf guibg=NONE

"   " 预处理指令（如 C/C++ 中的 #include 等）
"   highlight PreProc      guifg=#e5c07b guibg=NONE

"   " 类、枚举及相关变体
"   highlight Class        guifg=#e5c07b guibg=NONE
"   highlight CClass       guifg=#e5c07b guibg=NONE
"   highlight CPPClass     guifg=#e5c07b guibg=NONE
"   highlight CppClass     guifg=#e5c07b guibg=NONE
"   highlight Enum         guifg=#e5c07b guibg=NONE

"   " 如果 C 文件中函数相关区域显示为 cPreConditMatch，
"   " 则将其链接到 Function 组（或直接设置颜色）
"   hi! link cPreConditMatch Function
" endfunction

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
let NERDTreeShowHidden=1
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
" 1. 使用 pumvisible() 检查补全菜单的可见性（第一组映射）
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? coc#_select_confirm() : "\<CR>"

" 2. 使用 coc#pum#visible() 检查 coc 补全菜单的可见性（第二组映射）
inoremap <expr> <Tab>   coc#pum#visible() ? coc#pum#next(1)   : "\<Tab>"
inoremap <expr> <CR>    coc#pum#visible() ? coc#pum#confirm()   : "\<CR>"

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
" => autocmd 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autowriteall
autocmd BufEnter * if &filetype == 'nerdtree' | inoremap <buffer> <CR> <CR> | endif
autocmd FocusLost * silent! wa
function! ToggleTabSize()
    if &tabstop == 4
        " 当前为 4 个空格，切换到 2 个空格
        setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
        echo "Tab size set to 2"
    else
        " 切换回 4 个空格
        setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
        echo "Tab size set to 4"
    endif
endfunction

" 映射 leader+st 键来切换 tab 宽度
nnoremap <leader>st :call ToggleTabSize()<CR>
nnoremap <leader>cf :w<CR>:call system("clang-format -i " . shellescape(expand('%:p')))<CR>:edit!<CR>:redraw!<CR>

" Ctags
let g:gutentags_ctags_exclude = ['.git', 'node_modules', 'build']
function! BuildCtags()
    let cwd = getcwd()
    let cmd = "ctags -R --exclude=output --exclude=linux-5.10 --languages=C,C++ --fields=+l+K --extra=+q --c-kinds=+p+f+g+u+s+e+m+t+v " . cwd
    let result = system(cmd)
    echo result
endfunction
" 在普通模式下，按 <leader>ct 执行 :Ctags 命令
nnoremap <leader>ct :call BuildCtags()<CR>
