call plug#begin()
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'nanotech/jellybeans.vim'
Plug 'ap/vim-buftabline'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Valloric/YouCompleteMe'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'jlanzarotta/bufexplorer'
Plug 'rbgrouleff/bclose.vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vimlab/split-term.vim'
Plug 'sebdah/vim-delve'
Plug 'myusuf3/numbers.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
call plug#end()

filetype plugin indent on

"Colors
syntax enable
colorscheme jellybeans
set background=dark

filetype plugin on

:set ww+=<,> 

let g:tmux_navigator_no_mappings = 1
"Switch between windows
nnoremap <silent> <A-Up> :TmuxNavigateUp<CR>
nnoremap <silent> <A-Down> :TmuxNavigateDown<CR>
nnoremap <silent> <A-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <A-Right> :TmuxNavigateRight<CR>

let g:tmux_resizer_no_mappings = 1

nnoremap <silent> <S-Left> :TmuxResizeLeft<cr>
nnoremap <silent> <S-Down> :TmuxResizeDown<cr>
nnoremap <silent> <S-Up> :TmuxResizeUp<cr>
nnoremap <silent> <S-Right> :TmuxResizeRight<cr>


"Switch between tabs
nnoremap <C-S-Left> :wincmd H<CR>
nnoremap <C-S-Right> :wincmd L<CR>
nnoremap <C-S-Up>  :wincmd K<CR>
nnoremap <C-S-Down> :wincmd J<CR>
nnoremap <F28>    :Bclose<CR>

"Copy/paste to system
vmap <C-x> "+x
vmap <C-c> "+y
imap <C-v> "+gP

"Saving buffers
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>i


"Commenter
vmap <C-_> <Plug>NERDCommenterToggle
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1


"NerdTree
:set mouse=a
let g:NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='t'
let g:nerdtree_tabs_open_on_console_startup=1
nmap <C-n>  :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

"vim-go
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_gofmt_autosave = 1
nmap <C-LeftMouse> :GoDef<CR>
imap <C-LeftMouse> <ESC>:Godef<CR>

"Autocomplete
set completeopt-=preview

"Sessions saving
let g:session_directory="~/.vim/sessions"
let g:session_autosave = 'no'

function! OpenBuffer() 
    let c = 0
    let wincount = winnr('$')
    while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
        exec 'wincmd w'
        let c = c + 1
    endwhile 
    exec 'BufExplorer'
endfunction 
noremap <silent> <C-b> :call OpenBuffer()<CR>

hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=black
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1

"Terminals
nnoremap <S-t> :Term <CR>
tnoremap <Esc> <C-\><C-n>
" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~").">", "\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\.\)\+> '

set nopaste
set tabstop=4
set shiftwidth=4
set expandtab
set backupcopy=yes
