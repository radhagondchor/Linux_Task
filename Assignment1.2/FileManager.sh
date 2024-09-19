#!/bin/bash

choice=$1
addrs=$2
dir_file=$3
num=$4

case $choice in 
addDir)
 
	 mkdir -p /$addrs/$dir_file ;; 

listFiles)

	ls -p /$addrs | grep -v / ;;
 
listDirs)

	ls -d /$addrs/*/  ;;

listAll)

	cd /$addrs/ 
	ls -al  ;;

deleteDir)
	rmdir /$addrs/$dir_file ;;

addFile)
	echo "initial content" > /$addrs/$dir_file ;;

addContentToFile)
	echo  "additional content" >> /$addrs/$dir_file ;;

addContentToFileBegining) 
	echo  "additional content" > /$addrs/$dir_file ;;

showFileBeginingContent)
	head -n $num /$addrs/$dir_file ;;

showFileEndContent)
	tail -n $num /$addrs/$dir_file ;;

showFileContentAtLine)
	head -n $num  /$addrs/$dir_file | tail -n 1 ;;

showFileContentForLineRange)
	head -n 10 /$addrs/$dir_file | tail -n 5 ;; 

moveFile) 
	mv /$addrs /$dir_file ;;

copyFile) 
	cp /$addrs /$dir_file ;;

clearFileContent)
	cat > /$addrs/$dir_file ;;

deleteFile)
	rm -rf /$addrs/$dir_file ;;
esac
