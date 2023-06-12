# My config and cheatsheet for neovim
>with COC installed clangd, coc-python

## BINDS:
### [ compilers ] 
```
F8 - compile cpp,
F9 - run py,cpp (without cmd input), 
F10 - run py,cpp (with cmd input)
````
#### [ moving ] 
```
j - line up, 
k - line down, 
h - left, 
l - right
```
### [ nerd ] 
```
F2 - open NERDTree,
Alt+left - open previous NERDTree tab,
Alt+right - open next NERDTree tab,
Alt+w - close tab
```
### [ text editing ]
```
i - enter to insert mode,
a - cursor +1 to right and enter insert mode,
A - cursor to end of the row and enter insert mode,
o - new row (below current) and enter insert mode,
O - new row (above current) and enter insert mode,
f<symbol> - goto current symbol,
//<phrase> - find phrase in document,
n - got to next definition (in find),
/<phrase> - search phrase in document below cursor,
?<phrase> - search phrase in document above cursor,
m<name> - make mark with name,
'<name> - goto mark,
dw - delete word,
u - undo,
C - replace all text to the end of the row,
D - delete left part of the rom from cursor,
V - select full row (and you can go top/bot with up/down to select others),
q<number> - start/stop recording macros with number (in it use commands),
@<number> - use macros (and we can use numbers before it to do it n times),
gg - goto first row,
G - goto last row,
w - (word) move to next word,
b - (back word) move to prev word,
e - go to the end of next word
Ctrl+/ - comment,
dd (in NORMAL) - delete line,
cc (in NORMAL) - clear line,
F3 - rename variable,
jk - escape to NORMAL mode,
gd - coc-defenition,
gy - coc-type-definition,
gi - coc-implementation,
gr - coc-references,
yy - copy current line (yank),
p - paste copied line after selected,
Shift - p paste copie line before selected,
Ctrl+up/down - moving line up/down
```
p.s.
also you can use number+command to use command n times
(for example 2w)
