"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
"

set rnu!
set ai
set hlsearch            
set incsearch          
set showmatch         
set ignorecase       
set smartcase       

set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set hidden

set visualbell t_vb= 
set novisualbell    
set mouse=a
set autochdir

" Clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

" Plugins
set nocompatible
filetype off   


call plug#begin('~/.vim/plugged')

"Plug 'git://git.wincent.com/command-t.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimproc.vim'
Plug 'jceb/vim-orgmode'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-speeddating'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'MikeCoder/quickrun.vim' 
Plug 'mboughaba/i3config.vim'
Plug 'ap/vim-css-color'
Plug 'eagletmt/ghcmod-vim'
Plug 'dag/vim-fish'
Plug 'BrandonRoehl/auto-omni'
"Plug 'calebsmith/vim-lambdify'
Plug 'preservim/nerdtree'
Plug 'andymass/vim-matchup'

" Autocompletion
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [ 'coc-snippets', 'coc-omni', 'coc-dictionary', 'coc-python', 'coc-json', 'coc-css', 'coc-texlab']

"" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Markdown preview
Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_github=1

" HTML
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
"
"let g:slime_target = "kitty"

"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

"au BufEnter *.ml setf ocaml
"au BufEnter *.mli setf ocaml
"au FileType ocaml call FT_ocaml()
"function FT_ocaml()
    "set textwidth=80
    "set colorcolumn=80
    "set shiftwidth=2
    "set tabstop=2
    """ ocp-indent with ocp-indent-vim
    "let opamshare=system("opam config var share | tr -d '\n'")
    "execute "autocmd FileType ocaml source".opamshare."/vim/syntax/ocp-indent.vim"
    "filetype indent on
    "filetype plugin indent on
"endfunction

" Python3
Plug 'python-mode/python-mode'

" Javascript
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab

" Java
Plug 'hdiniz/vim-gradle'

" Git
Plug 'tpope/vim-fugitive'

" Clipboard
Plug 'junegunn/vim-peekaboo'

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Theme
Plug 'ayu-theme/ayu-vim'

" Writing 
Plug 'dbmrq/vim-ditto'
Plug 'junegunn/goyo.vim'

Plug 'gisphm/vim-gitignore'

call plug#end()

filetype plugin indent on
syntax on

set timeout
set timeoutlen=2500
set ttimeoutlen=10

" Theme
set termguicolors     " enable true colors support
let ayucolor="mirage"   " for dark version of theme
"let ayucolor="light"   " for light version of theme
colorscheme ayu
let g:airline_theme='ayu'

" Gui
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar"

" Quickrun
let g:quickrun_known_file_types = {
        \"cpp": ["!g++ %", "./a.out", "rm ./a.out"],
        \"c": ["!gcc %", "./a.out", "rm ./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python3 %"],
        \"trp": ["!~/Repos/Troupe/local.sh %"],
        \"sol": ["!solc --bin --optimize %"],
        \"midlang": ["!mid build %"],
        \"js": ["!node %"],
    \}

nnoremap <F5> :QuickRun<cr>

" Spell check
command Dkdir setlocal spelllang=da
command Spellcommands setlocal spell | setlocal linebreak | setlocal tw=79
autocmd BufRead,BufNewFile *.txt Spellcommands
autocmd BufRead,BufNewFile *.org Spellcommands
autocmd BufRead,BufNewFile *.md  Spellcommands
autocmd BufRead,BufNewFile *.tex Spellcommands

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.DS_Store$', '\.git$', '__pycache__'] " ignore files in nerd tree

" Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Autocompletion 
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" CoC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Writing
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" GOyo
autocmd! User GoyoEnter nested set eventignore=FocusGained
autocmd! User GoyoLeave nested set eventignore=
