#colorscheme solarized-dark
colorscheme gruvbox
set global tabstop 4
set global indentwidth 0
addhl global/ number-lines
addhl global/ show-whitespaces -tab · -lf ' ' -spc ' '
addhl global/ regex "[ \t]+$" 0:black,red
addhl global/ wrap