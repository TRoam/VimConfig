syntax on
syntax enable
set number
set ruler
" set mouse=a
set ignorecase
set hls
set noswapfile

set background=dark
set nocompatible 
set wildmenu
let mapleader = ","
set clipboard=unnamed
"--------------------------color theme-------------------
filetype off


"NERDTree config
source ~/.vim/config/nerdtree
let g:nerdtree_tabs_autofind = 1 
let g:nerdtree_tabs_startup_cd =1 
let g:nerdtree_tabs_focus_on_files =1


" syntastic
source ~/.vim/config/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javasctipt_checkers = ['jshint']
  

" Set syntax highlighting for specific file types ----------------------------
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
      


 " Color scheme
set t_Co=256
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
"colorscheme  m olokai
colorscheme solarized

if exists('$TMUX')
  set term=screen-256color
endif

"-------------------------------ctrlsf config --------------------------------
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '50%'
nnoremap <Leader>fp :CtrlSF<CR>

"--------------------------------ag ack earuch ------------------------------
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ag_working_path_mode="r"

"--------------------------- snippets ---------------------------------------
let g:UltiSnipsExpandTrigger="<``>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



"--------------------------- multi cursor ------------------------------------
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
map <F6> :TagbarToggle<CR>

"Git Vim
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness

"ag search 
if executable('ag')
 " Use Ag over Grep
 set grepprg=ag\ --nogroup\ --nocolor
" Use ag in CtrlP for listing files.
 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
 let g:ctrlp_use_caching = 0
endif

"layout 
" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5
   
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
   
" Display extra whitespace
set list listchars=tab:»·,trail:·
     
" Make it obvious where 80 characters is
set textwidth=160
set colorcolumn=+10

"minibufexpl.vim
map <Tab> :MBEbn<cr>
map <S-Tab> :MBEbp<cr>

" Numbers
set number
set numberwidth=5
       
set matchpairs+=<:>
set hlsearch

"close search 
nmap <silent><Leader>/ :silent noh<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <Leader>q :q<cr>
nnoremap <Leader>w :w<cr>
" Highlight current line
au WinLeave * set nocursorline 
au WinEnter * set cursorline 
set cursorline 

"--------------------------replace ----------------------------
"confirm: confirm one by one before replace 
"wholeword : if wholeword
"replace : string 
function! Replace(confirm,wholeword,replace)
  wa
  let flag = ''
  if a:confirm
    let flag .= 'gec'
  else
    let flag .= 'ge'
  endif
  let search = ''
  if a:wholeword 
    let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
  else
    let search .= expand('<cword>')
  endif
  let replace = escape(a:replace, '/\&~')
  execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
"not sure ,not wholeword
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
"not sure , wholeword
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
"sure, not wholeword
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
"sure, wholeword
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

"------------------------------Plugin lists----------------------
" Plugin lists`
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle
Plugin 'gmarik/Vundle.vim'

" Lauguage syntax 
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'juvenn/mustache.vim'
Bundle 'Blackrush/vim-gocode'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'dgryski/vim-godef'
Bundle 'elixir-lang/vim-elixir'


"plugins
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rking/ag.vim'

"snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" autocomplete
Plugin 'Valloric/YouCompleteMe'
" Plugin 'ternjs/tern_for_vim'

" Html helper
Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'

"Tmux
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()




filetype plugin indent on
