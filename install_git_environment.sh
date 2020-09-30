#!/bin/bash
LOCAL_PATH=`pwd`

cp "$LOCAL_PATH"/gitmsg ~/.gitmsg -f
git config --global user.name "Jerome"
git config --global user.email "minghui.jiang.sh@gmail.com"
git config --global core.editor "vim"
git config --global commit.template ~/.gitmsg

echo "git environment set successfully!"

