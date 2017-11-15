set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'godlygeek/tabular'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'henrik/vim-ruby-runner'
Plugin 'kien/ctrlp.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'msanders/snipmate.vim'
Plugin 'rking/ag.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-cucumber'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-surround'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/matchit.zip'
Plugin 'ahw/vim-pbcopy'
Plugin 'elzr/vim-json'
Plugin 'elmcast/elm-vim' 

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" trying to fix sluggishness
let g:loaded_matchparen = 1 "disables matchparen.vim, which ships with vim and is incredibly slow
let loaded_matchparen = 1

if has("gui_running")
  set re=1 
endif
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set synmaxcol=128
xnoremap p pgvy

set complete-=i

" Clear old autocmds in group so we don't get warnings
autocmd!

"General behavior
set nocompatible
behave xterm

set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","

" Easily transpose lines
map <C-J> ddp
map <C-K> ddkP

" vertical line indentation
let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#09AA08'
"let g:indentLine_char = '┆'


if has("gui_running")
  set guioptions=egmrt "hide macvim gui
  set guifont=Monaco:h18
  set background=dark
  colorscheme solarized
else
  set background=dark
  colorscheme solarized
  "let g:solarized_visibility = "high"
  "let g:solarized_contrast = "high"
  "let g:solarized_termcolors = 16
  "let g:solarized_termtrans = 1
endif


" Sane spacing and tabs
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab


"Set what Vim thinks of as keywords.  Used when searching and moving
set isk+=_,$,@,%,#,- 


"no error signals
set noerrorbells
set visualbell t_vb=


"General settings that make Vim awesome
filetype plugin indent on
syntax on 
set  dictionary="/usr/dict/words"
set wildmode=list:longest,full " Better completion
set wildmenu
set ruler
set autoread " auto read file if it has changed outside of vim
set history=500 " 100 lines of command line history
set scrolloff=3 "when scroll down start at last 3 lines
set hidden  "better handling of background buffers
set backspace=indent,eol,start  " Make backspace delete lots of things
set showcmd " show partial commands in bottom line

"I rarely use folds 
set nofoldenable 


"set vim to use a central backup dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" window behavior
set splitbelow  " Open new horizontal split windows below current
set splitright  " Open new vertical split windows to the right
set switchbuf=useopen ",usetab,split  " Don't change current buffer on quickfix
set winminheight=1  " 1 height windows


"Status bar
set laststatus=2 "always show status
set showmode    "show current mode down the bottom
"set statusline=%<%f\ %h%m%r%{rvm#statusline()}%=%-14.(%l,%c%V%)\ %P


"Linenumbers
set number
"highlight LineNr term=bold cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=DarkRed guibg=NONE

"Highlight any characters after the 80 column marker
"highlight OverLength ctermbg=red ctermfg=white guibg=DarkRed
"match OverLength /\%81v.\+/

"show the 100-column width line
set colorcolumn=101

" A nice, minimalistic tabline in CLI Vim
hi TabLine cterm=bold,underline ctermfg=8 ctermbg=0
hi TabLineSel cterm=bold ctermfg=0 ctermbg=7
hi TabLineFill cterm=bold ctermbg=0


"Shortcuts for common tasks
command! Q q " Bind :Q to :q.

"Make semicolon work as colon so you don't have to push shift 
"for common actions
map ; :
"Two semicolons == semicolon
noremap ;; ;


"Make Y consistent with other cap letters (D, C)
nnoremap Y y$


" keep the visual selection active after indenting.
vmap > >gv
vmap < <gv


"Want to be able to open cmdline window buffer (normally C-F)
"but still have C-F be <Right>
set cedit=<C-Y>


command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e

" Searching Stuff
" I prever very magic (\v) search behavior
nnoremap / /\v
vnoremap / /\v
set hlsearch "set hl search
set incsearch "set incsearch
set ignorecase "set ignore case for search
set smartcase "be case sensitive if search has cap letter
set gdefault " /g flag on :s substitutions to replace all matches in a line:
nnoremap <leader><space> :noh<cr>  " remove highlight from search matches


" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
" (thanks Douglas Potts)
if has("unix")
  map ,e :e <C-R>=expand("%:p:h") . '/'<CR>
else
  map ,e :e <C-R>=expand("%:p:h") . '\'<CR>
endif

"save as sudo
cmap w!! %!sudo tee > /dev/null %


" select xml text to format and hit ,x
vmap <leader>x :!tidy -q -i -xml<CR> 
" select json text to format and hit ,j
vmap <leader>j  :!python -m json.tool<CR>

" automatically format (indent) xml, html
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
au FileType html exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" run selection in bash
vmap <leader>rs :!bash <CR>

" Shortcut for switching to 'special' buffers that start with -
" This is an experiment in my workflow to see if having renamed (:f new_name)
" buffers like -server, -specs, -log -tail, etc... works well for me.
nmap <leader>bs :b -

nmap <leader>T :tabnew <CR>

"make it easy to source and load vimrc
nmap <Leader>ve :e ~/.vim/vimrc<cr>
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost $HOME/.vim/vimrc source $HOME/.vim/vimrc
endif


"Ctags make the world a better place
"Based on code from https://github.com/spicycode/Vimlander-2-The-Quickening
" Add RebuildTagsFile function/command
function! s:RebuildTagsFile()
  silent !ctags -R --exclude=coverage --exclude=files --exclude=log --exclude=tmp --exclude=vendor *
endfunction
command! -nargs=0 RebuildTagsFile call s:RebuildTagsFile()

set tags=./tags;
map <Leader>rt :RebuildTagsFile<cr>

"""""""" NERDTree: 
" much of this is from http://github.com/spicycode/Vimlander-2-The-Quickening
map <Leader>d :NERDTreeToggle<CR> :set number<CR>
" Enable nice colors
let NERDChristmasTree = 1
" Make it easy to see where we are
let NERDTreeHighlightCursorline = 1
" Make bookmarks visible
let NERDTreeShowBookmarks = 1
" Show hidden files
let NERDTreeShowHidden = 1
" Don't hijack NETRW
"let NERDTreeHijackNetrw = 0
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\.$', '\~$']

"Syntastic.  Awesome syntax error checking for js, ruby, etc...
let g:syntastic_enable_signs=1 "show markers next to each error/warning
let g:syntastic_auto_loc_list=0 "don't pop up the Errors list automatically

" Find open file in NERDTree
map <leader>f :NERDTreeFind<cr>

" turn off syntastic...make it toggleable 
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

imap <C-e> <Esc>
nmap <C-e> i

set t_Co=256

function! MakeRspecFileIfMissing()
ruby << EOF
  class MakesRspecFileIfMissing
    def self.for(buffer)
      if spec_file?(buffer) || already_exists?(spec_for_buffer(buffer))
        puts "Spec already exists"
        return
      end

      # puts "going to make #{directory_for_spec(buffer)}"
      # puts "going to make #{spec_for_buffer(buffer)}"
      system 'mkdir', '-p', directory_for_spec(buffer)
      File.open(spec_for_buffer(buffer), File::WRONLY|File::CREAT|File::EXCL) do |file|
        file.write "require 'spec_helper'"
      end
    end

    private
    def self.spec_file?(file)
      file.match(/.*_spec.rb$/)
    end

    def self.already_exists?(b)
      File.exists?(b)
    end

    def self.spec_for_buffer(b)
      spec_buffer = b.sub('/app/', '/spec/')
      spec_buffer.sub!('/lib/', '/spec/lib/')
      spec_buffer.sub!('.rb', '_spec.rb')
      return spec_buffer
    end

    def self.directory_for_spec(b)
      File.dirname(self.spec_for_buffer(b))
    end
  end
  buffer = VIM::Buffer.current.name
  MakesRspecFileIfMissing.for(buffer)
EOF
endfunction
map <leader>s :call MakeRspecFileIfMissing()<CR> :A<CR>
map <leader>S :call MakeRspecFileIfMissing()<CR> :AT<CR>
