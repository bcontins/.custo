#!/bin/bash
scriptdir="$( cd "$( dirname "$0" )" && pwd )"
source $scriptdir/../../common/scripts/ini-parser.sh
set -x
# Link folders

if [ -L $HOME/.tmux.conf ]
then
    rm $HOME/.tmux.conf
fi

ln -s $scriptdir/../config/_tmux.conf $HOME/.tmux.conf

