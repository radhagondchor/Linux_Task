#!/bin/bash

add_ssh() {
        echo "
		Host $name
                user $username
                Hostname $IP_add
                port $port_name
                IdentityFile $path
  	" >> ~/.ssh/config
}


list_server() {
           grep 'Host ' ~/.ssh/config | awk '{print $2}'


}



delete_server() {
	echo "Deleting SSH entry for $name..."
    	sed -i "/^Host $name$/,/^$/d" ~/.ssh/config
    	echo "Deleted SSH entry for $name."
 }

 connect_ssh() {
   	if ! grep -q "Host $name" ~/.ssh/config; then
        	echo "[ERROR]: Server information is not available, please add server first"
    	else
        	ssh $name
    	fi

}

update_ssh() {
	delete_server
    	add_ssh
    	echo "Updated SSH entry for $name."
}


while getopts "Ldan:h:u:p:i:D:N:U" opt; do
    	case $opt in
        a)
            	ACTION="add"
            	;;
        n)
            	name="$OPTARG"
            	;;
        h)
            	IP_add="$OPTARG"
            	;;
        u)
            	username="$OPTARG"
            	;;
       p)    	
	       port_name="$OPTARG"
               ;;
       i)     	
	       path="$OPTARG"
         	;;
       L)     	
	       ACTION="list"
               	;;
       D)     	
	       ACTION="delete"; name="$OPTARG" ;
         	;;
       N)     
	       ACTION="connect"; name="$OPTARG"
               ;;
       U)     
	       ACTION="update"
                ;;



    esac
done
case $ACTION in
          "add") 
		  add_ssh
                  ;;

          "list") 
		  list_server
                  ;;

          "delete")
                    delete_server 
		    ;;

           "connect")
                   connect_ssh
                   ;;
            "update")
                    update_ssh
                    ;;
  esac
