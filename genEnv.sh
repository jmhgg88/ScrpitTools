#!/bin/bash
CTAGS_LOCAL_PATH=`pwd`
echo "Current code root path is "$CTAGS_LOCAL_PATH

DIR_ARRAY=`cat ~/.ProjectFileList`

generate_tag_filename()
{
	dir=$1
	#replase "/" to "_"
	export tmp_tag_filename=".indexof_"${dir//"/"/"_"}"_tags"
}

generate_ctags_for_directory()
{
	echo "Goto directory "$1
	cd $1
	if [ $? -eq 0 ]; then
		echo "enter "$1" execute success"
		
		ctags -R `pwd` --fields=+IS
		generate_tag_filename $1
		echo "===>Tag file name is "$tmp_tag_filename
		cp tags ~/.ctags/$tmp_tag_filename
        if [ $? -eq 0 ]; then
            echo "copy tags to "$tmp_tag_filename" success"
        else
            echo "copy tags to "$tmp_tag_filename" fail"
        fi
		cd $CTAGS_LOCAL_PATH
	else
		echo "enter "$1" execute fail"
	fi
}

generate_tag_store_directory()
{
	ctags_directory=~/.ctags
	if [ ! -d "$ctags_directory" ]; then
		echo "Generate ctags directory at ~/.ctags.."
		mkdir ~/.ctags
	else
		echo ".ctags directory is already exist, clear it!"
		rm ~/.ctags/ -rf
		mkdir ~/.ctags
	fi
}

set_tag_to_vimrc()
{
	echo "Try to find filename "$1" in .vimrc"
	grep $1 ~/.vimrc
	if [ $? -eq 0 ]; then
		echo "Found "$1" in .vimrc"
	else
		echo $1" not found in .vimrc, add it!"
		echo "set tags +=~/.ctags/"$tmp_tag_filename >> ~/.vimrc
	fi
}

clear_cscope_files()
{
	rm ~/.tmp.cscope.files
	rm ~/.cscope.out
}

generate_cscope_files()
{
	echo "generate cscope file in "$1
	find -P $1 -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.java" -o -name "*.cc" >> ~/.tmp.cscope.files
}

generate_cscope_environment()
{
	cscope -R -b -i ~/.tmp.cscope.files
	cp cscope.out ~/.cscope.out
}

main()
{
	generate_tag_store_directory
	clear_cscope_files
	echo "start to generate for directory below:"
	for dir in ${DIR_ARRAY[@]}
	do
		echo ${dir}
		generate_ctags_for_directory ${dir}
		set_tag_to_vimrc $tmp_tag_filename
		generate_cscope_files `pwd`"/"${dir}
	done

	generate_cscope_environment
}

main $@











