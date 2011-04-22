set nocompatible
filetype off
" Pathogen: http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

"""
" Encoding and general usability
"""

nnoremap <Space> :

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start


" Python stuff from
" http://www.sontek.net/python-with-a-modular-ide-vim
autocmd FileType python set omnifunc=pythoncomplete#Complete
map <buffer> <leader>p2 :w<CR>:!/usr/bin/env python % <CR>
map <buffer> <leader>p3 :w<CR>:!/usr/bin/env python3 % <CR>

" Something for latex-suite
let g:tex_flavor='latex'

set display=lastline

" I don't like the menu (m) and toolbar (T).  They waste space.
set guioptions-=m
set guioptions-=T

" Line numbering
set number
set relativenumber


		""""""""""""""""""""""""""""""""""""""""""""""
		"""""" SEARCH, HIGHLIGHT, SPELLING, ETC. """""
		""""""""""""""""""""""""""""""""""""""""""""""
" Improved searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

set incsearch
syntax on

" Vim window stuff
set linebreak
set cursorline

"paragraph formatting stuff:
set formatprg=par

" Store temporary files in a central location
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

" hidden character stuff
nmap <leader>s :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" let me switch buffers with unsaved changes
set hidden

		""""""""""""""""""""""""""""""""""
		""""" GENERIC PLUGIN BEHAVIOR """"
		""""""""""""""""""""""""""""""""""
set ofu=syntaxcomplete#Complete
set autoread

		""""""""""""""""""
		""""" SPACING """"
		""""""""""""""""""	
set autoindent
set smartindent 
set tabstop=2 shiftwidth=2 expandtab

    """""""""""""""
    """" FOLDS """"
    """""""""""""""

set foldcolumn=0
set foldmethod=syntax "alternatives: indent, syntax, marker (uses `{{{` to open and `}}}` to close)
map <leader>mv :mkview<CR>
map <leader>lv :loadview<CR>

""""
" KEYMAP STUFF 
""""

" Cursor movement in word wrap stuff {{{
noremap <Up> gk 
noremap <Down> gj
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction 

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
set mouse=a

" keymappings for :e
map <leader>ew :e <C-R>=expand("%:p:h")."/"<CR> 
map <leader>es :sp <C-R>=expand("%:p:h")."/"<CR>
map <leader>ev :vsp <C-R>=expand("%:p:h")."/"<CR>
map <leader>et :tabe <C-R>=expand("%:p:h")."/"<CR>

" map for omnicomplete
inoremap <F8> <C-X><C-O>

" from http://nvie.com/posts/how-i-boosted-my-vim/
nmap <silent> <leader>vi :e $MYVIMRC<CR>
nmap <silent> <leader>vh :e ~/Documents/References/vim.txt<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" some mappings
nmap Q gwip

" Relative Number toggle (\rn)
nmap <silent> <leader>rn :call RelativeNumberToggle()<CR>
function! RelativeNumberToggle()
  if &number
    echo "relativenumber ON"
    setlocal relativenumber
  else
    if &relativenumber
      echo "relativenumber OFF"
      setlocal norelativenumber
      setlocal number
    endif
  endif
endfunction


"""
" PLUGIN STUFF
"""

map <leader>nt :NERDTree<CR>
let g:Tex_ViewRule_pdf = '/Applications/Skim.app'

