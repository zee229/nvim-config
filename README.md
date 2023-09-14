# My config and cheatsheet for neovim
>with vim-plug https://github.com/junegunn/vim-plug
>with COC installed coc-clangd, coc-python, coc-htmldjango, coc-pydocstring, coc-java, coc-tsserver, coc-html, coc-go
## BINDS:
### [ compilers ] 
```
F8 - compile c/cpp,
F9 - run py,c/cpp/py/js/java/go (without cmd input), 
F10 - run py,c/cpp/py/js/java/go (with cmd input)
````
#### [ moving ] 
```
j - line up, 
k - line down, 
h - left, 
l - right
gg - goto first row,
G - goto last row,
w - (word) move to next word,
b - (back word) move to prev word,
e - go to the end of next word
```
### [ nerdtree/tabs/windows ] 
```
F2 - open NERDTree,
Alt+left - open previous tab,
Alt+right - open next tab,
Alt+w - close tab,
Ctrl+t - open terminal in new tab

Ctrl+e - vertical window split
Ctrl+w h - move to the window on the left
Ctrl+w j - move to the window below
Ctrl+w k - move to the window above
Ctrl+w l - move to the window on the right
Ctrl+w t - move to the TOP window
Ctrl+w b - move to the BOTTOM window
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
Ctrl+up/down - moving line up/down,
Tab/Shift+Tab - selected text tabulation (in SELECT mode)
```
p.s.
also you can use number+command to use command n times
(for example 2w)
