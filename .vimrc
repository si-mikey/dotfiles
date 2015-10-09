" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"pathogen infection, before filetype plugin indent on
execute pathogen#infect()

"jshint tool
set runtimepath+=~/.vim/bundle/jshint2.vim

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on


" Vim
let g:indentLine_color_term = 239

"GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_char = '░'

"code completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"use eclim intellisense on superTab
let g:SuperTabDefaultCompletionType = 'context'


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set ruler		" show the cursor coords
set noswapfile		" no swaps
set nobackup		"
set nowritebackup	"
set backspace=2		" backspace delete
set colorcolumn=80 
set t_Co=256 "256 colors in terminal
set list "show hidden chars
set paste

"settings i like
set relativenumber 	"here be zero
set tabstop=2
set expandtab       "tabs to spaces
set shiftwidth=2
set foldmethod=syntax
setlocal spell
setlocal spell spelllang=en_us
set complete+=kspell

" auto detect rare file extensions
au BufNewFile,BufRead *.jq set filetype=javascript
au BufNewFile,BufRead *.jade set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript


" remap q to Q
nnoremap Q q
nnoremap q <Nop>

" fold javascript 
au FileType javascript call JavaScriptFold()

"ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim



"Show motion for words:  
"nnoremap <silent> w w:call g:Highw()<CR>:call g:HighW()<CR>  
"nnoremap <silent> W W:call g:Highw()<CR>:call g:HighW()<CR>  
""nnoremap <silent> b b:call g:Highb()<CR>:call g:HighB()<CR>  
"nnoremap <silent> B B:call g:Highb()<CR>:call g:HighB()<CR>  
"nnoremap <silent> e e:call g:Highe()<CR>:call g:HighE()<CR>  
"nnoremap <silent> E E:call g:Highe()<CR>:call g:HighE()<CR>  
"
""Show motion for chars:  
"nnoremap f :call g:FindChar( 'f', "forward" )<CR>  
"nnoremap t :call g:FindChar( 't', "forward" )<CR>  
"nnoremap F :call g:FindChar( 'F', "backward" )<CR>  
"nnoremap T :call g:FindChar( 'T', "backward" )<CR>  
"nnoremap ; :call g:SeekRepeat()<CR>:call g:HighRepeat()<CR>
"nnoremap , :call g:SeekReverse()<CR>:call g:HighReverse()<CR>
"

"Utilsnips settings

" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" power line extenson
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
set laststatus=2
let g:bufferline_echo = 0

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
" source /etc/vim/vimrc.local
"endif

