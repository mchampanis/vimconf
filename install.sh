#!/bin/bash

# check if ~/.vim exists
if [[ ! -d ~/.vim ]]; then
  mkdir ~/.vim
fi

# backup existing .vimrc
if [[ -s ~/.vimrc ]]; then
  mv ~/.vimrc ~/.vim/.vimrc.mine
fi

# install the rest of the package
cp -f static/vimrc-home ~/.vimrc
cp -f static/vimrc ~/.vim/.vimrc
cp -fR static/colors static/ftdetect static/plugin ~/.vim

if [[ ! -d ~/.vim/ruby ]]; then
  mkdir ~/.vim/ruby
fi

cp src/fuzzy_file_finder/lib/fuzzy_file_finder.rb ~/.vim/ruby/
cp src/fuzzyfinder_textmate/fuzzyfinder_textmate.vim ~/.vim/plugin/
cp src/NERDTree/plugin/NERD_tree.vim ~/.vim/plugin/

# remove old vimfuzzyfinder file
if [[ -f ~/.vimfuzzyfinder ]]; then
  rm ~/.vimfuzzyfinder
fi

echo "Done."
