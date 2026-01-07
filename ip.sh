#!/bin/bash
check_ip(){
        local name=$1
        local ip=$2
        local server=$3
        check=$(nslookup $name $server | awk '/^Address: / {print $2}' | tail -n 1)
        if [ "$ip" = "$check" ]; then 
                echo "IP Address matches" 
        else
                echo "Bogus IP for {$name} in /etc/hosts!"
        fi
}
name=$1
ip=$2
server=$3
check_ip "$name" "$ip" "$server"

exit 0

