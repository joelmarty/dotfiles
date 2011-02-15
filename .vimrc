" add support for custom .asc asciidoc files used at marakana
au! BufRead,BufNewFile *.asc	setfiletype asciidoc

" add xquery support
au! BufRead,BufNewFile *.xq     setfiletype xquery
au! BufRead,BufNewFile *.xql    setfiletype xquery
au! BufRead,BufNewFile *.xqm    setfiletype xquery
au! BufRead,BufNewFile *.xquery setfiletype xquery
au! BufRead,BufNewFile *.xqy    setfiletype xquery

" scan the directory for help topics
:helptags ~/.vim/doc

" My .vimrc configuration file.
" =============================
"
" ,v and ,V to show/edit and reload the vimrc configuration file
" <alt-left/right> to navigate trough tabs
" <ctrl-e> to display the explorator
" <ctrl-p> for the code explorator
" <ctrl-n> enter tabnew to open a new file
" <alt-h> highlight the lines of more than 80 columns
" <maj-k> when on a python file, open the related pydoc documentation
" <F2> set textwith to 80 cols
" <F3> remove the trailing slashes
" <F4> highlight more than 80 columns chars
" <F5> call python pep8
" <F6> show/hide the quickfix window

"" include other configuration files
" source $HOME/.vimrcpy (not used)          

"" default values """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme desert256
syntax on                       " syntax highlighting
filetype on                     " to consider filetypes
filetype plugin on              " ... also in plugins
set directory=~/.vim/swp        " store the .swp files in a specific path
set expandtab                   " enter spaces when tab is pressed
set tabstop=4                   " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4                " number of spaces to use for auto indent
set autoindent                  " copy indent from current line on new line
set number                      " show line numbers
set backspace=indent,eol,start  " make backspaces more powerful
set ruler                       " show line and column number
set showcmd                     " show (partial) command in status line
set incsearch                   " highlight search
set noignorecase                " don't ignore case on search
set infercase
set nowrap
set textwidth=80                " set textwith by default to 80 columns
set acd                         " auto change directory
set laststatus=2                " Always set a status line
"set mouse=a                     " enable the mouse.

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" Omnifunc completers
autocmd FileType python set omnifunc=pythoncomplete#Complete

"" remaps """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remap p and P to adjust the indent by default.
:nnoremap <Esc>p p'[v']=
:nnoremap <Esc>P P'[v']=

"" shortcuts """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <c-n> :tabnew
map <silent><c-e> :NERDTreeToggle <cr>
map <silent><c-p> :TlistToggle <cr>
nnoremap <a-right> gt
nnoremap <a-left>  gT

" write a file while dont getting the rights to.
command W w !sudo tee % > /dev/null

" K on a word find it's documentation (python)
"map <buffer> K :execute "!pydoc " . expand("<cword>")<CR>
map <F2> :set textwidth=80 <cr>

" Replace trailing spaces
map <F3> :%s/\s\+$//<CR>:exe ":echo'trailing slashes removes'"<CR>
"map <silent><F6> :QFix<CR>

" edit vim quickly
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo'vimrc reloaded'"<CR>

" remap CTRL+N to CTRL + space
inoremap <Nul> <C-n>

" diff next/prec
map <silent> ,p [c
map <silent> ,n ]c

" change the current buffer to equal the other
map <silent> ,< do
" and the inverse (change the other buffer)
map <silent> ,> dp

" ,a to abort
map <silent> ,a :cq<CR>

" send the actual file to gist
"map <silent> gist :!gist %<CR>

"" Plugins configuration """"""""""""""""""""""""""""""""""""""""""""""""""""""

" Tlist configuration
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 0
let Tlist_Auto_Update = 1
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
let Tlist_Show_One_File = 1
let Tlist_Show_Menu = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let tlist_css_settings = 'css;e:SECTIONS'

" NerdTree configuration
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Vala specific setup
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

" Disable valadoc syntax highlight
" "let vala_ignore_valadoc = 1
"
" " Enable comment strings
let vala_comment_strings = 1
"
" Highlight space errors
" let vala_space_errors = 1
" Disable trailing space errors
" let vala_no_trail_space_error = 1
" Disable space-tab-space errors
" let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120

"" Functions """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight more than 80 columns lines on demand
nnoremap <silent><F4>
\    :if exists('w:long_line_match') <Bar>
\        silent! call matchdelete(w:long_line_match) <Bar>
\        unlet w:long_line_match <Bar>
\    elseif &textwidth > 0 <Bar>
\        let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
\    else <Bar>
\        let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
\    endif<CR>

"command -bang -nargs=? QFix call QFixToggle(<bang>0)

"function! QFixToggle(forced)
"  if exists("g:qfix_win") && a:forced == 0
"    cclose
"    unlet g:qfix_win
"  else
"    copen 10
"    let g:qfix_win = bufnr("$")
"  endif
"endfunction
