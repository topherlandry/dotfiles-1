#!/bin/bash
HOME=/home/dave
for OUTPUT in $(cat filelist)
do
  cp -rp "$HOME/$OUTPUT" ~/src/dotfiles/
  echo "copied $HOME/$OUTPUT to ~/src/dotfiles"
done
