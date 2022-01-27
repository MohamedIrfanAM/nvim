vim.cmd [[
try
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
  highlight VertSplit guifg=#2E3440
  highlight LightspeedGreyWash guifg=#616e88
  highlight LightspeedLabel gui=bold,underline guifg=#88c0d0
  highlight LightspeedLabelOverlapped gui=underline guifg=#88c0d0
  highlight LightspeedShortcut gui=bold,underline guifg=#3B4252 guibg=#88c0d0
  highlight LightspeedOneCharMatch gui=bold guifg=#3B4252 guibg=#88c0d0
  highlight LightspeedPendingOpArea guifg=#3B4252 guibg=#88c0d0
]]
