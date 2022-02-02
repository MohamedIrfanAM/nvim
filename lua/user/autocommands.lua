vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd InsertEnter * :let @/=""
  augroup end

  augroup _cp
    autocmd!
    autocmd TextChanged *.ans[1-9],*.in[1-9] silent! %s/\r$/
    let last_cursor_found = 1
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | else |let last_cursor_found = 0 |endif
    autocmd BufReadPost *.cpp if last_cursor_found == 0 | call feedkeys("/while(tst--)\<CR>:\<BS>\<ESC>2j2li") | endif
    autocmd BufWinEnter *.ans[1-9],*.in[1-9] set nobuflisted
    autocmd TermOpen * setlocal nonumber | setlocal signcolumn=no
  augroup end

  augroup _vimtex
    autocmd!
    autocmd FileType tex setlocal wrap
    autocmd User VimtexEventView call b:vimtex.viewer.xdo_focus_vim()
    autocmd BufReadPost *.tex call feedkeys("\<space>ll")
    autocmd BufWritePost *.tex call timer_start(1000, { tid -> execute('call feedkeys("\<space>lv")')})  
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
