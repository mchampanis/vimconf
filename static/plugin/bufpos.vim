" BufPos:  Activate a buffer by its position number in the buffers
"          list
" Author:  Michele Campeotto <michele@campeotto.net>
" Date:    2007-04-25
" Version: 1.0
"
" Modified: mchampanis <michael.champanis@gmail.com>
"
" This script provides a function to activate a vim buffer by passing it the
" position in the buffers list and maps it to <Leader>number to easily switch
" between open buffers.
"
" This is best used togheter with the buftabs plugin:
"   http://www.vim.org/scripts/script.php?script_id=1664


function! BufPos_ActivateBuffer(num)
  if bufname("%") != "_NERD_tree_"
    let l:count = 1
    for i in range(1, bufnr("$"))
        if buflisted(i) && getbufvar(i, "&modifiable") 
            if l:count == a:num
                exe "buffer! " . i
                return 
            endif
            let l:count = l:count + 1
        endif
    endfor
    echo "No buffer!"
  else
    echo "Don't change the NERD Tree, dude..."
  endif
endfunction

function! BufPos_Initialize()
    for i in range(1, 9) 
        exe "map <Leader>" . i . " :call BufPos_ActivateBuffer(" . i . ")<CR>"
        exe "imap <Leader>" . i . " <ESC>:call BufPos_ActivateBuffer(" . i . ")<CR>i"
    endfor
    exe "map <Leader>0 :call BufPos_ActivateBuffer(10)<CR>"
    exe "imap <Leader>0 <ESC>:call BufPos_ActivateBuffer(10)<CR>i"
endfunction

call BufPos_Initialize()
