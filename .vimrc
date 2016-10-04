" not vi compatible
set nocompatible 

filetype off

" init vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"""""""""""""" PLUGINS """""""""""""""""""""""
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-cucumber'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'Shutnik/jshint2.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Valloric/YouCompleteMe'
Plugin 'metakirby5/codi.vim'
Plugin 'bcicen/vim-vice'
Plugin 'junegunn/fzf.vim'
Plugin 'SirVer/UltiSnips'
Plugin 'scrooloose/syntastic'

"""""""""""""" PLUGINS """""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required

" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Vim Indent rules
let g:indentLine_color_term = 239
let g:indentLine_char = '░'
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)


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
"set paste
set relativenumber 	"here be zero
set tabstop=2
set expandtab       "tabs to spaces
set shiftwidth=2
set foldmethod=syntax
"setlocal spell
"setlocal spell spelllang=en_us
"set complete+=kspell
colorscheme vice
set rtp+=~/.fzf

" auto detect rare file extensions
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.jq set filetype=javascript
au BufNewFile,BufRead *.jade set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript


" Stop from recording unexpectedly so remap q to Q
nnoremap Q q
nnoremap q <Nop>

set runtimepath+=~/.vim/bundle/jshint2.vim
au FileType javascript call JavaScriptFold()

" Utilsnips settings
set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1


let g:EclimCompletionMethod = 'omnifunc'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_autoclose_preview_window_after_completion=1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" power line extenson
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
set laststatus=2
let g:bufferline_echo = 0


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on
filetype plugin on

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Syntastic ignore cucumber undefined warnings
let g:syntastic_quiet_messages = {
  \ "!level":  "warnings",
  \ "type":    "syntax",
  \ "regex":   'Cucumber:\:\Undefined',
  \ "file:p":  ['\.feature'] }





