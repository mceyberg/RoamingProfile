#!/bin/bash

# We need to be in our home directory to run this.
pushd ~

# Pull down the roaming profile repo
env git clone https://github.com/mceyberg/RoamingProfile.git ~/.roaming_profile

# All the config files
configs=( ".bash_aliases" ".gitconfig" ".gitignore" ".pryrc" ".vimrc" ".warprc" )

# Create soft links for all configuration files in .roaming_profile.
# Back the specified file up if a copy exists already with the .backup suffix
for config_file in ${configs[*]}; do
  ln --backup --suffix=.backup -s .roaming_profile/${config_file}
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

popd

