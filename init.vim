" Stanislav Nikolov <stanislav.ltb@gmail.com>

" Plugins {{{
" Install plug.vim if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'romainl/flattened'
Plug 'NLKNguyen/papercolor-theme'

" Zero-conf plugins
Plug 'bronson/vim-trailing-whitespace'
Plug 'kien/ctrlp.vim'
Plug 'pbrisbin/vim-alt-ctags'

Plug 'Shougo/deoplete.nvim'
Plug 'itchyny/lightline.vim'

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
set fillchars=vert:\│
" }}}
" Fold settings {{{
set foldenable
set foldlevelstart=6
set foldmethod=syntax
" }}}
" Color settings {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme PaperColor
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
nmap <leader>t :term <CR>
nmap <leader>o :CtrlPBuffer <CR>
nmap <silent><leader>n :nohlsearch <CR>
" }}}
" Movement keybindings {{{
" Make jk work as expected
nnoremap j gj
nnoremap k gk

nnoremap H ^
nnoremap L g_
map <tab> %

nnoremap N Nzzzv
nnoremap n nzzzv

" Lets me cycle through splits with Alt+motion
noremap <A-h> <C-w>h<CR>
noremap <A-j> <C-w>j<CR>
noremap <A-k> <C-w>k<CR>
noremap <A-l> <C-w>l<CR>
" }}}
" <leader>r settings {{{
autocmd filetype python nnoremap <leader>r :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <leader>r :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <leader>r :w <bar> exec '!g++ '.shellescape('%').' -O2 -std=c++11 -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype js nnoremap <leader>r :w <bar> exec '!node '.shellescape('%')<CR>
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
let b:ctags_command = "ctags -f '%f' -R *"
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

" Copies the current line, without the indentation
nnoremap vv ^vg_

let g:deoplete#enable_at_startup = 1
" }}}

" vim:foldmethod=marker:foldlevel=0
