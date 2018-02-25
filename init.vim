" Stanislav Nikolov <stanislav.ltb@gmail.com>

" Plugins {{{
" Install plug.vim if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Style
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

" Zero-conf plugins
Plug 'bronson/vim-trailing-whitespace'
Plug 'kien/ctrlp.vim'
Plug 'pbrisbin/vim-alt-ctags'
Plug 'sheerun/vim-polyglot'

Plug 'w0rp/ale'

"Plug 'Shougo/deoplete.nvim'
"Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug '907th/vim-auto-save'
Plug 'reedes/vim-pencil'

call plug#end()
" }}}
" Basic nvim settings {{{
set autoindent
set showcmd
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set wrap
set hidden
set lazyredraw
set colorcolumn=101
set scrolloff=10
set fillchars=vert:\│
filetype plugin on 
" }}}
" Fold settings {{{
set foldenable
set foldlevelstart=6
set foldmethod=syntax
" }}}
" Color settings {{{
set termguicolors
set background=dark
colorscheme PaperColor
"colorscheme badwolf
"colorscheme wal
syntax on

" Make the background transparent
highlight Normal guibg=none
highlight NonText guibg=none
" }}}
" Other Leader keybindings {{{
let mapleader = " "
nmap <leader>l :source ~/.config/nvim/init.vim <CR>
nmap <leader>s :w <CR>
nmap <leader>q :q <CR>
nmap <leader>a :bd <CR>
nmap <leader>t :!gnome-terminal <CR>
nmap <leader>o :CtrlPBuffer <CR>
nmap <silent><leader>n :nohlsearch <CR>
" }}}
" Movement keybindings {{{
" Make jk work as expected
nnoremap j gj
nnoremap k gk

nnoremap <tab> %

nnoremap N Nzzzv
nnoremap n nzzzv

" Lets me cycle through splits with Alt+motion
noremap <A-h> <C-w>h<CR>k
noremap <A-j> <C-w>j<CR>k
noremap <A-k> <C-w>k<CR>k
noremap <A-l> <C-w>l<CR>k
" }}}
" Language specific {{{
"autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
"autocmd Filetype rust setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp call IoStream()
fu! IoStream()
    if line("$") == 1
        call append(0, "#include <iostream>")
        call append(1, "#define D(x) std::cout << __LINE__ << ' ' << #x << \" = \" << x << std::endl;")
        call append(2, "")
        call append(3, "int main() {")
        call append(4, "#ifndef LOCAL_STJO")
        call append(5, "    std::ios_base::sync_with_stdio(false);")
        call append(6, "    std::cin.tie(nullptr);")
        call append(7, "#endif")
        call append(8, "    return 0;")
        call append(9, "}")
    endif
endfu
" }}}
" CtrlP {{{
" I kinda use Ctrl+P for compliteon, soooo....
let g:ctrlp_map = '<leader>p'

" Use ag instead of whatever it is using by default
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
" }}}
" Other {{{
nnoremap <leader>y mZgg"+yG'Zk<CR>

let g:ctags_file = '.tags'
set tags=./.tags
nnoremap ; :

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

" Makes * work as expected in visual mode
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

let g:deoplete#enable_at_startup = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '%s'

let g:ale_linters = {
\   'cpp': ['cppcheck'],
\}

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" }}}

" vim:foldmethod=marker:foldlevel=0
