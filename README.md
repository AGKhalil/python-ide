# python-ide
A docker image for python development on the command line.

## Installation
Add the following to your `.bashrc`: 
`alias dev-ide='docker run -it --rm -v $(pwd):/src --workdir /src agkhalil/python-ide:latest'`
Then go to your directory of choice and simply run `dev-ide`

## Features
This image includes three main aspects:
- `neovim` - a lightweight alternative to `vim`. I’ve customised it a fair amount. Basically I turned it into a python IDE.
- `tmux` - for convenient screen splitting and management. I configured it to have similar navigation controls to `vim`.
- `pudp` - this is a python debugger on the command line. It creates an IDE to debug code. It’s pretty great actually. It has an interactive shell, easy pointbreak management, and saves all variables etc.

### `neovim` configuration
The installed packages are:
- 
