#!/usr/bin/sh

NVIM_BEGINNER=~/.config/
export NVIM_BEGINNER

rm -rf $NVIM_BEGINNER

mkdir -p $NVIM_BEGINNER/share
mkdir -p $NVIM_BEGINNER/nvim

stow --restow --target=$NVIM_BEGINNER/nvim .

alias vim='XDG_DATA_HOME=$NVIM_BEGINNER/share XDG_CONFIG_HOME=$NVIM_BEGINNER nvim' 

export vim 
