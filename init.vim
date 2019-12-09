" Stanislav Ch. Nikolov <stanislav.ltb@gmail.com>

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
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'

" Zero-conf plugins
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pbrisbin/vim-alt-ctags'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug '907th/vim-auto-save'

" Plugins with config
Plug 'majutsushi/tagbar'
nnoremap <F8> :TagbarToggle<CR>

Plug 'w0rp/ale'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '%s'

let g:ale_linters = {
\   'cpp': ['cppcheck'],
\}

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

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
set colorcolumn=101
set scrolloff=10
filetype plugin on
set foldenable
set foldlevelstart=6
set foldmethod=syntax
" }}}
" Color settings {{{
" set termguicolors
set background=dark
syntax enable
colorscheme gruvbox

" Make the background transparent
" highlight Normal guibg=none
" highlight NonText guibg=none
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
nnoremap <leader><leader> /<++><CR>cw

nnoremap N Nzzzv
nnoremap n nzzzv

" Lets me cycle through splits with Alt+motion
noremap <A-h> <C-w>h<CR>k
noremap <A-j> <C-w>j<CR>k
noremap <A-k> <C-w>k<CR>k
noremap <A-l> <C-w>l<CR>k
" }}}
" Other {{{
autocmd FileType cpp call Add_default_competitive_code()
fu! Add_default_competitive_code()
    if line("$") == 1
        call append(0, [ "#include <iostream>"
		           \   , ""
                   \   , "using std::cin; using std::cout; using std::cerr;"
                   \   , "#define D(x) std::cout << __LINE__ << ' ' << #x << \" = \" << x << std::endl;"
                   \   , ""
                   \   , "int main() {"
                   \   , "    std::ios_base::sync_with_stdio(false);"
                   \   , "    std::cin.tie(nullptr);"
		           \   , "    <++>"
                   \   , "    return 0;"
                   \   , "}" ])
    endif
endfu
" copy buffer into clipboard
nnoremap <leader>y mZgg"+yG'Zk<CR>
" easier to press
let g:ctrlp_map = '<leader>p'

let g:ctags_file = '.tags'
set tags=./.tags

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

" }}}

" vim:foldmethod=marker:foldlevel=0
