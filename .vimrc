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
"Plugin 'Shutnik/jshint2.vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'bcicen/vim-vice'
Plugin 'junegunn/fzf.vim'
Plugin 'SirVer/UltiSnips'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
"Plugin 'maralla/completor.vim'
Plugin 'w0rp/ale'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'myint/syntastic-extras'
"Plugin 'davidhalter/jedi-vim'
Plugin 'python-mode/python-mode'
Plugin 'neoclide/coc.nvim'
Plugin 'autozimu/LanguageClient-neovim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch'
Plugin 'moll/vim-node'
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
"colorscheme vice
set rtp+=~/.fzf
let NERDTreeShowHidden=1
set splitright

" auto detect rare file extensions
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.jq set filetype=javascript
au BufNewFile,BufRead *.jade set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript


" Stop from recording unexpectedly so remap q to Q
nnoremap Q q
nnoremap q <Nop>


" Utilsnips settings
set omnifunc=syntaxcomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
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


"let g:EclimCompletionMethod = 'omnifunc'
"
"" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:ycm_autoclose_preview_window_after_completion=1
"
" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" power line extenson
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
set laststatus=2
let g:bufferline_echo = 0


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on
filetype plugin on

"" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" Multiple visual selection 
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 1
"" Syntastic ignore cucumber undefined warnings
"let g:syntastic_quiet_messages = {
"  \ "!level":  "warnings",
"  \ "type":    "syntax",
"  \ "regex":   'Cucumber:\:\Undefined',
"  \ "file:p":  ['\.feature'] }

" language syntax checkers
let g:syntastic_python_checkers = ['pyflakes_with_warnings']
let g:syntastic_yaml_checkers = ['pyyaml']
let g:syntastic_json_checkers = ['json_tool']
let g:syntastic_make_checkers = ['gnumake']
let g:syntastic_c_checkers = ['check']
let g:syntastic_cpp_checkers = ['check']

" Ack / Ag search 
let g:ackprg = 'ag --vimgrep'

" SuperTab settings
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" Async linter
let g:ale_completion_enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_fixers = {
      \  'javascript': ['prettier', 'eslint', 'importjs'],
      \  'python': ['flake8', 'pylint'],
      \  'zsh': ['shell'],
      \  'ruby': ['rubocop']}

" Vim-test settings
"nmap <silent> t<C-n> :TestNearest<CR> 
"nmap <silent> t<C-f> :TestFile<CR> 
"nmap <silent> t<C-s> :TestSuite<CR> 
"nmap <silent> t<C-l> :TestLast<CR> 
"nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "dispatch"

" JSDoc settings
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1


" Python-mode settings
"let g:pymode_python = 'python3' 
"
" Language servers settings
set runtimepath+=~/.vim/LanguageClient-neovim
" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

" <leader>ld to go to definition
autocmd FileType javascript nnoremap <buffer>
  \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>

let g:LanguageClient_serverCommands.python = ['pyls']

" Map renaming in python
autocmd FileType python nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>


" Language specific support
" JavaScript
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" format JSON in opened file
nmap =j :%!python -m json.tool<CR>
