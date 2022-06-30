#!/usr/bin/sh

NVIM_CONFIG_PATH=~/.config/
export NVIM_CONFIG_PATH

rm -rf $NVIM_CONFIG_PATH

mkdir -p $NVIM_CONFIG_PATH/share
mkdir -p $NVIM_CONFIG_PATH/nvim

stow --restow --target=$NVIM_CONFIG_PATH/nvim .

# I am calling this vim, while it actually is Neo VIM
alias vim='XDG_DATA_HOME=$NVIM_CONFIG_PATH/share XDG_CONFIG_HOME=$NVIM_CONFIG_PATH nvim'

    
