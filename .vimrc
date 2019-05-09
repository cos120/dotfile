set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'flazz/vim-colorschemes'
Plugin 'Yggdroot/indentLine'
Plugin 'Lokaltog/vim-powerline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'sk1418/Join'
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors' 
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'lifepillar/vim-solarized8'
Plugin 'wincent/command-t'

" Plugin 'tmhedberg/SimpylFold'
call vundle#end()            " required
filetype plugin indent on    " required

" settings

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set rnu
set nu
set guioptions+=a               " Visual selection automatically copied to the clipboard
set mouse=a
set clipboard=unnamedplus  " use the clipboards of vim and win
set clipboard+=autoselectplus
set t_Co=256
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set laststatus=2
set encoding=utf-8
set background=dark
set backspace=indent,eol,start
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F4> :Pydocstring<CR>
nnoremap <F5> :call custom#find_usage()<CR>
nnoremap <F6> :execute "%w !python"<CR>
set pastetoggle=<F7>
noremap <Leader>y "*y
noremap <Leader>p "*p
command Py execute "%w !python"
command Todo Ag! 'TODO|FIXME|CHANGED|BUG'
command Debug Ag! 'NOTE|INFO|IDEA|CAUTION'

colorscheme solarized8
"colorscheme molokai
syntax on
let NERDTreeMapOpenInTab='<C-o>'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
"let g:ycm_semantic_triggers = {
"  \   'cpp': [ 're!.' ],
"  \   'c++': [ 're!.' ],
"  \   'python': [ 're!.' ]
"  \ }
let g:ycm_filepath_completion_use_working_dir=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_complete_in_strings = 1

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
"markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let mapleader = "\<Space>"
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"ctrlp
let g:ctrlp_map = '<leader>P'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"powerline
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts=1
"funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']
set rtp+=~/.vim/bundle/CompleteParameter.vim
fun! SetupCommandAlias(from, to)
      exec 'cnoreabbrev <expr> '.a:from
              \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
              \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
if has("autocmd")
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|CAUTION\)')
    "autocmd Syntax * call matchadd('Param', '@\zs\(param\|rtype\)')
  endif
endif
