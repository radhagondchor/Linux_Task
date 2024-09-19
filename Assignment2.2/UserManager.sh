#!/bin/bash

choice=$1

case $choice in 
	addTeam)
		addgroup=$2
         	sudo addgroup $addgroup
	       echo "successfully created group"  ;;

       addUser)
	      adduser=$2
	      addgroup=$3
	     sudo useradd -m -G $addgroup $adduser
	     sudo chmod 751 /home/$adduser
	     sudo mkdir -p  /home/$adduser/team /home/$adduser/ninja
	     sudo chown $adduser:$addgroup /home/$adduser/team
	     sudo chown $adduser:$addgroup /home/$adduser/ninja/
	     sudo chmod 770 /home/$adduser/team
	     sudo chmod 770 /home/$adduser/ninja 
	     echo "done"
	     ;;  

     changeShell)
	     username=$2
	     newshell=$3
	     sudo usermod -s $newshell $username
	     ;;
     changePasswd)
	     username=$2
	     sudo passwd $username
	     ;;
     delUser)
	     username=$2
	     sudo userdel $username
	     ;;
     delTeam)
	    groupname=$2
	   sudo groupdel #groupname
	   ;;
   ls)
	  user=$2
	  team=$3
	 cat /etc/passwd $user
	 cat /etc/group $team
	 ;;
esac
