#!/etc/bash

declare -a history

	clear
	echo "must be integers only, use symbols + - * /"
	echo "disclaimer: history clears every exit (save func coming soon)"
	echo
	echo -n enter equation: 
	read equation
	echo
	result=$(echo "$equation" | bc)
	echo $result
	history+=("$result")
	echo "again?"
	read ans 
	if [ "$ans" = "1" ] 
	
