source $VIMRUNTIME/mswin.vim

set mouse=a
set encoding=utf-8
set number relativenumber
syntax enable
set noswapfile
set scrolloff=7
set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

let mapleader = " "
inoremap jk <esc>

call plug#begin('~/.config/nvim/plugged')
"call plug#begin('~/.vim/plugged')
Plug 'nvie/vim-flake8'

Plug 'AndrewRadev/tagalong.vim' " Using tagalong we can change the opening tag and automatically change the corresponding closing one.

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python'
Plug 'tweekmonster/django-plus.vim'
"Plug 'davidhalter/jedi-vim'  " Python autocompletion
"Plug 'vim-scripts/indentpython.vim' " Python indentation
"Plug 'tpope/vim-surround'     " Surround text with quotes/brackets
Plug 'linux-cultist/venv-selector.nvim'
Plug 'yaegassy/coc-mypy', {'do': 'yarn install --frozen-lockfile'}

Plug 'morhetz/gruvbox' "gruvbox color scheme
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
"Plug 'vim-airline/vim-airlhtmldjangoine'
Plug 'vim-airline/vim-airline' "tabs and panels
Plug 'vim-airline/vim-airline-themes'
"Plug 'sirver/ultisnips'

Plug 'ryanoasis/vim-devicons'

Plug 'Xuyuanp/nerdtree-git-plugin' "git in NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Plug 'ycm-core/YouCompleteMe'

Plug 'jmcantrell/vim-virtualenv' "py venv
Plug 'airblade/vim-gitgutter'

"Plug 'ayu-theme/ayu-vim' "ayu color scheme
"Plug 'folke/tokyonight.nvim'
Plug 'bluz71/vim-nightfly-colors'

Plug 'Exafunction/codeium.vim'

call plug#end()

"macros for {}
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

"compilation/run programm binds
autocmd filetype cpp nnoremap <F8> :w <bar> !g++ % -o %:r<CR>
autocmd filetype cpp nnoremap <F9> :!./%:r<CR>
autocmd filetype cpp nnoremap <F10> :vsplit term://./%:r<CR>

autocmd filetype c nnoremap <F8> :w <bar> !gcc % -o %:r<CR>
autocmd filetype c nnoremap <F9> :!./%:r<CR>
autocmd filetype c nnoremap <F10> :vsplit term://./%:r<CR>

autocmd filetype python nnoremap <F9> :w <bar> !python3 %<CR>
autocmd filetype python nnoremap <F10> :w <bar> vsplit term://python %<CR>

autocmd filetype javascript nnoremap <F9> :w <bar> !node %<CR>
autocmd filetype javascript nnoremap <F10> :w <bar> vsplit term://node %<CR>

autocmd filetype java nnoremap <F8> :w <bar> !javac %<CR>
autocmd filetype java nnoremap <F9> :!java %:r<CR>
autocmd filetype java nnoremap <F10> :w <bar> vsplit term://java %<CR>

autocmd filetype go nnoremap <F9> :!go run %<CR>
autocmd filetype go nnoremap <F10> :w <bar> vsplit term://go run %<CR>

autocmd FileType python map <buffer> <F3> :call flake8#Flake8()<CR>

" open my terminal in new tab
nnoremap <C-T> :tabnew +term<CR>

" split window vertical
nnoremap <C-e> :vsplit<CR>

" webpage live preview in browser
" browsersync install: `npm install -g browser-sync`
nn <F6> <cmd>!browser-sync start --server --files "*.js, *.html, *.css"<CR>

" simple clear terminal tab
"nnoremap <C-T> :tabnew term://sh<CR>

" saving file by Ctrl+S
nnoremap <C-S> :w<CR>

" creating file templates (cpp,html)
autocmd BufNewFile *.cpp 0r ~/.config/nvim/template/template.cpp
autocmd BufNewFile *.html 0r ~/.config/nvim/template/template.html
autocmd BufNewFile *.c 0r ~/.config/nvim/template/template.c

" moving lines down/up
nnoremap <C-down> :move +1<CR>
nnoremap <C-up> :move -2<CR>

" pydocstring
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)

" toggle search highlight
nnoremap <C-i> :set hlsearch!<CR>

" tabulation in select mode on tab/shift-tab
vmap <Tab> >gv
vmap <S-Tab> <gv

" normal row numbers
set norelativenumber
set cursorline

" COLORSCHEMAS
" colorscheme gruvobx
"colorscheme gruvbox
"let g:airline_theme='gruvbox'

"colorscheme tokyonight
colorscheme nightfly

" colorscheme ayu
"set termguicolors     " enable true colors support
""let ayoucolor="light"
"let ayucolor="mirage" " for mirage version of theme
""let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

if (has("termguicolors"))
    set termguicolors
endif

lua require 'colorizer'.setup()

" visual feedback when text is edited (html)
let g:tagalong_verbose = 1

" python3 host prog
let g:python3_host_prog = expand('~/usr/bin/python3.11')

" NEDRCommenter
" comments on ctrl+/
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NERDTree (F2)
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusConcealBrackets = 1

nmap <F2> :NERDTreeToggle<CR>

" Open nerdtree window on opening Vim
" autocmd VimEnter * NERDTree

" Refresh the current folder if any changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"Reload the window if directory is changed
augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END

"Close nerdtree automatically if it is theonly window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Ignoring executable files in nerdtree
augroup NTStartup
    autocmd!
    autocmd VimEnter * call NERDTreeAddPathFilter('MyFilter')
augroup END
function! MyFilter(params)
    return a:params['path'].isExecutable
endfunction


" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" list of file extensions to ignore
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*

" Nerdtree config for wildignore
let NERDTreeRespectWildIgnore=1

"function! AirLineInit()
    "let g:airline_section_a = airline#section#create(['mode',' ','branch'])
    "let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
    "let g:airline_section_c = airline#section#create(['filetype'])
    "let g:airline_section_x = airline#section#create(['%P'])
    "let g:airline_section_y = airline#section#create(['%B'])
    "let g:airline_section_z = airline#section#create_right(['%l','%c'])
"endfunction
"autocmd VimEnter * call AirLineInit()

" Airline Themes
let g:airline_theme='transparent'
" Colors
let s:gray     = [245, '#3f4b59']
let s:darkgray = [245, '#1d1f21']
let s:golden   = [143, '#BBE67E']
let s:pink     = [131, '#F07178']
let s:blue     = [ 67, '#D4BFFF']
let s:orange   = [166, '#ffae57']
let s:outerfg  = [ 16, '#8d96a1']
let s:outerfgi = [ 16, '#2f3d4d']

" Backgrounds
let s:outerbg  = [ 16, 'NONE']
let s:innerbg  = [234, 'NONE']

" Normal mode
let s:N1 = [s:outerfg[1], s:outerbg[1], s:outerfg[0], s:gray[0]]
let s:N3 = [s:gray[1]   , s:innerbg[1], s:gray[0]   , s:innerbg[0]]

" Normal mode - modified
let s:NM1 = [s:darkgray[1], s:orange[1], s:darkgray[0], s:orange[0]]
let s:NM3 = [s:orange[1]  , s:outerbg[1], s:orange[0], s:darkgray[0]]

" Insert mode
let s:I1 = [s:darkgray[1], s:golden[1], s:outerfg[0], s:golden[0]]
let s:I3 = [s:golden[1]  , s:innerbg[1], s:golden[0], s:innerbg[0]]

" Visual mode
let s:V1 = [s:darkgray[1], s:pink[1], s:outerfg[0], s:pink[0]]
let s:V3 = [s:pink[1]    , s:innerbg[1], s:pink[0], s:innerbg[0]]

" Replace mode
let s:R1 = [s:darkgray[1], s:blue[1], s:outerfg[0], s:blue[0]]
let s:R3 = [s:blue[1], s:innerbg[1], s:blue[0], s:innerbg[0]]

" Inactive pane
let s:IA = [s:darkgray[1], s:outerbg[1], s:innerbg[0], s:innerbg[0]]
let s:IAc = [s:gray[1], s:outerbg[1], s:outerbg[0], s:outerbg[0]]

let g:airline#themes#transparent#palette = {}
let g:airline#themes#transparent#palette.accents = {
    \ 'red': ['#d70000', '', 160, '', '']}

let g:airline#themes#transparent#palette.inactive = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:IAc,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}

let g:airline#themes#transparent#palette.inactive_modified = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:NM3,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}

let g:airline#themes#transparent#palette.normal = {
    \ 'airline_a': s:N1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:N3}

let g:airline#themes#transparent#palette.normal_modified = {
    \ 'airline_a': s:NM1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:NM3}

let g:airline#themes#transparent#palette.insert = {
    \ 'airline_a': s:I1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:I3}
let g:airline#themes#transparent#palette.insert_modified = {}

let g:airline#themes#transparent#palette.replace = {
    \ 'airline_a': s:R1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:R3}
let g:airline#themes#transparent#palette.replace_modified = {}

let g:airline#themes#transparent#palette.visual = {
    \ 'airline_a': s:V1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:V3}
let g:airline#themes#transparent#palette.visual_modified = {}


" Warnings
let g:airline#themes#transparent#palette.normal.airline_warning = s:NM1

let g:airline#themes#transparent#palette.normal_modified.airline_warning =
    \ g:airline#themes#transparent#palette.normal.airline_warning

let g:airline#themes#transparent#palette.insert.airline_warning =
    \ g:airline#themes#transparent#palette.normal.airline_warning

let g:airline#themes#transparent#palette.insert_modified.airline_warning =
    \ g:airline#themes#transparent#palette.normal.airline_warning

let g:airline#themes#transparent#palette.visual.airline_warning =
    \ g:airline#themes#transparent#palette.normal.airline_warning

let g:airline#themes#transparent#palette.visual_modified.airline_warning =
    \ g:airline#themes#transparent#palette.normal.airline_warning

let g:airline#themes#transparent#palette.replace.airline_warning =
    \ g:airline#themes#transparent#palette.normal.airline_warning

let g:airline#themes#transparent#palette.replace_modified.airline_warning =
    \ g:airline#themes#transparent#palette.normal.airline_warning


" Errors
let g:airline#themes#transparent#palette.normal.airline_error = s:V1

let g:airline#themes#transparent#palette.normal_modified.airline_error =
      \ g:airline#themes#transparent#palette.normal.airline_error

let g:airline#themes#transparent#palette.insert.airline_error =
      \ g:airline#themes#transparent#palette.normal.airline_error

let g:airline#themes#transparent#palette.insert_modified.airline_error =
      \ g:airline#themes#transparent#palette.normal.airline_error

let g:airline#themes#transparent#palette.insert_modified.airline_error =
      \ g:airline#themes#transparent#palette.normal.airline_error
 
let g:airline#themes#transparent#palette.visual.airline_error =
      \ g:airline#themes#transparent#palette.normal.airline_error

let g:airline#themes#transparent#palette.visual_modified.airline_error =
      \ g:airline#themes#transparent#palette.normal.airline_error
 
let g:airline#themes#transparent#palette.replace.airline_error =
      \ g:airline#themes#transparent#palette.normal.airline_error

let g:airline#themes#transparent#palette.replace_modified.airline_error =
      \ g:airline#themes#transparent#palette.normal.airline_error

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" switching tabs <leader>+1/2
nnoremap <A-left> :bp<CR>
nnoremap <A-right> :bn<CR>

"close tab
nmap <A-w> :bd!<CR>

" Ultisnips
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" column for python
autocmd FileType python set colorcolumn=120

" coc config
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-clangd',
    \ 'coc-python'
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()


inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
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
nmap <F3> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
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

"sql
set nospell

" default was <C-C>, which is weird
let g:ftplugin_sql_omni_key = '<C-s>'
" default dialect
let g:sql_type_default = 'plsql'
" prefer exact match
let g:completion_matching_strategy_list = ['exact', 'substring']
" do not need case sensitivity here
let g:completion_matching_ignore_case = 1
" limit suggestion list
set pumheight=20

" dotenv wrapper
function! s:env(var) abort
  return exists('*DotenvGet') ? DotenvGet(a:var) : eval('$'.a:var)
endfunction

" Dbext

" default profiles
let g:dbext_default_profile_oracle = s:env('DATABASE_EXT')

" Dadbod

let b:db = s:env('DATABASE_URL')
" completion menu label
let g:vim_dadbod_completion_mark = ''
" use lower case where possible
let g:vim_dadbod_prefer_lowercase = 1
