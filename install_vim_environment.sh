#!/bin/bash
LOCAL_PATH=`pwd`

sudo apt-get install cscope
sudo apt-get install ctags
sudo apt-get install silversearcher-ag

if [ ! -d "$LOCAL_PATH/tmp" ]; then
	echo "Create temporary diectory of $LOCAL_PATH/tmp"
	mkdir tmp
else
	echo "Delete $LOCAL_PATH/tmp, recreate it!"
	rm "$LOCAL_PATH/tmp" -rf
	mkdir tmp
fi


if [ ! -d ~/.vim ]; then
	echo "Create ~/.vim diectory"
	mkdir ~/.vim
else
	echo "Delete ~/.vim, recreate it!"
	rm ~/.vim -rf
	mkdir ~/.vim
fi


if [ ! -d ~/.vim/bundle ]; then
	echo "Create ~/.vimi/bundle diectory"
	mkdir ~/.vim/bundle
else
	echo "Delete ~/.vim/bundle, recreate it!"
	rm ~/.vim/bundle -rf
	mkdir ~/.vim/bundle
fi

unzip vim-pathogen-master.zip -d "$LOCAL_PATH/tmp"
mv "$LOCAL_PATH"/tmp/vim-pathogen-master/autoload ~/.vim/

unzip NERD_tree.zip -d ~/.vim/bundle/NERD_tree
unzip taglist_46.zip -d ~/.vim/bundle/taglist_46

cp "$LOCAL_PATH"/vimrc ~/.vimrc -f
cp "$LOCAL_PATH"/ProjectFileList ~/.ProjectFileList -f
cp "$LOCAL_PATH"/genEnv.sh ~/bin/genEnv -f

rm "$LOCAL_PATH"/tmp -rf

echo "vim environment successfully!"

