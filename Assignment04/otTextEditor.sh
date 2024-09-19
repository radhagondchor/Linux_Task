#!/bin/bash
#set +x

choice=$1
case $choice in

addLineTop)

	filename=$2
	text=$3
	sed -i "1i\\$text" "$filename"
	;;

addLineBottom)

	filename=$2
	text=$3
	sed -i '$a\'"$text" "$filename"
	;;

addLineAt)

	filename=$2
	text=$3
	num=$4
        sed -i "${num}i ${text}" "$filename"
        ;;

updateFirstWord)

	filename=$2
	word1=$3
	word2=$4
	sed -i "s/\b$word1\b/$word2/" "$filename"
	;;

updateAllWords)

	filename=$2
	word1=$3
	word2=$4
    	sed -i "s/\b$word1\b/$word2/" "$filename"
	;;

insertWord)

        filename=$2
        word1=$3
        word2=$4
        sed -i "s/\b$word1\b/& $word2/" "$filename"
        ;;

deleteLine)

	filename=$2
	num=$3
	sed -i "$num"'d' $filename
	;;

deleteLineWord)

	filename=$2
	num=$3
	sed -i "$num"'d' $filename
	;;

*)
	echo "Invalid Choice"
	;;
esac

