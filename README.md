# NeoVIM configuration files by Gijs Groote

### inspired by tutorial [Medium Neovim for Beginners series.](https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a)

to the .bashrc add

`` 
# neovim alias
NVIM_CONFIG_PATH=~/.config/
export NVIM_CONFIG_PATH
alias vim='XDG_DATA_HOME=$NVIM_CONFIG_PATH/share XDG_CONFIG_HOME=$NVIM_CONFIG_PATH nvim'
``
