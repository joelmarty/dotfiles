" The `$HOME/.vimrc` file is the primary user-specific configuration file for
" the [Vim](http://www.vim.org/) advanced text editor. Vim is by far my
" favorite text editor. When I program, I use Vim. When I
" edit configuration files, I use Vim. When I blog, I use Vim. Even when I
" browse the web, I use Vim (actually I use
" [Vimperator](http://www.vimperator.org), a Firefox plugin that adds command
" mode and Vim-like keybindings).
"
" This file is the entry point to my entire Vim configuration, including both
" the console-based Vim and the graphical GVim. Each option is discussed as
" it is set.

" ## Basic Options

" The majority of the time I run Vim, there is something with a defined
" syntax, from this very file to Go source code to CoffeeScript files to
" stylesheets. The following option enables syntax highlighting that filetype
" plugins utilize.
syntax on

" No matter what I am editing, I like to see line numbers to the left.
set number

" As a matter of best practice, I try to keep all lines in files from
" exceeding 80 characters so there are no wrapping issues when viewed
" anywhere. The following command will create a vertical line at 80
" characters. In most of my color themes, it will show as red.
set colorcolumn=80

" I want the status line that appears at the bottom of the screen to be
" visible by default, rather than only under certain conditions.
set laststatus=2

" I like to see the line on which the cursor sits to be highlighted so it is
" easier to locate.
set cursorline

" The `smartindent` option has Vim use intelligent rules to determine when and
" how much to indent. This is very handy when editing code or bulleted lists.
set smartindent

" As a general rule, I prefer spaces instead of tabs. The following options
" expand tab keypresses to four spaces. I also set tabs to present themselves
" as four spaces for those files that require tabs (like a Makefile).
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" There some Vi compatibilities that I don't like, so I get rid of them. 
set nocompatible

" Store the .swp files in a specific path
set directory=~/.vim/swp

" I very much like the `Clean`, `Terminus`, and `Source Code Pro` fonts. This
" sets one as the default when using GVim.
"set guifont=Source\ Code\ Pro\ Semi-Bold\ 11

" I prefer not to keep file history in the menus of GVim.
"let g:bmenu_max_pathlen=0

" This tells Vim to automatically change the global current working directory
" to the directory of the file currently being edited.
set autochdir

" The following asks Vim to autodetect the type of file I have open and load
" its plugin. The `filetype indent` option also asks Vim to load the
" filetype's indent plugin if it exists. This is a must if you expand tabs to
" spaces and edit Makefiles, as I do.
filetype plugin on
filetype indent on

" Further, when working with source code, we ask Vim to support
" OmniCompletion, which uses smarter algorithms to look at the text prior to
" the cursor to try to guess what you want to type next.
set ofu=syntaxcomplete#Complete

" For the completion menu, we want on invokation for Vim to insert the longest
" sequence of letters common to all completions, just like in an IDE like
" Eclipse or NetBeans. Further, we want the menu to show even if there was
" only a single match.
set completeopt=longest,menuone

" Now we want Vim to behave like other editors with regard to open files; by
" setting this option, Vim allows us to have edited buffers "hidden" behind
" the current one.
set hidden

" Vim usually sets up its handling of keys like `Ctrl-Left` and `Ctrl-Right`,
" but when `$TERM` is set to anything starting with `screen`, it skips this
" process. To account for my custom `urxvt` and `tmux` configurations, I set
" up this handling myself.
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" ## Plugins

" Adding and deleting Vim scripts can be tough to manage. If you code in, say,
" C, you have files for syntax, a filetype detection, plugin features, and
" more - and all of these files are stored in separate directories along with
" like files from all of your other plugins. If you want to remove a plugin,
" you must search all of these directories and delete them manually. What a
" mess. Instead, I love the [Pathogen](https://github.com/tpope/vim-pathogen) 
" package management system. It allows you to keep all of your plugins in
" their own directories, so adding and deleting is a breeze. 

" To load it, I first add Pathogen's autoload to the runtime and then I call
" `Pathogen#infect` to load all my plugins, passing it the folder inside
" `$HOME/.vim/` where they are stored. See the
" [README](#/home/vim/README.markdown) inside the `packages` directory for
" information on my plugins.
runtime pathogen/autoload/pathogen.vim
call pathogen#infect()

" I like to have a darker color scheme when running GVim. Of the built-in
" schemes, I tend to like `vividchalk`, which is one of the plugins loaded by
" Pathogen. I also like `moria` and `Tomorrow-Night-Bright`, which are
" included as well.
colorscheme jellybeans

" One of the plugins I use is [NERDTree](https://github.com/scrooloose/nerdtree), 
" a file tree explorer. If I launch Vim without specifying any file, I want it
" to open NERDTree.
"
" Also, I do not need all files to appear, so I tell NERDTree to ignore
" certain types of files.
autocmd GuiEnter * if !argc() | edit `pwd` | endif
let NERDTreeIgnore=[ '\.o$', '\.swp$', '\~$', '\.class$' ]

map <silent><c-e> :NERDTreeToggle <cr>

" For some reason, YAML files do not have filetype detection, so we add it
" here simply based on the file extension.
au BufNewFile,BufRead *.yaml,*.yml setfiletype yaml

" The latex-suite plugin likes some things to be a certain way.
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" For the CtrlP plugin, I want to ignore any files matching these patterns:
set wildignore+=*/tmp/*,*.so,*.sw*,*.zip,*.tar.*,*.tar,.git/*

" This is just some basic setup for the UltiSnips plugin.
"let g:UltiSnipsEditSplit = 'vertical'

" For Syntastic, we must specify which linters we want to use for which
" languages.
let g:syntastic_javascript_checker = 'jslint'

" ## Custom Key Mappings

" Here are a few keybindings I've included for convenience. The first two map
" `Control+s` to write out the current buffer and continue where I left off.
" The third maps `\w` to the same. Lastly, I map `Control+p` to put the
" contents of Vim's clipboard buffer to after the cursor.
imap <C-s> <ESC>:w<CR>a
nmap <C-s> <ESC>:w<CR>
nnoremap <leader>ww :w<CR>
imap <C-p> <ESC>p<CR>a

" When I use Vim for blogging or other writing, I like to enable auto-wrapping
" at 80 characters as well as enable spell checking. To be able to switch back
" and forth, I have mapped `F7` and `F9` to enable and disable, respectively.
map <F7> :set spell<CR>:set spellsuggest=10<CR>:set textwidth=80<CR>:set wm=2<CR>
map <F9> :set nospell<CR>:set textwidth=0<CR>

" For the LessCSS plugin, I have a convenience keybinding to run the lessc
" command and to pipe the contents to the file with the same name but with the
" extension `css` rather than `less`. Also, I use the
" [RECESS](http://twitter.github.com/recess/) linter made by
" [Twitter](http://twitter.github.com) for CSS and LESS to ensure proper
" styles.
"nnoremap <leader>lc :w <BAR> !lessc % > %:t:r.css<CR><space> | cwindow
"nnoremap <leader>ll :w <BAR> !recess <CR> | cwindow

" It can be bloody annoying to hit the `enter` key on a completion menu and
" have it not only not complete the selected entry, but kick me onto a new
" line. This changes the behavior of the `enter` key so that it will just
" activate the completion.
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<C-g>u<CR>"

" `Ctrl-n` will continue to function as it should, but continuing to type will
" also narrow the selection, moving the highlighted entry to the next logical
" match.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Open the omni completion menu, closing the previous one if open, and opening
" a new menu without changing the text:
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" Open the user completion menu, closing the previous one if open, and opening
" a new menu without changing the text.
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" Now I map a keybinding for CoffeeScript files to run the `coffeelint`
" command on the current file on `\cl` and `:CoffeeMake` on the current file
" on `\cc`.
"map <leader>cl :CoffeeLint! <CR>| cwindow
"map <leader>cc :CoffeeMake --bare <CR>| cwindow

" And a little shortcut for obtaining word count:
map <leader>wc :!wc -w %<CR>

" Active the Tagbar plugin with `<F8>`.
map <F8> :TagbarToggle<CR>

" Also, for the Tagbar plugin, I use DoctorJS for its ctags-like output for
" Javascript, so I need to tell TagBar to use it.
"let g:tagbar_type_javascript = {
"    \ 'ctagsbin' : '/usr/bin/jsctags'
"\ }

" Visually select text then press ~ to convert the text to UPPER CASE, then to
" lower case, then to Title Case. Keep pressing ~ until you get the case you
" want.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv


