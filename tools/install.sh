#!/bin/bash

set OLD_PATH=$PATH

# We need to be in our home directory to run this.
pushd ~

# Clone the roaming profile repo, or pull changes
if [[ -d ~/.roaming_profile ]]; then
	echo "Roaming profile found, leaving untouched."
	pushd .roaming_profile
	git fetch
	git pull
	popd
else
	env git clone https://github.com/mceyberg/RoamingProfile.git ~/.roaming_profile
fi

# All the config files
configs=( ".bash_aliases" ".gitconfig" ".gitignore" ".pryrc" ".vimrc" ".warprc" ".zshrc" )

# Create soft links for all configuration files in .roaming_profile.
# Back the specified file up if a copy exists already with the .backup suffix
for config_file in ${configs[*]}; do
  # File is a symbolic link. Remove and replace it.
  [ -h ~/${config_file} ] && rm ~/${config_file}

  # File already exists. Add .backup suffix.
  [ -f ~/${config_file} ] && mv ~/${config_file} ~/${config_file}.backup
  ln -s .roaming_profile/${config_file}
done

# Install Vundle
env git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +source % +qall
# Run the 'PluginInstall' command to load all the plugins set in .vimrc
vim +PluginInstall +qall

# If we are running OS X, deploy Sublime and ITerm settings and install Homebrew
if [[ "uname" == 'Darwin' ]]; then
  sublime_app_dir="Library/Application\ Support/Sublime\ Text\ 3/Packages/User"
  keymap_file="Default\ \(OSX\).sublime-keymap"
  prefs_file="Preferences.sublime-settings"

  if [ -d ~/$sublime_app_dir/ ]; then
	echo "Sublime preference files found, attempting to keep them and overwriting existing configurations. To revert changes, use git."
	mv -i ~/$sublime_app_dir/$keymap_file $sublime_app_dir/
	mv -i ~/$sublime_app_dir/$prefs_file $sublime_app_dir/
  fi
  ln -s $sublime_app_dir/$keymap_file ~/$sublime_app_dir/
  ln -s $sublime_app_dir/$prefs_file ~/$sublime_app_dir/

  # Install Homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
  brew install wget
fi

# Install Oh-My-Zsh. This needs to be run last since it starts up a new zsh instance at the end of its run.
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Remove the oh-my-zsh generated config
rm ~/.zshrc
mv ~/.zshrc.pre* ~/.zshrc


popd

