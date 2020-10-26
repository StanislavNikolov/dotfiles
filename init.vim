" Stanislav Ch. Nikolov <stanislav.ltb@gmail.com>


" Basic nvim settings {{{
let mapleader = " "
set autoindent
set showcmd
set number
set relativenumber
set nowrap
filetype plugin on
set tabstop=4
set shiftwidth=4
set colorcolumn=101
set scrolloff=10
set foldenable
set foldlevelstart=6
set foldmethod=syntax

set list
set listchars=tab:··
" }}}
" Plugins {{{
" Install plug.vim if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
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
Plug 'pbrisbin/vim-alt-ctags' " automatically runs ctags on any git controlled file
" Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-surround'

" Plugins with config
Plug 'majutsushi/tagbar'
nmap <leader>l :TagbarToggle<CR>

" nerdtree
Plug 'scrooloose/nerdtree'
nmap <leader>h :NERDTreeToggle<CR>

" Plug 'dense-analysis/ale'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '%s'
" nmap <silent> <leader>aj :ALENext<cr>
" nmap <silent> <leader>ak :ALEPrevious<cr>

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

call plug#end()
" }}}
" Color settings {{{
set termguicolors
set background=dark
"set background=light
syntax enable
colorscheme gruvbox

" Make the background transparent
" highlight Normal guibg=none
" highlight NonText guibg=none
" }}}
" Other Leader keybindings {{{
nmap <leader>a :bd <CR>
nmap <leader>t :!alacritty & <CR><CR>
nmap <leader>o :CtrlPBuffer <CR>
nmap <silent><leader>n :nohlsearch <CR>
" }}}
" Movement keybindings {{{
" Make jk work as expected
nnoremap j gj
nnoremap k gk

nnoremap <tab> %
nnoremap <leader><leader> /<++><CR>c4l

nnoremap N Nzzzv
nnoremap n nzzzv

" Lets me cycle through splits with Alt+motion
noremap <A-h> <C-w>h<CR>k
noremap <A-j> <C-w>j<CR>k
noremap <A-k> <C-w>k<CR>k
noremap <A-l> <C-w>l<CR>k
" }}}
" Other {{{
autocmd FileType markdown set wrap
autocmd FileType cpp call Add_default_competitive_code()
fu! Add_default_competitive_code()
    if line("$") == 1
        call append(0, [ "#include <iostream>"
                   \   , ""
                   \   , "using std::cin; using std::cout; using std::cerr; using std::endl;"
                   \   , "#define D(x) std::cout << __LINE__ << ' ' << #x << \" = \" << x << std::endl;"
                   \   , ""
                   \   , "int main() {"
                   \   , "	std::ios_base::sync_with_stdio(false);"
                   \   , "	std::cin.tie(nullptr);"
                   \   , "	<++>"
                   \   , "	return 0;"
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

autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'w',
        \ 'callback': 'NERDTreeOpenFileInNewTerminalWindow',
        \ 'quickhelpText': 'open file in new (wl/x11) terminal' })

function! NERDTreeOpenFileInNewTerminalWindow()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        silent execute '! alacritty -e nvim' shellescape(n.path.str(), 1) '&'
    endif
endfunction

" }}}

" vim:foldmethod=marker:foldlevel=0
