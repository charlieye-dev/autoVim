"""""""""""""""""""""""""""
"Base setup
"""""""""""""""""""""""""""
set nu  "display the number of every line
set ruler   " show the cursor position all the time
set tabstop=4
set hlsearch
set noignorecase
"show pwd
noremap <C-p> :pwd<CR>
"highlight WhitespaceEOL ctermbg=red guibg=red
"match WhitespaceEOL /s\s\+$/

"""""""""""""""""""""""""""
"BufExplorer
"""""""""""""""""""""""""""
map bo :BufExplorer<CR>
map bt :ToggleBufExplorer<CR>
map bs :BufExplorerHorizontalSplit<CR>
map bv :BufExplorerVerticalSplit<CR>
"let g:bufExplorerSplitRight=1
"switch buffer
nmap bn :bn<CR>
nmap bp :bp<CR>

"""""""""""""""""""""""""""
"NERDTree
"""""""""""""""""""""""""""
noremap to :NERDTree<CR>
noremap tq :NERDTreeClose<CR>
noremap tp :NERDTreeFind<CR>
"noremap tt :NERDTreeToggle<CR>

"""""""""""""""""""""""""""
"languge
"""""""""""""""""""""""""""
if has("multi_byte")
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
        set ambiwidth=double
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif  " UTF-8

""""""""""""""""""""""""""""""
" Ctags setting
""""""""""""""""""""""""""""""
set tags=tags;
set autochdir
"auto creat tags
"map <F4> :call Ctags()<CR>
"func! Ctags()
"exec "w"
"exec "!ctags -R ."
"endfunc

""""""""""""""""""""""""""""""
" Tlist setting
""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"map <F2> :call Tlist()<CR>
map tl :call Tlist()<CR>
func! Tlist()
exec "TlistToggle"
endfun

"""""""""""""""""""""""""""
"winwanager
"""""""""""""""""""""""""""
"let g:winManagerWindowLayout='BufExplorer'
"nmap wm :WMToggle<cr>

"""""""""""""""""""""""""""
"grep
"""""""""""""""""""""""""""
nnoremap <silent> <F3> :Grep<CR>


"""""""""""""""""""""""""""
"c\h
"""""""""""""""""""""""""""
nnoremap <silent> <F12> :A<CR>

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
"if filereadable("./filenametags")
"    let g:LookupFile_TagExpr = '"./filenametags"'
"endif

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
