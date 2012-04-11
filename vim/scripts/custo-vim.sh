#!/bin/bash
scriptdir="$( cd "$( dirname "$0" )" && pwd )"

ln -s $scriptdir/../config/.vimrc $HOME/.vimrc
ln -s $scriptdir/../config/.vim $HOME/.vim
