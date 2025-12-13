" Use Vim defaults instead of Vi ones
set nocompatible 

" Leader
let mapleader=" "

" Basic Settings for Better Looking
" set number
set norelativenumber " Disable relative line numbers
" set cursorline

" Easy Save, Quit and Source
map W :w<CR>
map Q :q<CR>
map D :q!<CR>
map R :source $MYVIMRC<CR>

 
" Indentation
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Smooth Scrolling 
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l

" Enable move across lines with h,l
set whichwrap+=h,l

" Search Settings
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
nnoremap <LEADER><CR> :nohlsearch<CR>

" Set tags file search path
set tag=./tags,../tags,../../tags,../../../tags

" Window Splitting Behavior
set splitright
set splitbelow
cnoreabbrev vr vertical resize
nnoremap z <C-w>w
nnoremap r <C-w>r
nnoremap <left> :vertical resize -5<CR>
nnoremap <right> :vertical resize +5<CR>
nnoremap <up> :resize -2<CR>
nnoremap <down> :resize +2<CR>



" Auto return to last edit position when opening a file
autocmd BufReadPost *
	    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
		\ |   exe "normal! g`\""
        \ | endif


" Clipboard Integration
vnoremap <leader>y "+y
nnoremap <leader>p "+p

nnoremap <leader>sp :set paste<CR>
nnoremap <leader>np :set nopaste<CR>


" =================================== Plugin Manager ===================================
call plug#begin()

" List your plugins here
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ycm-core/YouCompleteMe'
Plug 'lervag/vimtex'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'wakatime/vim-wakatime'
Plug 'github/copilot.vim'

call plug#end()




" =================================== Plugin Configurations ===================================
"
" --------------------------------------Snazzy -----------------------------------------
let g:SnazzyTransparent = 1
color snazzy

" ------------------------------------- vimtex --------------------------------------
let g:vimtex_compiler_method = 'latexmk'
" let g:vimtex_view_method = 'zathura'
" let g:vimtex_quickfix_mode = 0
let maplocalleader = " "
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}


" ------------------------------------- markdown -------------------------------------
let g:mkdp_auto_start = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = 'firefox'
let g:mkdp_auto_close = 0
nnoremap <C-p> :MarkdownPreviewToggle<CR>


" ------------------------------------- Airline ---------------------------------------
let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#ale#enabled = 0
" let g:airline#extensions#syntastic#enabled = 0
" let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#branch#enabled = 0
" let g:airline#extensions#hunks#enabled = 0
" let g:airline_section_a = airline#section#create(['mode'])
" let g:airline_section_b = '%f'
" let g:airline_section_c = ''
" let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L : %c %p%%'



" ------------------------------------- NERDTree ---------------------------------------
nnoremap tt :NERDTreeToggle<CR>
nnoremap tf :NERDTreeFind<CR>

" ------------------------------------- nerdtree-git -------------------------------------
let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'✹',
			\ 'Staged'    :'✚',
			\ 'Untracked' :'✭',
			\ 'Renamed'   :'➜',
			\ 'Unmerged'  :'═',
			\ 'Deleted'   :'✖',
			\ 'Dirty'     :'✗',
			\ 'Ignored'   :'☒',
			\ 'Clean'     :'✔︎',
			\ 'Unknown'   :'?',
			\ }

" --------------------------------------- YCM ------------------------------------------ 
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_hover_delay = 0
let g:ycm_auto_hover = 0
let g:ycm_clangd_binary_path = "/usr/bin/clangd-20"

" -------------------------------------- Copilot ---------------------------------------
" Copilot 其他快捷键
inoremap <C-j> <Plug>(copilot-next)
inoremap <C-k> <Plug>(copilot-previous)
inoremap <C-\> <Plug>(copilot-suggest)

" ----------------------------------- vim-easy-align -----------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


