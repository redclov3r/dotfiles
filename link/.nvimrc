"====================================================================================================
" neovim configuration
"
" for old full configuration as reference see
" https://github.com/redclov3r/dotfiles/blob/23c24f1099c85fa94a36dffbbea0dfa7ca773e24/link/.nvimrc
"
" Contents:
" 1. Plugins
" 2. General_Settings
" 3. Keymappings
" 4. Plugin_Settings
"
"====================================================================================================

"====================================================================================================
" # Plugins
"====================================================================================================

" vim-plug for plugins
call plug#begin("~/.nvim/bundle")

" General
Plug 'tpope/vim-sensible'

" Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'mhinz/vim-startify'

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Filesystem
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Editing - General
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/bufkill.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'

" Editing - Writing
Plug 'junegunn/goyo.vim'

" Editing - Filetypes
Plug 'sheerun/vim-polyglot'
Plug 'dag/vim-fish'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

"====================================================================================================
" # General_Settings
"====================================================================================================

" allow unsaved files
set hidden 

" Enable Mouse support
set mouse=a

" colors
colorscheme gruvbox

" Basic editing settings
set tabstop=4     " a tab is four spaces
set softtabstop=4 " 4 spaces as a tab for bs/del
set backspace=2   " Backspace over anything! (Super backspace!)
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set cindent       " apply the C indenting rules
set nosmartindent
set number        " always show line numbers
set cursorline    " highlight current line
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set matchtime=2   " For .2 seconds
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set expandtab     " spaces instead of tabs
filetype plugin indent on     " required!


"====================================================================================================
" # Keymappings
"====================================================================================================

" change the mapleader to ,
let mapleader=","
let maplocalleader=";"

" make :W map to :w
:command! W w

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" work more logically with wrapped lines
noremap j gj
noremap k gk

" Navigate in Buffers
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

"----------------------------------------------------------------------------------------------------
" Plugin Shortcuts
"----------------------------------------------------------------------------------------------------
noremap <leader>m :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeFind<CR>
noremap <leader>g :Goyo<CR>
nmap <C-p> :GFiles<CR>
nmap <C-t> :Files<CR>


"====================================================================================================
" # Plugin_Settings
"====================================================================================================


"----------------------------------------------------------------------------------------------------
" Airline
"----------------------------------------------------------------------------------------------------

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline_section_z = '%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3v 0x%B' 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"----------------------------------------------------------------------------------------------------
" coc
"----------------------------------------------------------------------------------------------------

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"
" *Note*: patch detection did not work properly. This is why the whole `if`
" construct is commented

" if has('patch-8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
  " imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


let g:coc_filetype_map = {
\ 'html.twig': 'html',
\ }

let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-lists',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-highlight',
\ 'coc-angular',
\ 'coc-markdownlint'
\ ]
