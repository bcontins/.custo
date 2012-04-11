#!/bin/bash
scriptdir="$( cd "$( dirname "$0" )" && pwd )"
source $scriptdir/../../common/scripts/ini-parser.sh

# Link folders

ln -s $scriptdir/../config/_vim $HOME/.vim
ln -s $scriptdir/../config/_vimrc $HOME/.vimrc

# Get the vim plugins from github

cd $scriptdir/../../


git submodule add http://github.com/tpope/vim-fugitive.git vim/config/_vim/bundle/fugitive
git submodule add https://github.com/tpope/vim-git.git vim/config/_vim/bundle/git
git submodule add https://github.com/sjl/gundo.vim.git vim/config/_vim/bundle/gundo
git submodule add https://github.com/sontek/minibufexpl.vim.git vim/config/_vim/bundle/minibufexpl
git submodule add https://github.com/alfredodeza/pytest.vim.git vim/config/_vim/bundle/py.test
git submodule add https://github.com/vim-scripts/The-NERD-tree.git vim/config/_vim/bundle/nerdtree

git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
