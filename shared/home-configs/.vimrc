set nocompatible
call pathogen#helptags()
call pathogen#infect()


let g:syntastic_javascript_checkers=['eslint']
" leader key from \ => ,
let mapleader=","

let g:javascript_plugin_jsdoc=1

" Plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax on

"""""""""""""""""""""""""'
" Colors
""""""""""""'''
" Really like onedark, but wombat is better since it is easier to read in
" general
" wombat is also good, as is desert, and blackboard, but ones based on Atom are the best. 
" Might try monokai-black sometime too, for strong black background 
"

" FOR non-24bit color: 
" default will be either peachpuff or ron apparently. But changes when enter
" screen. I like both actually, but ron more since it's brighter
" badwolf or if not, ron, is best for java, since it supports some extra syntax highlighting
colorscheme ron
let g:lightline = {
  \ 'colorscheme': 'ron',
  \ }

" set colors to 256
set t_Co=256

" Mappings

" maps ,ev to open .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" maps ,sv to source .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" maps ; to :
nnoremap ; :
" clears search buffer when ,/
nmap <silent> ,/ :nohlsearch<CR>

let NERDTreeIgnore=[]
noremap <C-N> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" prevents arrow keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" movement keys allow wrapped line navigation
nnoremap j gj
nnoremap k gk

" maps pane navigation to shortcut 
" ctrl-w + j => ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" split panes down for vertical
" split panes right for horizontal
set splitbelow
set splitright

" Options
" Base Indenting Options (python and others can customize on their own)
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set autoindent 
set copyindent " copy the previous line's indent
" Buffer Options
set hidden " hides buffers when they are unsaved and a new buffer is opened
" Syntax Options
set showmatch " show matching paranthesis
" Search Options
set history=1000 " larger search history
set ignorecase " ignore case when searching
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set smartcase " ignore case if pattern is all lowercase only (NOTE not sure how this is different from ignorecase)

set backspace=indent,eol,start " backspace everything in insert
set number
set undolevels=1000 " larger undo history
set wildignore=*.swp " ignore swp files
set clipboard=unnamed " yank will copy to system clipboard

" I think pastetoggle and mouse aren't working
" scrolling isn't working right now either
set pastetoggle=<F5> " F5 in insert allows for pasting w/o indent
set mouse=a

filetype plugin indent on

" autocmd filtype <file_type> set <command>
" filetype specific commands
if has("autocmd")
  "" *.md should be markdown
  autocmd BufRead,BufNewFile *.md set filetype=mkd
  " autocmd VimEnter * IndentGuidesEnable

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on " TODO can remove? Already ran this command above

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80
  autocmd FileType html,xhtml,htmldjango,javascript,emblem setlocal sw=2 ts=2 tw=100
  autocmd FileType html,xhtml,htmldjango,javascript,emblem setlocal isk=@,48-57,_,192-255,-,$
  autocmd FileType less,coffee,jade,json setlocal sw=2 ts=2 tw=80
  autocmd BufRead,BufNewFile *.bayou setfiletype bayou
  autocmd BufRead,BufNewFile *.scala setfiletype scala
  autocmd FileType html,xhtml,htmldjango,javascript,emblem,coffee noremap <D-d> Odebugger<Esc>:w<Return>
  autocmd FileType python noremap <D-d> Oimport ipdb; ipdb.set_trace()<Esc>:w<Return>
  "autocmd FileType c,cpp,php,perl setlocal foldmethod=indent foldminlines=5 foldnestmax=5
  autocmd FileType go set noexpandtab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" python indenting
let g:pyindent_open_paren = 'shiftwidth()*2' " rather than *2
let g:pyindent_continue = 'shiftwidth()*2' " rather than *2

" Allows writing to files with root priviledges with :w!!
cmap w!! w !sudo tee % > /dev/null

" Some youCompleteMe stuff
"" turn off docs popup on delay. Just call :YcmCompleter GetDoc if I want them
let g:ycm_auto_hover = ""

"" with vim v. 8.2, this finally works and removes the colors on right side of
"" screen
set cc=""

"" turn off markdown folding, since it's annoying
set nofoldenable

