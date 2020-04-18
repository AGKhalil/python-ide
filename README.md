# python-ide
A docker image for python development on the command line.

## Installation
Based on your desired usage you can add the following to your `.bashrc`. Don't forget to source your `.bashrc`!
### All three
To use the full image with `neovim`, `tmux`, and `pudb3`:
```
alias dev-ide=`docker run -it --rm -v $(pwd):/src --workdir /src agkhalil/python-ide:latest`
```
Then go to your directory of choice and simply run `dev-ide`. You can now run any of the three.
### Just `neovim`
```
function nvim {
	docker run -it --rm -v $(pwd):/src --workdir /src agkhalil/python-ide:latest nvim "$1"
}
```
Now you can just run `nvim` like you would with any text editor.

## Features
This image includes three main aspects:
- `neovim` - a lightweight alternative to `vim`. I’ve customised it a fair amount. Basically I turned it into a python IDE.
- `tmux` - for convenient screen splitting and management. I configured it to have similar navigation controls to `vim`.
- `pudp` - this is a python debugger on the command line. It creates an IDE to debug code. It’s pretty great actually. It has an interactive shell, easy pointbreak management, and saves all variables etc.

### `neovim` configuration
The installed packages are:
- [`jedi-vim`](https://github.com/davidhalter/jedi-vim) - for navigating code (go to definition, rename all, go to assignment). Auto complete is disabled as `deoplete` takes care of that.
- [`deoplete`](https://github.com/Shougo/deoplete.nvim) - for auto complete.
- [`vim-visual-multi`](https://github.com/mg979/vim-visual-multi) - for multi cursor select like in Sublime Text.
- [`auto-pairs`](https://github.com/jiangmiao/auto-pairs) - auto insert or delete parenthesis, brackets, etc.
- [`nerdcommenter`](https://github.com/preservim/nerdcommenter) - for ease of commenting code.
- [`nerdtree`](https://github.com/preservim/nerdtree) - for file navigation.
- [`ale`](https://github.com/dense-analysis/ale) - lint engine
- [`isort`](https://github.com/stsewd/isort.nvim) - sorts imports in file.
- [`indentpython`](https://github.com/vim-scripts/indentpython.vim) - for proper python indentation.
- [`gruvbox`](https://github.com/morhetz/gruvbox) - dark theme.

### `neovim` mappings 
- `<leader>` - `;`
- `space` - folds functions, methods, classes, etc.
- `<Enter>` - new line (even in normal mode)
- `<leader>g` - go to function
- `<leader>d` - go to definition
- `<leader>r` - rename variable (all instances)
- `<leader>n` - down autocomplete (in insert mode)
- `<leader>p` - up autocomplete (in insert mode)
- `<leader>n` - multi cursor select (in normal mode)
- `<leader>cc` - comment out code
- `<leader>ci` - comment in code
- `<leader>t` - toggle `nerdtree`
- `C-w` + `j,j,k,l,` - change pane inside `nvim`
- `i` - open file in new pane `nerdtree`
- `<Enter>` - open file in current pane `nerdtree`
- `:ALEFix` - fixes lint errors using `yapf`
- `:Isort` - fixes imports

### `tmux` mappings
- `C-b` is replaced with `C-;`
- arrow keys are replaced with `h,j,k,l` 
- `C-;` + `h,j,k,l` to switch pane
- `C-;` + `C-h,j,k,l` to resize panes
- `C-;` + `s` - split horizontally
- `C-;` + `v` - split vertically
- all other commands as usual except with `C-;` instead of `C-b`
