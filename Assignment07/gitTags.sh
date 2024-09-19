#!/bin/bash

choice=$1
        case "$choice" in
            -t)

                tag_name="$2"
                git tag "$tag_name"
                echo "Tag created: $tag_name"
                ;;
	    -l)
		    git tag
		    ;;

            -d)
          
                tag_name="$2"
                git tag -d "$tag_name"
                echo "Tag deleted: $tag_name"
                ;;

             *)
		echo "invalid command" ;; 
esac

