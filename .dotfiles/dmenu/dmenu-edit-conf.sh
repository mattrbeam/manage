#!/usr/bin/env bash
#
# Dmenu script for editing my dotfiles

set -eu -o pipefail

[[ -z "$XDG_CONFIG_HOME" ]] && XDG_CONFIG_HOME="$HOME/.config"

declare options=("bspwm
neovim
picom
polybar
sxhkd
xinitrc
xprofile
xresources
zprofile
zsh
zsh/prompt
quit")

choice=$(echo -e "${options[@]}" | dmenu -i -p 'Edit config file: ')

case "$choice" in
    bspwm)      dotfile="$XDG_CONFIG_HOME/bspwm/bspwmrc" ;;
    neovim)     dotfile="$XDG_CONFIG_HOME/nvim/init.vim" ;;
    picom)      dotfile="$XDG_CONFIG_HOME/picom/picom.conf" ;;
    polybar)    dotfile="$XDG_CONFIG_HOME/polybar/config" ;;
    sxhkd)      dotfile="$XDG_CONFIG_HOME/sxhkd/sxhkdrc" ;;
    xinitrc)    dotfile="$HOME/.xinitrc" ;;
    xprofile)   dotfile="$XDG_CONFIG_HOME/.xprofile" ;;
    xresources) dotfile="$XDG_CONFIG_HOME/.Xresources" ;;
    zprofile)   dotfile="$HOME/.zprofile" ;;
    zsh)        dotfile="$XDG_CONFIG_HOME/zsh/.zshrc" ;;
    zsh/prompt) dotfile="$XDG_CONFIG_HOME/zsh/prompt.zsh" ;;
    *) exit 1 ;;
esac

st -e $EDITOR "$dotfile"
