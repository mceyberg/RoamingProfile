#!/bin/bash

# Pull down the roaming profile repo
git clone https://github.com/mceyberg/roaming_profile.git ~/.roaming_profile

# Back the specified file up if a copy exists already
backup () {
  if [ -f "../$1" ]; then
    echo "Backing up file $1"
    mv "../$1" "../$1.backup"
  fi
}

# All the config files
declare -a configs=(.bash_aliases .gitconfig .gitignore .pryrc .vimrc .warprc)

for config_file in ${config}; do
  backup ${config_file} && ln -s ${config_file} ..
done

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Run the 'PluginInstall' command to load all the plugins set in .vimrc
vim +PluginInstall +qall

# If we are running OS X, deploy Sublime and ITerm settings
if [[ "uname" == 'Darwin' ]]; then
  sublime_app_dir="Library/Application\ Support/Sublime\ Text\ 3/Packages/User"
  ln -s $sublime_app_dir/Default\ \(OSX\).sublime-keymap ~/$sublime_app_dir/
  ln -s $sublime_app_dir/Preferences.sublime-settings ~/$sublime_app_dir/
fi
