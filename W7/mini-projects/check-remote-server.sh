echo -n "Enter the host of the server you want to check: "
read -r host
ping -q -c 1 "$host" > /dev/null 2>&1 && echo "$host is online!" || echo "$host is offline!"
