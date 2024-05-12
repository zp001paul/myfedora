" 
" 普通vim配置
"
set encoding=utf-8
set nu
set ts=4
set softtabstop=4 " 表示在编辑模式的时候按退格键的时候退回缩进的长度，当使用 expandtab 时特别有用
set shiftwidth=4 " 每一级的缩进
set expandtab
syn on
set incsearch
set scrolloff=2
set sidescrolloff=2
set nowrapscan
" set sms " smoothly scroll
set relativenumber

let mapleader="\\"
set clipboard=unnamedplus

map + :resize +1<CR>
map _ :resize -1<CR>
map } <C-W>><CR>
map { <C-W><<CR>

map <leader>c "+y
map <leader>p "+p

set filetype=plugin
set nocompatible " 设置与vi 不兼容


nmap <Leader>] :bnext<CR>
nmap <Leader>[ :bprev<CR>
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h

set laststatus=2 " for lightline


"
" 高级vim配置，插件等
"


call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'terryma/vim-multiple-cursors'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ghifarit53/tokyonight-vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax' " key: y
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] } " key: f/F, dont work with cpp
Plug 'sgur/vim-textobj-parameter' " key: ,
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/echofunc' " show function tag in status bar
call plug#end()

map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" for taglist plugin
let Tlist_Use_Right_Window=1

" for debugging gutentags
" let g:gutentags_trace = 1 " if enable, it will print log in screen

" for Leaderf
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1
let g:Lf_CacheDirectory = expand('~')
set cscopetag " 使用cscope 作为tags命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
" let Gtags_VerticalWindow = 1 " open quick fix vertically
" let GtagsCscope_Auto_Load = 1 " using default key mapping
let Gtags_Close_When_Single = 1 " dont pop quick fix when only 1 result
" let CtagsCscope_Auto_Map = 1
" let GtagsCscope_Quiet = 1
"
" enable gtags module
" let g:gutentags_modules = ['gtags_cscope']
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" config project root markers.
let g:gutentags_project_root = ['.root']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/LeaderF/gtags')
" let g:gutentags_cache_dir = expand('~/.cache/tags')


map <C-\><C-]> :GtagsCursor<CR>
nmap <C-\>d :Gtags -d <C-R>=expand("<cword>")<CR>
nmap <C-\>r :Gtags -r <C-R>=expand("<cword>")<CR>
nmap <C-\>g :Gtags -g <C-R>=expand("<cword>")<CR>
nmap <C-\>f :Gtags -f <C-R>=expand("<cword>")<CR>


" set tags=./.tags;,.tags




" for vim-commentary
filetype plugin indent on

" shotcut for me
" nmap <F2> :cs f g <C-R>=expand("<cword>")<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>a :TlistToggle<CR>
nmap <Leader>e :NERDTreeFind<CR>
nmap <F7> :Leaderf file --popup
nmap <F8> :Leaderf rg --popup
nmap <leader>fn :Leaderf function<CR>
nmap <Leader>fg :Leaderf rg <C-R>=expand("<cword>")<CR>
nmap <Leader>fe :Leaderf rg -F <C-R>=expand("<cword>")<CR>
noremap <leader>gr :<C-U><C-R>=printf("Leaderf gtags -r %s --auto-jump", expand("<cword>"))<CR>
noremap <leader>gd :<C-U><C-R>=printf("Leaderf gtags -d %s --auto-jump", expand("<cword>"))<CR>
noremap <leader>go :<C-U><C-R>=printf("Leaderf gtags --recall %s", "")<CR>
noremap <leader>gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR>
noremap <leader>gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-B> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>


set laststatus=2 " for lightline

" for airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_section_x = '%{strftime("%Y %b %d %X")}'
" let g:airline_statusline_ontop=1
" let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['quickfix', 'tabline']


" for tokyo night
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
