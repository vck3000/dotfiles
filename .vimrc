syntax on " Basic highlighting

set noerrorbells " No sound on error
set tabstop=2 softtabstop=2 " Tabs are 4 spaces long
set shiftwidth=2 " Shift tabs by 4 spaces 
set expandtab " Expand tabs into spaces 
set smartindent " Try to indent for me
set nu " Set line numbers
set nowrap " Don't wrap lines
set ignorecase " Required for the next command
set smartcase " Try to do case sensitive searching unless I use uppercase
set noswapfile " No swap files in the project
set nobackup " Don't keep backup because of undo directory
set undodir=~/.vim/undodir " Keep track of changes in a specific folder
set undofile " Tell vim to keep track of a separate undo file for each file
set incsearch " Incremental search
set showcmd " Show what command is being typed out
" set relativenumber
set hls "highlight search terms
set encoding=utf8
set hidden
set scrolloff=8
set sidescrolloff=16
set completeopt=menuone,noinsert,noselect

set cmdheight=2
set laststatus=2
set updatetime=300

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox' " Color scheme
Plug 'sainnhe/sonokai'
Plug 'jremmen/vim-ripgrep' " Fast vim grepping 
Plug 'tpope/vim-fugitive' " For git integration - blames, diffs, logs...
Plug 'vim-utils/vim-man' " See man pages from within vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy find 
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mbbill/undotree' " Undo tree...
Plug 'tpope/vim-commentary' " Easy comments
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kana/vim-submode' " submodes for resizing

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' " Markdown syntax

Plug 'junegunn/limelight.vim' " Dims inactive paragraphs
Plug 'junegunn/goyo.vim' " Distraction free writing
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
let g:mkdp_markdown_css = expand('~/.vim/github-markdown.css')
let g:mkdp_highlight_css = expand('~/.vim/gruvbox-dark.css')
let g:mkdp_auto_close = 0

" Plug 'pandysong/ghost-text.vim' " Linking with the browser ghost text

" Javascript syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'

" Svelte
Plug 'evanleck/vim-svelte'
" Svelte context filetype so commenting works
Plug 'Shougo/context_filetype.vim'

" Quality of life
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'

" ThePrimeagen
Plug 'ThePrimeagen/vim-be-good'

Plug 'rhysd/vim-clang-format' " C++ auto format
Plug 'octol/vim-cpp-enhanced-highlight' " Syntax highlighting

" Flutter related stuff
Plug 'dart-lang/dart-vim-plugin'

" Latex
Plug 'lervag/vimtex'

" CSV files
Plug 'mechatroner/rainbow_csv'

call plug#end()

let g:coc_global_extensions = [
\ 'coc-clangd',
\ 'coc-cmake', 
\ 'coc-css',
\ 'coc-eslint',
\ 'coc-git', 
\ 'coc-json',
\ 'coc-python',
\ 'coc-prettier',
\ 'coc-tsserver',
\ 'coc-yaml',
\ ]

" Clangd auto format on save for cpp files
autocmd FileType cpp :ClangFormatAutoEnable
let g:clang_format#style_options = {
      \ "BasedOnStyle": "Google",
      \ "BreakBeforeBraces": "Stroustrup" }


" vim-airline stuff
let g:airline_powerline_fonts = 1

" vimtex pdf viewer
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" Colour schemes
set background=dark
" colorscheme gruvbox
colorscheme sonokai
" Set transparent background
" autocmd VimEnter * hi Normal ctermbg=none

" Tmux colours
set t_Co=256

" 80 column marker
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Extra config for plugins

" Allows rg to alway detect the root and to search for the git root
" and also use gitignore during searching
if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " " " Set leader to space bar

" Switch between header and source files for c
nnoremap <leader>a :CocCommand clangd.switchSourceHeader<CR>

" Netrw config
" let g:netrw_browse_split=2 " Open files in 2nd tab??
let g:netrw_banner = 0 " turn off top preview?
let g:netrw_winsize = 25 " Window size about 25%
let g:netrw_keepdir=0 " Helps with copying files?
let g:netrw_browse_split = 4

" Markdown CSS
" Open all code folds
autocmd FileType markdown normal zR 
autocmd FileType markdown :set wrap
autocmd FileType markdown :set linebreak

" Tex
autocmd FileType tex :set wrap
autocmd FileType tex :set linebreak

" Remaps
" Jump between windows easily
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>w :w<CR>
" Save file without formatting
nnoremap <leader>e :noa w<CR>

" Get up ripgrep ready to Project Search
nnoremap <leader>ps :Rg<SPACE>

" Remap j and k to go visual lines instead of whole lines
noremap k gk
noremap j gj

call submode#enter_with('grow/shrink', 'n', '', '<leader>J', '<C-w>+')
call submode#enter_with('grow/shrink', 'n', '', '<leader>K', '<C-w>-')
call submode#map('grow/shrink', 'n', '', 'J', '<C-w>+')
call submode#map('grow/shrink', 'n', '', 'j', '<C-w>+')
call submode#map('grow/shrink', 'n', '', 'K', '<C-w>-')
call submode#map('grow/shrink', 'n', '', 'k', '<C-w>-')

call submode#enter_with('grow/shrink', 'n', '', '<leader>L', '<C-w>>')
call submode#enter_with('grow/shrink', 'n', '', '<leader>H', '<C-w><')
call submode#map('grow/shrink', 'n', '', 'L', '<C-w>>')
call submode#map('grow/shrink', 'n', '', 'l', '<C-w>>')
call submode#map('grow/shrink', 'n', '', 'H', '<C-w><')
call submode#map('grow/shrink', 'n', '', 'h', '<C-w><')

" don't consume submode-leaving key
let g:submode_keep_leaving_key = 1

" Clear highlighting words after search
nnoremap <leader>c :noh<CR>

" Yank to clipboard
noremap <leader>y "+y

" List buffers
nnoremap <leader>b :Buffers<CR>

" coc.nvim remaps
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>gN <Plug>(coc-diagnostic-prev)
nmap <leader>gc <Plug>(coc-git-chunkinfo)
nmap <leader>gn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
" remap to prevent floating windows on C-c
inoremap <C-c> <Esc><Esc>
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Tab and S-Tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" <CR> to accept the current selected suggesiton
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" <CR> accepts the current suggestion even if no suggestion is highlighted
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
endif

" fugitive (git)
nmap <leader>gj :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>

" FZF search
nnoremap <C-p> :GFiles<Cr>
nnoremap <leader>o :Files<Cr>

" Nerdtree
nnoremap <leader>pv :NERDTreeToggle<CR>
" Open up with current directory at the open buffer/file
nnoremap <leader>po :NERDTreeToggle %<CR>
" Open up to the buffer/file
nnoremap <leader>pf :NERDTreeFind<CR>


" leader p to set into paste mode
nmap <leader>pa :setlocal paste! paste?<cr>

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

" Svelte context filetype so commenting works correctly
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif

let g:context_filetype#filetypes.svelte =
\ [
\   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
\   {
\     'filetype': 'typescript',
\     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
\     'end': '',
\   },
\   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
\ ]

let g:ft = ''

" Start up v5 warning
let g:coc_disable_startup_warning = 1
