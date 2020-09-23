syntax on " Basic highlighting

set noerrorbells " No sound on error
set tabstop=2 softtabstop=2 " Tabs are 4 spaces long
set shiftwidth=2 " Shift tabs by 4 spaces
set expandtab " Expand tabs into spaces
set smartindent " Try to indent for me
set nu " Set line numbers
set nowrap " Don't wrap lines
set smartcase " Try to do case sensitive searching unless I use uppercase
set noswapfile " No swap files in the project
set nobackup " Don't keep backup because of undo directory
set undodir=~/.vim/undodir " Keep track of changes in a specific folder
set undofile " Tell vim to keep track of a separate undo file for each file
set incsearch " Incremental search
set showcmd " Show what command is being typed out
set relativenumber
set hls "highlight search terms
set encoding=utf8


set cmdheight=2
set laststatus=2
set updatetime=300

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox' " Color scheme
Plug 'jremmen/vim-ripgrep' " Fast vim grepping 
" Plug 'tpope/vim-fugitive' " For git integration - blames, diffs, logs...
Plug 'vim-utils/vim-man' " See man pages from within vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy find 
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree' " Undo tree...
Plug 'tpope/vim-commentary' " Easy comments
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Markdown
Plug 'plasticboy/vim-markdown' " Markdown syntax
Plug 'junegunn/limelight.vim' " Dims inactive paragraphs
Plug 'junegunn/goyo.vim' " Distraction free writing
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Plug 'pandysong/ghost-text.vim' " Linking with the browser ghost text

" Javascript syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'

" Quality of life
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ThePrimeagen
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

Plug 'rhysd/vim-clang-format' " C++ auto format

" Flutter related stuff
Plug 'dart-lang/dart-vim-plugin'

call plug#end()

" Clangd auto format on save for cpp files
autocmd FileType cpp :ClangFormatAutoEnable
let g:clang_format#style_options = {
      \ "BasedOnStyle": "Google",
      \ "BreakBeforeBraces": "Stroustrup" }


" vim-airline stuff
let g:airline_powerline_fonts = 1

" Colour schemes
set background=dark
colorscheme gruvbox
" Set transparent background
autocmd VimEnter * hi Normal ctermbg=none

" Tmux colours
set t_Co=256

" Use markdown Github css styles
let g:mkdp_markdown_css = expand('~.vim/github-markdown.css')

" 80 column marker
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

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
autocmd FileType markdown match OverLength /\%9999v.\+/ " Don't show in md files

" Remaps
" Jump between windows easily
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
" Get up ripgrep ready to Project Search
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Clear highlighting words after search
nnoremap <leader>c :noh<CR>

" coc.nvim remaps
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>gN <Plug>(coc-diagnostic-prev)
nmap <leader>gn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
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

" coc.nvim prettier
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" nnoremap <leader>f :Prettier<CR>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" FZF search
nnoremap <C-p> :GFiles<Cr>
nnoremap <leader>o :Files<Cr>

nnoremap <leader>pv :NERDTreeToggle<CR>

" leader p to set into paste mode
nmap <leader>p :setlocal paste! paste?<cr>
