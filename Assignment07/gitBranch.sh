#!/bin/bash

choice=$1

case "$choice" in
    -l)
        git branch | sed 's/^\*//g' | sed 's/ //g'
     ;;

    -b)
        branch_name="$2"
        git branch "$branch_name"
        echo "Branch '$branch_name' created."
        ;;
    -d)
        branch_name="$2"
        git branch -d "$branch_name"
        echo "Branch '$branch_name' deleted."
        ;;
    -m)
        if [ "$2" = "-1" ] && [ "$4" = "-2" ]; then
            branch_name1="$3"
            branch_name2="$5"
            git checkout "$branch_name2"
            git merge "$branch_name1"
            echo "Merged branch '$branch_name1' into '$branch_name2'."
        else
            echo "Usage: ./gitBranch.sh -m -1 <branch_name1> -2 <branch_name2>"
            exit 1
        fi
        ;;
     -r)
        if [ "$2" = "-1" ] && [ "$4" = "-2" ]; then
            branch_name1="$3"
            branch_name2="$5"
            git checkout "$branch_name1"
            git rebase "$branch_name2"
            echo "Rebased branch '$branch_name1' onto '$branch_name2'."
        else
            echo "Usage: ./gitBranch.sh -r -1 <branch_name1> -2 <branch_name2>"
            exit 1
        fi
        ;;
esac

