set number
set ruler
syntax on


imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>


" Shift + tab for command mode
nnoremap <S-Tab> <<
" Shift + tab for insert mode
inoremap <S-Tab> <C-d>
" Vim already has built-in key commands for inset mode.
" Ctrl-t: Shift right (mnemonic "tab")
" Ctrl-d: Shift left (mnemonic "de-tab")

" 如同vscode中的ctrl + y.  
nnoremap r <Cmd>redo<CR>

" ;q = :q 
noremap <silent> ;q :q<CR>
" ;w = ;w
nnoremap <silent> ;w :update<CR>
" ;wq = :wq
nnoremap <silent> ;wq :update \| :q<CR>

" 將//映射為取消搜索高亮的快捷鍵
nnoremap // :noh<CR>



";f formats in normal mode
"gg=G意思是對齊程式碼
noremap <silent> ;f gg=G<CR>

" default file encoding
set encoding=utf-8

" rainbow parens
let g:rainbow_active = 1


" Colorscheme
set termguicolors
let g:gruvbox_contrast_dark='hard'  "origin:dark
let g:gruvbox_contrast_light='hard' "origin:hard 
colorscheme gruvbox   
hi LspCxxHlGroupMemberVariable guifg=#83a598

"当 laststatus 设置为值 2 时，将显示一个永久性的状态栏，
"无论当前窗口是否拆分成多个分屏。状态栏通常位于编辑器的底部，
"提供有关文件和编辑器状态的信息。
set laststatus=2

set nobackup

" Mouse support
set mouse=a

set t_Co=256

" automatically read on change
set autoread

" 三行code是Tab 鍵的寬度設置為四個空格：
set tabstop=4
set shiftwidth=4
set expandtab

set updatetime=100


" Use ripgrep as grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow


let g:python3_host_prog="/usr/local/bin/python3"
" C-p: FZF find files
" 按下 Ctrl+p 時，它將執行 :Files 命令
nnoremap <silent> <C-p> :Files<CR>
" C-g: FZF ('g'rep)/find in files
nnoremap <silent> <C-g> :Rg<CR>
" 在 Vim 的編輯窗口中啟用符號欄（sign column）
" 符號欄是位於 Vim 窗口右側的一個窄列，用於顯示各種符號，例如錯誤、警告、書籤等。
" 這些符號可以是特定插件或語法檢測器添加的，通常用於標記程式碼中的問題或重要的位置。
set signcolumn=yes



autocmd BufRead,BufNewFile *.c setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.h setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.cpp setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.hpp setlocal colorcolumn=80

au FileType text set colorcolumn=80

set wrap


" Highlight search results
set hlsearch
set incsearch


au FileType text set colorcolumn=80


set foldlevelstart=99




" show syntax group of symbol under cursor
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc





set nocompatible


" ;t is trim
nnoremap ;t <silent> :Trim<CR>

" Function to trim extra whitespace in whole file
function! Trim()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun




" Alt + 移動當前行向上 可改成 <M-UP> 
nnoremap <M-UP> :move-2<CR>==      
vnoremap <M-UP> :move '<-2<CR>gv=gv

" Alt + 下箭頭移動當前行向下
nnoremap <M-Down> :move+<CR>==
vnoremap <M-Down> :move '>+1<CR>gv=gv

au FileType c nnoremap <silent> ;m :VimuxRunCommand "make"<CR>
au FileType cpp nnoremap <silent> ;m :VimuxRunCommand "make"<CR>

" 使用vimux一鍵執行c、cpp、python。注意"gcc " 一定要有空格
au Filetype c nnoremap <silent> ;r :VimuxRunCommand("gcc " . bufname("%") . " && ./a.out")<CR>
au Filetype cpp nnoremap <silent> ;r :VimuxRunCommand("g++ " . bufname("%") . " && ./a.out")<CR>
au Filetype python nnoremap <silent> ;r :VimuxRunCommand("python3 " . bufname("%"))<CR>

" 註解
hi comment gui=bold
"字串、標頭檔名稱
hi String gui=bold
" bold C/C++ Include  
hi link Include GruvboxAquaBold  " origin: GruvboxAquaBold`
" typedef 、return 、struct etc
hi link Keyword GruvboxRedBold 
" 數字
hi link number GruvboxPurpleBold
" 使 #define 設為粗體 
hi link Define GruvboxAquaBold
" 變數名稱變粗體
hi link @variable GruvboxBlueBold
" 資料型態變粗體
hi link @type GruvboxYellowBold 
" Bold namespace like std etc.
hi link @namespace GruvboxAquaBold
" Bold if else statment
hi link @conditional GruvboxRedBold
" 使結構體的變數為粗體
hi link @property GruvboxAquaBold
"使preprocessor #ifendif #endif 
hi link @preproc GruvboxAquaBold
" 使true false
hi link Boolean GruvboxPurpleBold
" 使static關鍵字為粗體
hi link @storageclass GruvboxOrangeBold 
" 使while、for、break設為bold
hi link @repeat GruvboxRedBold
" 使NULL設成粗體
hi link @constant.builtin GruvboxOrangeBold
" 使#、\粗體
hi link Macro GruvboxAquaBold 






" fzf 備忘用的快速鍵。 預設就有這些功能了，不要解除註解
" let g:fzf_action = {
"   \ 'ctrl-q': function('s:build_quickfix_list'),
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }



" 較不重要的設定
"
" Map F8 to Tagbar
" nmap <F8> :TagbarToggle<CR>


" fzf file search in split mode
" command! -bang -nargs=* Fzfsplit call fzf#vim#files(<q-args>, {'dir': expand('%:p:h'), 'options': '--reverse', 'sink': 'split'})


"" ASM == JDH8
" augroup jdh8_ft
"   au!
"   autocmd BufNewFile,BufRead *.asm    set filetype=jdh8
" augroup END


" JFlex syntax highlighting
" augroup jfft
"   au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
" augroup END
" au Syntax jflex    so ~/.vim/syntax/jflex.vim


"這個命令的意思是當你打開一個 C 或 C++ 檔案時，Vim 會自動設定一個新的映射，這個映射的意思是：
"將當前編輯的檔案寫入磁碟。
"執行 g++ 編譯當前編輯的檔案。
"如果編譯成功，就執行 ./a.out 來執行生成的執行檔。
" " 已棄用
" autocmd FileType c nnoremap ;r :w<CR>:!gcc % && ./a.out<CR>
" 已棄用
" autocmd FileType cpp nnoremap ;r :w<CR>:!g++ % && ./a.out<CR>
" 已棄用
" autocmd FileType python nnoremap ;r :w<CR>:!python3 %<CR>
