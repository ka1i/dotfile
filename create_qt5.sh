#!/bin/bash --posix
#
# NAME:  Create empty Qt5.12 Template
# VER:   Qt5.12
# PLAT:  linux-all

PREFIX=$PWD

echo -en "Welcome to Create empty Qt5.12 Template\n"
echo -en "Please, press ENTER to continue\n"
echo -en ">>> "
read -r dummy

echo -en "\n\033[31;91m***Notice***\033[0m\n===================\n\n"

echo -en "Template will now be create into this location:\n"
echo -en "${PREFIX}/\n\n"
echo -en "  - Press ENTER to confirm the location\n"
echo -en "  - Press CTRL-C to abort the operation\n"
echo -en "  - Or specify a different location below\n\n"
echo -en "$PREFIX >>>"
read -r user_prefix
if [ "$user_prefix" != "" ]; then
    case "$user_prefix" in
        *\ * )
            printf "ERROR: Cannot create into directories with spaces\\n" >&2
            exit 1
            ;;
        *)
            PREFIX=${user_prefix}
            if ! mkdir -p "$PREFIX"; then
    			printf "ERROR: Could not create directory: '%s'\\n" "$PREFIX" >&2
    			exit 1
			fi
            PREFIX=$(cd "$PREFIX"; pwd)
            export PREFIX
            echo -en "PREFIX=${PREFIX}"
            Initialize_directory_struct
            ;;
    esac
fi

Initialize_directory_struct(){
	echo -en "Initialize directory struct\n"
	echo -en "Create Application Component Directory"
	mkdir -p ${PREFIX}/build/Debug
	mkdir -p ${PREFIX}/build/Release
	echo -en "  [ \033[34mOK\033[0m ]\n"
	echo -en "Create Application File CMakeLists.txt"
	echo -en ""
}
#read project_path
echo "请输入项目名称"
#read project_name

