" GENERAL {{{1
" SETTINGS {{{2

" Miscallenous {{{3
set hidden                      " Hide files when leaving them.
set number                      " Show line numbers.
set numberwidth=1               " Minimum line number column width.
set cmdheight=120                 " Number of screen lines to use for the commandline.
set textwidth=0                 " Lines length limit (0 if no limit).
set formatoptions=jtcrq         " Sensible default line auto cutting and formatting.
set linebreak                   " Don't cut lines in the middle of a word .
set showmatch                   " Shows matching parenthesis.
set matchtime=2                 " Time during which the matching parenthesis is shown.
set background=dark             " Color adapted to dark background.
set statusline=%f\ %m%=[%l/%L]  " Status line (filename [modified] ...  [currentLine / totalLines])
set listchars=tab:▸\ ,eol:¬     " Invisible characters representation when :set list.
set clipboard=unnamedplus       " Copy/Paste to/from clipboard
set cursorline                  " Highlight line cursor is currently on
"set completeopt+=noinsert       " Select the first item of popup menu automatically without inserting it
set autoread                    " Automatically re-read files that have been modified outside vim

" Search {{{3
set incsearch  " Incremental search.
set ignorecase " Case insensitive.
set smartcase  " Case insensitive if no uppercase letter in pattern, case sensitive otherwise.
set nowrapscan " Don't go back to first match after the last match is found.

" Fold {{{3
set foldmethod=syntax
set foldlevelstart=5

" Indentation {{{3
set autoindent
set smartindent

" Tabs {{{3
set expandtab     " Tab transformed in spaces
set tabstop=2     " Sets tab character to correspond to x columns.
" x spaces are automatically converted to <tab>.
" If expandtab option is on each <tab> character is converted to x spaces.
set softtabstop=2 " column offset when PRESSING the tab key or the backspace key.
set shiftwidth=2  " column offset when using keys '>' and '<' in normal mode.

" MAPPINGS {{{2

let mapleader = ","
set timeoutlen=700 " time in milliseconds that is waited for the next mapping key

" <Esc> {{{3
noremap <leader>m <Esc>
inoremap <leader>m <Esc>
cnoremap <leader>m <Esc>
tnoremap <leader>m <C-\><C-n>

" Navigate inside a wrapped line {{{3
noremap <Up> :normal! gk<CR>
noremap <Down> :normal! gj<CR>

" Handle window actions with Meta instead of <C-w> {{{3
" Switching
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Moving
nnoremap <M-H> <C-w>H
nnoremap <M-J> <C-w>J
nnoremap <M-K> <C-w>K
nnoremap <M-L> <C-w>L
nnoremap <M-x> <C-w>x

" Resizing
nnoremap <M-=> <C-w>=
nnoremap <M-+> <C-w>10+
nnoremap <M-_> <C-w>10-
nnoremap <M-<> <C-w>10<
nnoremap <M->> <C-w>10>

" Creating
nnoremap <M-n> <C-w>n
nnoremap <M-s> <C-w>s
nnoremap <M-v> <C-w>v
nnoremap <M-]> <C-w>g<C-]>

" Closing
nnoremap <M-c> <C-w>c
nnoremap <M-o> <C-w>o

" Quickfix
nnoremap <M-Enter> <C-w><CR>

" Switch between buffers {{{3
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <leader>b :Buffers<CR>

" Quickfix list {{{3
noremap <silent> <leader>q :copen<CR>
noremap <silent> <S-l> :cprevious<CR>
noremap <silent> <S-h> :cnext<CR>

" Move to next fold {{{3
nnoremap <C-k> zk
nnoremap <C-j> zj

" More/Less foldlevel {{{3
nnoremap <M-r> zr
nnoremap <M-e> zm

" Clipboard {{{3
inoremap <C-r>e <C-r>+
cnoremap <C-r>e <C-r>+

function! ClipboardUseToggle()
  if &clipboard ==# "unnamedplus"
    set clipboard=""
  else
    set clipboard=unnamedplus
  endif
  echom "clipboard=" . &clipboard
endfunction
nnoremap <silent> <leader>r :call ClipboardUseToggle()<CR>

function! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace() " Trim whitespace with command
autocmd BufWritePre * :call TrimWhitespace()  " Trim whitespace on every save

" Remove search highlighting {{{3
nnoremap <silent> <leader>, :nohlsearch<CR>

" Clear command line {{{3
nnoremap <C-\> :<BS>

" Redraws the screen {{{3
nnoremap <leader>d :redraw!<CR>

" Toggle display of tabs and EOF {{{3
nnoremap <leader>l :set list!<CR>

" Remove trailing whitespace {{{3
" use of '<silent>' to hide what would be output on the command line
" use of ':silent!' to hide error message when pattern is not found
nnoremap <silent> <leader>w :silent! execute '/\v( )+$'<CR>
nnoremap <silent> <leader>W :silent! execute '%substitute/\v( )+$//'<CR>

" Modify init.vim easily {{{3
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Auto-commands {{{1
" Vimscript {{{2
augroup vimscript_augroup
  autocmd!
  autocmd FileType vim nnoremap <buffer> <M-z> :execute "help" expand("<cword>")<CR>
augroup END

" Scala {{{2
augroup scala_augroup
  autocmd!
  "  autocmd BufWritePre *.{scala,sbt} Neoformat
  "  autocmd BufWrite * Autoformat
  autocmd BufWritePost *.scala Neomake
augroup END

" PLUGINS {{{1
" INSTALL {{{2
let s:NVIM_HOME = "/" . join(split($MYVIMRC, "/")[0 : -2], "/")
let s:PLUGINS_DIR_NAME = "plugged"

call plug#begin(s:NVIM_HOME . "/" . s:PLUGINS_DIR_NAME)
"Plug 'altercation/vim-colors-solarized'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-abolish'
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
Plug 'godlygeek/tabular'
Plug 'rcmdnk/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'liuchengxu/vista.vim'
Plug 'ryanoasis/vim-devicons'


Plug 'scrooloose/syntastic'             " syntax checker
" --- Haskell
"Plug 'yogsototh/haskell-vim'            " syntax indentation / highlight
"Plug 'enomsg/vim-haskellConcealPlus'    " unicode for haskell operators
"Plug 'eagletmt/ghcmod-vim'
"Plug 'eagletmt/neco-ghc'
"Plug 'Twinside/vim-hoogle'
"Plug 'pbrisbin/html-template-syntax'    " Yesod templates
" --- End Haskell
call plug#end()

" SETTINGS {{{2
" Airline {{{3
" let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

" Solarized {{{3
" colorscheme solarized

" MAPPINGS {{{2
" NERDTree {{{3
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind <CR>

" Gundo {{{3
nnoremap <leader>u :GundoToggle<CR>

" AUGROUPS {{{2
" Fugitive {{{3
augroup fugitive_plugin
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
let g:scala_sort_across_groups=1
nnoremap <leader>s :SortScalaImports<CR>
" autocmd BufWrite * SortScalaImports

" Comment highlights for coc
autocmd FileType json syntax match Comment +\/\/.\+$+

" Configuration for coc.nvim

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use [c and ]c for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" -------------------
"       Haskell
" -------------------
"
" ---------- VERY IMPORTANT -----------
" Don't forget to install ghc-mod with:
" cabal install ghc-mod
" -------------------------------------

"let mapleader="-"
"let g:mapleader="-"
"set tm=2000
"nmap <silent> <leader>ht :GhcModType<CR>
"nmap <silent> <leader>hh :GhcModTypeClear<CR>
"nmap <silent> <leader>hT :GhcModTypeInsert<CR>
"nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>:lopen<CR>
"let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
"let g:syntastic_always_populate_loc_list = 1
"nmap <silent> <leader>hl :SyntasticCheck hlint<CR>:lopen<CR>
"
"" Auto-checking on writing
"autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync
"
""  neocomplcache (advanced completion)
"autocmd BufEnter *.hs,*.lhs let g:neocomplcache_enable_at_startup = 1
"function! SetToCabalBuild()
"    if glob("*.cabal") != ''
"        set makeprg=cabal\ build
"    endif
"endfunction
"autocmd BufEnter *.hs,*.lhs :call SetToCabalBuild()
"
"" -- neco-ghc
"let $PATH=$PATH.':'.expand("~/.cabal/bin")
"


" -----------------------------
"  MACROS
" ----------------------------

let @a=':%s:\(\s*\)\([^:]*\)::\1"\2"::Ige"\<C-m>":%s:"''\([^:]*\)''":"\1":Ige"\<C-m>":%s:,\n\(\s*\)}:\r\1}:Ige"\<C-m>"'


"----------------------------------
" COC VISTA
" ---------------------------------

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = [">", "|>"]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

nnoremap <silent> <leader>v :Vista<CR>

